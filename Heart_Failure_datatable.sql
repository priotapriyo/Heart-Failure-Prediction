Clear Screen;

SET SERVEROUTPUT ON;
SET VERIFY OFF;


drop table TrainData;

create table TrainData(
	Symptoms VARCHAR(80),
	Results VARCHAR(80)
	);
	
insert into TrainData values('High Blood Pressure','Yes');	
insert into TrainData values('Chest Pain','Yes');	
insert into TrainData values('Anaemia','Yes');	
insert into TrainData values('Creatinine Phosphoras','High');	
insert into TrainData values('Cholesterol','High');	
insert into TrainData values('Diabates','Yes');	
insert into TrainData values('Ejection_fraction','High');	
insert into TrainData values('Platelets','Low');	
--insert into TrainData values('Creatinine Sodium','High');	
insert into TrainData values('Rapid/Irregular Heartbeat','Yes');
insert into TrainData values('Shortness of breath with activity','Yes');
insert into TrainData values('Weakness','Yes');

CREATE OR REPLACE TRIGGER TD_Trig
BEFORE INSERT 
ON TrainData
DECLARE
BEGIN
	DBMS_OUTPUT.PUT_LINE('New Symptoms Insert');
END;
/
insert into TrainData values('Creatinine Sodium','High');

set lines 256
set trimout ON
set tab OFF

select * from TrainData;


drop table Patient1;

create table Patient1(
    pid INTEGER,
    Name VARCHAR(20),
    Age	INTEGER,
	Gender VARCHAR(10),
	Symptoms VARCHAR(50),
	Results VARCHAR(20));
	
insert into Patient1 values(001, 'Arnob',67,'Male','High Blood Pressure','yes');	
insert into Patient1 values(NULL, NULL, NULL, NULL,'Chest Pain','Yes');
insert into Patient1 values(NULL, NULL, NULL, NULL,'Cholesterol','High');
insert into Patient1 values(NULL, NULL, NULL, NULL,'Rapid/Irregular Heartbeat','Yes');
insert into Patient1 values(NULL, NULL, NULL, NULL,'Shortness of breath with activity','Yes');
insert into Patient1 values(NULL, NULL, NULL, NULL,'Weakness','Yes');
insert into Patient1 values(NULL, NULL, NULL, NULL,'Diabates','Yes');
insert into Patient1 values(NULL, NULL, NULL, NULL,'Anaemia','Yes');

SELECT *FROM Patient1;





drop table Patient2;
create table Patient2(
    pid INTEGER,
    Name VARCHAR(20),
    Age	INTEGER,
	Gender VARCHAR(10),
	Symptoms VARCHAR(50),
	Results VARCHAR(20));
	
insert into Patient2 values(002, 'Ahnaf',75,'Male','High Blood Pressure','yes');	
insert into Patient2 values(NULL, NULL, NULL, NULL,'Chest Pain','Yes');
insert into Patient2 values(NULL, NULL, NULL, NULL,'Cholesterol','High');
insert into Patient2 values(NULL, NULL, NULL, NULL,'Rapid/Irregular Heartbeat','Yes');
insert into Patient2 values(NULL, NULL, NULL, NULL,'Shortness of breath with activity','Yes');
insert into Patient2 values(NULL, NULL, NULL, NULL,'Weakness','Yes');
insert into Patient2 values(NULL, NULL, NULL, NULL,'Diabates','Yes');
insert into Patient2 values(NULL, NULL, NULL, NULL,'Anaemia','Yes');
insert into Patient2 values(NULL, NULL, NULL, NULL,'Ejection_fraction','High');	
insert into Patient2 values(NULL, NULL, NULL, NULL,'Platelets','Low');

UPDATE Patient2 SET Symptoms= where pid = 002;

SELECT *FROM Patient2;


drop table Patient3;
create table Patient3(
    pid INTEGER,
    Name VARCHAR(20),
    Age	INTEGER,
	Gender VARCHAR(10),
	Symptoms VARCHAR(50),
	Results VARCHAR(20));
	
insert into Patient3 values(003, 'Alim',75,'Male','High Blood Pressure','yes');	
insert into Patient3 values(NULL, NULL, NULL, NULL,'Cholesterol','High');
insert into Patient3 values(NULL, NULL, NULL, NULL,'Rapid/Irregular Heartbeat','Yes');
insert into Patient3 values(NULL, NULL, NULL, NULL,'Weakness','Yes');
insert into Patient3 values(NULL, NULL, NULL, NULL,'Diabates','Yes');
--insert into Patient3 values(NULL, NULL, NULL, NULL,'Anaemia','Yes');

SELECT *FROM Patient3;




--------------------------------Trigger patient---------------------------------------------


CREATE OR REPLACE TRIGGER P3_Trig
BEFORE INSERT 
ON Patient3
DECLARE
BEGIN
	DBMS_OUTPUT.PUT_LINE('New Symptoms Insert');
END;
/
insert into Patient3 values(NULL, NULL, NULL, NULL,'Anaemia','Yes');



drop table Patient4;
create table Patient4(
    pid INTEGER,
    Name VARCHAR(20),
    Age	INTEGER,
	Gender VARCHAR(10),
	Symptoms VARCHAR(50),
	Results VARCHAR(20));
	
insert into Patient4 values(004, 'Hridi',70,'Female','High Blood Pressure','yes');	
insert into Patient4 values(NULL, NULL, NULL, NULL,'Chest Pain','Yes');
insert into Patient4 values(NULL, NULL, NULL, NULL,'Cholesterol','High');
insert into Patient4 values(NULL, NULL, NULL, NULL,'Rapid/Irregular Heartbeat','Yes');
insert into Patient4 values(NULL, NULL, NULL, NULL,'Shortness of breath with activity','Yes');
insert into Patient4 values(NULL, NULL, NULL, NULL,'Weakness','Yes');
insert into Patient4 values(NULL, NULL, NULL, NULL,'Diabates','Yes');
insert into Patient4 values(NULL, NULL, NULL, NULL,'Anaemia','Yes');
insert into Patient4 values(NULL, NULL, NULL, NULL,'Ejection_fraction','High');	
insert into Patient4 values(NULL, NULL, NULL, NULL,'Platelets','Low');
insert into Patient4 values(NULL, NULL, NULL, NULL,'Creatinine Phosphoras','High');	
insert into Patient4 values(NULL, NULL, NULL, NULL,'Creatinine Sodium','High');

SELECT *FROM Patient4;






CREATE OR REPLACE FUNCTION traindata_count
RETURN NUMBER
IS
A NUMBER :=0;

BEGIN
    	
    SELECT COUNT(Symptoms) INTO A FROM TrainData;
	
    RETURN A;
	
END traindata_count;
/

DECLARE
   A NUMBER;
BEGIN
    A := traindata_count;
	DBMS_OUTPUT.PUT_LINE('Total data of Train dataset you collected : '||A );
END;
/	


CREATE OR REPLACE FUNCTION patientdata_count
RETURN NUMBER
IS
B NUMBER :=0;

BEGIN
				
	SELECT COUNT(Symptoms) INTO B FROM Patient1;
	--DBMS_OUTPUT.PUT_LINE('Symptoms of the patient who is attacked some diseases : '|| B );
				
	RETURN B;
				
END patientdata_count;
/


CREATE OR REPLACE FUNCTION patientdata_count2
RETURN NUMBER
IS
B2 NUMBER :=0;

BEGIN
				
	SELECT COUNT(Symptoms) INTO B2 FROM Patient2;
	--DBMS_OUTPUT.PUT_LINE('Symptoms of the patient who is attacked some diseases : '|| B2 );
				
	RETURN B2;
				
END patientdata_count2;
/


CREATE OR REPLACE FUNCTION patientdata_count3
RETURN NUMBER
IS
B3 NUMBER :=0;

BEGIN
				
	SELECT COUNT(Symptoms) INTO B3 FROM Patient3;
	--DBMS_OUTPUT.PUT_LINE('Symptoms of the patient who is attacked some diseases : '|| B3 );
				
	RETURN B3;
				
END patientdata_count3;
/


CREATE OR REPLACE FUNCTION patientdata_count4
RETURN NUMBER
IS
B4 NUMBER :=0;

BEGIN
				
	SELECT COUNT(Symptoms) INTO B4 FROM Patient4;
	--DBMS_OUTPUT.PUT_LINE('Symptoms of the patient who is attacked some diseases : '|| B4 );
				
	RETURN B4;
				
END patientdata_count4;
/


CREATE OR REPLACE FUNCTION Probability
RETURN NUMBER
IS
P NUMBER :=0;
X NUMBER;
Y NUMBER;

BEGIN
	X := traindata_count;
	Y := patientdata_count;
				
	--P := (patientdata_count(B) / traindata_count(A))*100;
	P := (Y/X)*100;
--	DBMS_OUTPUT.PUT_LINE('Probability of Heart-Failure of this patient is : ' || P);
	
	RETURN P;
				
END Probability;
/


CREATE OR REPLACE FUNCTION Probability2
RETURN NUMBER
IS
P2 NUMBER :=0;
X2 NUMBER;
Y2 NUMBER;

BEGIN
	X2 := traindata_count;
	Y2 := patientdata_count2;
				
	--P := (patientdata_count(B) / traindata_count(A))*100;
	P2 := (Y2/X2)*100;
	--DBMS_OUTPUT.PUT_LINE('Probability of Heart-Failure of this patient is : ' || P2);
	
	RETURN P2;
				
END Probability2;
/



CREATE OR REPLACE FUNCTION Probability3
RETURN NUMBER
IS
P3 NUMBER :=0;
X3 NUMBER;
Y3 NUMBER;

BEGIN
	X3 := traindata_count;
	Y3 := patientdata_count3;
				
	--P := (patientdata_count(B) / traindata_count(A))*100;
	P3 := (Y3/X3)*100;
	--DBMS_OUTPUT.PUT_LINE('Probability of Heart-Failure of this patient is : ' || P3);
	
	RETURN P3;
				
END Probability3;
/



CREATE OR REPLACE FUNCTION Probability4
RETURN NUMBER
IS
P4 NUMBER :=0;
X4 NUMBER;
Y4 NUMBER;

BEGIN
	X4 := traindata_count;
	Y4 := patientdata_count4;
				
	--P := (patientdata_count(B) / traindata_count(A))*100;
	P4 := (Y4/X4)*100;
	--DBMS_OUTPUT.PUT_LINE('Probability of Heart-Failure of this patient is : ' || P4);
	
	RETURN P4;
				
END Probability4;
/


CREATE OR REPLACE PROCEDURE Checkk
IS

P NUMBER;
BEGIN
P := Probability;

	CASE
		WHEN P < 40 THEN
		DBMS_OUTPUT.PUT_LINE('You may effect by other diseases or it may be happened for pressures or stresses!! ' );
		WHEN P > 40 AND P < 80 THEN
		DBMS_OUTPUT.PUT_LINE('You may effect by Heart Diseases! ' );
		WHEN P >80 THEN
		DBMS_OUTPUT.PUT_LINE('High possibilty of Heart failure! You should an emergency checkup!! ' );
	
	END CASE;
	
END Checkk;
/


CREATE OR REPLACE PROCEDURE Checkk2
IS

P2 NUMBER;
BEGIN
P2 := Probability2;

	CASE
		WHEN P2 < 40 THEN
		DBMS_OUTPUT.PUT_LINE('You may effect by other diseases or it may be happened for pressures or stresses!! ' );
		WHEN P2 > 40 AND P2 < 80 THEN
		DBMS_OUTPUT.PUT_LINE('You may effect by Heart Diseases! ' );
		WHEN P2 >80 THEN
		DBMS_OUTPUT.PUT_LINE('High possibilty of Heart failure! You should an emergency checkup!! ' );
	
	END CASE;
	
END Checkk2;
/


CREATE OR REPLACE PROCEDURE Checkk3
IS

P3 NUMBER;
BEGIN
P3 := Probability3;

	CASE
		WHEN P3 < 40 THEN
		DBMS_OUTPUT.PUT_LINE('You may effect by other diseases or it may be happened for pressures or stresses!! ' );
		WHEN P3 > 40 AND P3 < 80 THEN
		DBMS_OUTPUT.PUT_LINE('You may effect by Heart Diseases! ' );
		WHEN P3 >80 THEN
		DBMS_OUTPUT.PUT_LINE('High possibilty of Heart failure! You should an emergency checkup!! ' );
	
	END CASE;
	
END Checkk3;
/



CREATE OR REPLACE PROCEDURE Checkk4
IS

P4 NUMBER;
BEGIN
P4 := Probability4;

	CASE
		WHEN P4 < 40 THEN
		DBMS_OUTPUT.PUT_LINE('You may effect by other diseases or it may be happened for pressures or stresses!! ' );
		WHEN P4 > 40 AND P4 < 80 THEN
		DBMS_OUTPUT.PUT_LINE('You may effect by Heart Diseases! ' );
		WHEN P4 >80 THEN
		DBMS_OUTPUT.PUT_LINE('High possibilty of Heart failure! You should an emergency checkup!! ' );
	
	END CASE;
	
END Checkk4;
/

ACCEPT n NUMBER PROMPT "Enter Patient ID = "

DECLARE
patient NUMBER;
x1 NUMBER;
y1 NUMBER;
c1 NUMBER;
x2 NUMBER;
y2 NUMBER;
x3 NUMBER;
y3 NUMBER;
x4 NUMBER;
y4 NUMBER;
x5 NUMBER;
y5 NUMBER;
AB EXCEPTION;
AC EXCEPTION;
BC EXCEPTION;
	
BEGIN
    patient := &n;
	DBMS_OUTPUT.PUT_LINE('------------------------');

	
	IF patient = 1 THEN
	   --DBMS_OUTPUT.PUT_LINE('ppppppp');
	   
	   x1 := patientdata_count;
	   DBMS_OUTPUT.PUT_LINE('Symptoms of the patient who is attacked some diseases : '|| x1 );
	   
	   y1 := Probability;
	   DBMS_OUTPUT.PUT_LINE('Probability of Heart-Failure of this patient is : ' || y1);
	   Checkk;
	    
	
	ELSIF patient = 2 THEN
       --DBMS_OUTPUT.PUT_LINE('ddddddd');
	   x2 := patientdata_count2;
	   DBMS_OUTPUT.PUT_LINE('Symptoms of the patient who is attacked some diseases : '|| x2 );
	   
	   y2 := Probability2;
	   DBMS_OUTPUT.PUT_LINE('Probability of Heart-Failure of this patient is : ' || y2);
	   Checkk2;
	   
	ELSIF patient = 3 THEN
       --DBMS_OUTPUT.PUT_LINE('ddddddd');
	   x3 := patientdata_count3;
	   DBMS_OUTPUT.PUT_LINE('Symptoms of the patient who is attacked some diseases : '|| x3 );
	   y3 := Probability3;
	   DBMS_OUTPUT.PUT_LINE('Probability of Heart-Failure of this patient is : ' || y3);
	   Checkk3; 

	ELSIF patient = 4 THEN
      -- DBMS_OUTPUT.PUT_LINE('ddddddd');
	   x4 := patientdata_count4;
	   DBMS_OUTPUT.PUT_LINE('Symptoms of the patient who is attacked some diseases : '|| x4 );
	   y4 := Probability4;
	   DBMS_OUTPUT.PUT_LINE('Probability of Heart-Failure of this patient is : ' || y4);
	   Checkk4; 
	   



    ELSIF patient = 0 THEN
	RAISE AB ;
	
	ELSIF patient > 5 THEN
	RAISE AC;
	
	END IF;
	
	EXCEPTION
	
	WHEN AB THEN
	DBMS_OUTPUT.PUT_LINE('INVALID ID...' );	
	WHEN AC THEN
	DBMS_OUTPUT.PUT_LINE('NO DATA FOUND!!' );		   	   

END;
/		


  
		  
				  




	   

