Clear Screen;

drop table TrainData;

create table TrainData(
    pid INTEGER,
	pname VARCHAR(20),
	fever VARCHAR(20), 
	cough VARCHAR(20),
	soreThroat VARCHAR(20),
	headache VARCHAR(20),
	shortnessOfBreath VARCHAR(20),
	lostSmell VARCHAR(20)
	);
	
insert into TrainData values(1, 'Arnob', 'yes','yes', 'yes', 'yes', 'yes','yes');
insert into TrainData values(2, 'Ahnaf', 'yes','yes', 'yes', 'yes', 'yes','yes');
insert into TrainData values(3, 'Aishik', 'yes','yes', 'yes', 'yes', 'yes','yes');
insert into TrainData values(4, 'Badhon', 'yes','yes', 'yes', 'yes', 'yes','yes');
insert into TrainData values(5, 'Mustofa', 'yes','yes', 'yes', 'yes', 'yes','yes');
insert into TrainData values(6, 'Abyob', 'yes','yes', 'yes', 'yes', 'yes','yes');
insert into TrainData values(7, 'Joti', 'yes','yes', 'yes', 'yes', 'yes','yes');
insert into TrainData values(8, 'Alim', 'yes','yes', 'yes', 'yes', 'yes','yes');
insert into TrainData values(9, 'Anim', 'yes','yes', 'yes', 'yes', 'yes','yes');
insert into TrainData values(10,'Shimanto', 'yes','yes', 'yes', 'yes', 'yes','yes');	

set lines 256
set trimout ON
set tab OFF

select * from TrainData;

drop table Patient1;
create table Patient1(
    pid INTEGER,
	pname VARCHAR(20),
	pAge INTEGER,
	fever VARCHAR(20), 
	cough VARCHAR(20),
	soreThroat VARCHAR(20),
	headache VARCHAR(20));
	
insert into Patient1 values(11, 'Tonmoy', 40, 'yes','yes', 'yes', 'yes');

select * from Patient1;	


drop table Patient2;
create table Patient2(
    pid INTEGER,
	pname VARCHAR(20),
	pAge INTEGER,
	fever VARCHAR(20), 
	cough VARCHAR(20),
	soreThroat VARCHAR(20),
	headache VARCHAR(20),
	shortnessOfBreath VARCHAR(20),
	lostSmell VARCHAR(20));
	
insert into Patient2 values(12, 'Yusha', 63, 'yes','yes', 'yes', 'yes', 'yes', 'yes');

select * from Patient2;


drop table Patient3;
create table Patient3(
    pid INTEGER,
	pname VARCHAR(20),
	pAge INTEGER, 
	cough VARCHAR(20),
	soreThroat VARCHAR(20),
	shortnessOfBreath VARCHAR(20));
	
insert into Patient3 values(13, 'Shawly', 53, 'yes','yes', 'yes');

select * from Patient3;	

--drop table Patient4;
create table Patient4(
    pid INTEGER,
	pname VARCHAR(20),
	pAge INTEGER, 
	fever VARCHAR(20),
	cough VARCHAR(20),
	soreThroat VARCHAR(20),
	headache VARCHAR(20),
	shortnessOfBreath VARCHAR(20),
	lostSmell VARCHAR(20));
	
insert into Patient4 values(14, 'Hridi', 80, 'yes','yes', 'yes','yes','yes', 'yes');

select * from Patient4;	



--drop table Patient5;
create table Patient5(
    pid INTEGER,
	pname VARCHAR(20),
	pAge INTEGER, 
	cough VARCHAR(20),
	soreThroat VARCHAR(20),
	headache VARCHAR(20),
	shortnessOfBreath VARCHAR(20),
	lostSmell VARCHAR(20));
	
insert into Patient5 values(15, 'Nafisha', 30, 'yes','yes', 'yes','yes','yes');

select * from Patient5;



--drop table Patient6;
create table Patient6(
    pid INTEGER,
	pname VARCHAR(20),
	pAge INTEGER, 
	cough VARCHAR(20),
	soreThroat VARCHAR(20),
	headache VARCHAR(20),
	shortnessOfBreath VARCHAR(20),
	lostSmell VARCHAR(20));
	
insert into Patient6 values(16, 'Nilima', 70, 'yes','yes', 'yes','yes','yes');

select * from Patient6;
	   
commit;

SELECT COUNT(fever)FROM TrainData;	














/*
CREATE OR REPLACE FUNCTION patientdata_count
RETURN INTEGER
IS
X INTEGER :=0;
BEGIN
    SELECT COUNT(Symptoms)FROM Patient1;
	DBMS_OUTPUT.PUT_LINE('Symptoms of the patient who is attacked some diseases : ' );
 
    RETURN x;
	
END patientdata_count;
/


CREATE OR REPLACE FUNCTION Probability
RETURN INTEGER
IS
p INTEGER :=0;
BEGIN
    
	DBMS_OUTPUT.PUT_LINE('Probability of Heart-Failure of this patient is : ' );
	p = (patientdata_count() / traindata_count())*100;
 
    RETURN p;
	
END Probability;
/


CREATE OR REPLACE PROCEDURE Check(p in DOUBLE)
IS
BEGIN
CASE
    WHEN p < 30 THEN
	DBMS_OUTPUT.PUT_LINE('You may effect by other diseases or it may be happened for pressures or stresses!! Do rest & relaxx! ' );
	*/

--traindata_count = SELECT COUNT(Symptoms)FROM TrainData;	

--p1_count = SELECT COUNT(Symptoms)FROM Patient1;	

--probability = p1_count / traindata_count;


/*DECLARE
traindata_count INTEGER ;
p1_count INTEGER ;
probability DOUBLE ;
*/
	


exception

	when error_negative then
		dbms_output.put_line('scale factor cannot be -ve');
	
	when zero_divide then
		dbms_output.put_line('Cannot be divided by zero');
		
	when no_data_found then
		dbms_output.put_line('not found');







right codeeee


CREATE OR REPLACE FUNCTION patientdata_count
RETURN NUMBER
IS
B NUMBER :=0;

BEGIN
    
	SELECT COUNT(Symptoms) INTO B FROM Patient1;
	
    RETURN B;
	
END patientdata_count;
/

DECLARE
    B NUMBER;
BEGIN
    B := patientdata_count;
	DBMS_OUTPUT.PUT_LINE('Symptoms of the patient who is attacked some diseases : '|| B );
END;
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
	--P := X+Y;
 
    RETURN P;
	
END Probability;	
/

DECLARE
    P NUMBER;
	X NUMBER;
	Y NUMBER;
BEGIN
    P := Probability;
	X := traindata_count;
	Y := patientdata_count;
	DBMS_OUTPUT.PUT_LINE('Probability of Heart-Failure of this patient is : ' || P);
END;
/


CREATE OR REPLACE PROCEDURE Checkk
IS

P NUMBER;
BEGIN
    P := Probability;

    CASE
		WHEN P < 40 THEN
		DBMS_OUTPUT.PUT_LINE('You may effect by other diseases or it may be happened for pressures or stresses!! ' );
		WHEN  P > 40 AND P < 80 THEN
		DBMS_OUTPUT.PUT_LINE('You may effect by Heart Diseases! ' );
		WHEN P >80 THEN
		DBMS_OUTPUT.PUT_LINE('High possibilty of Heart failure! You should an emergency checkup!! ' );
	
	END CASE;
	
END checkk;
/

DECLARE
    P NUMBER;
	
BEGIN
    Checkk;
	
	
END;
/

















/*CREATE OR REPLACE PROCEDURE ex
IS
AB EXCEPTION;
AC EXCEPTION;
BC EXCEPTION;
ABC EXCEPTION;



BEGIN
calll.patient;

	CASE 
		WHEN patient = 0 THEN
		RAISE AB ;
		WHEN patient > 5 THEN
		RAISE AC;
	END CASE;
	
	EXCEPTION
	
	WHEN AB THEN
	DBMS_OUTPUT.PUT_LINE('NO DATA FOUND!!' );	
	WHEN AC THEN
	DBMS_OUTPUT.PUT_LINE('INVALID ID...' );	

	
	
END ex;
/		  

*/
