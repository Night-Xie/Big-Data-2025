CREATE SCHEMA IF NOT EXISTS BIG_DATA;
USE BIG_DATA;

DROP TABLE IF EXISTS RBI_DATA;
CREATE TABLE RBI_DATA (
    States_Union_Territories VARCHAR(100) NOT NULL,
    INC_2000_01 INT NOT NULL,
    INC_2011_12 INT NOT NULL,
    LIT_2001 INT NOT NULL,
    LIT_2011 INT NOT NULL,
    POP_2001 DECIMAL(5,2) NOT NULL,
    POP_2011 DECIMAL(5,2) NOT NULL,
    SEX_RATIO_2001 INT NOT NULL,
    SEX_RATIO_2011 INT NOT NULL,
    UNEMP_2001 INT NOT NULL,
    UNEMP_2011 INT NOT NULL,
    POVERTY_2001 DECIMAL(5,2) NOT NULL,
    POVERTY_2011 DECIMAL(5,2) NOT NULL
);

DROP TABLE IF EXISTS SCHOOL_INTERNET_FACILITY;
CREATE TABLE SCHOOL_INTERNET_FACILITY (
    State VARCHAR(100) NOT NULL,
    Total_Schools_All_Management INT NOT NULL,
    Total_Schools_Govt INT NOT NULL,
    Total_Schools_Govt_Aided INT NOT NULL,
    Total_Schools_Pvt_Unaided INT NOT NULL,
    Total_Schools_Others INT NOT NULL,
    Schools_With_Internet_All_Management INT NOT NULL,
    Schools_With_Internet_Govt INT NOT NULL,
    Schools_With_Internet_Govt_Aided INT NOT NULL,
    Schools_With_Internet_Pvt_Unaided INT NOT NULL,
    Schools_With_Internet_Others INT NOT NULL,
    Percent_Schools_Internet_All_Management DECIMAL(5,2) NOT NULL,
    Percent_Schools_Internet_Govt DECIMAL(5,2) NOT NULL,
    Percent_Schools_Internet_Govt_Aided DECIMAL(5,2) NOT NULL,
    Percent_Schools_Internet_Pvt_Unaided DECIMAL(5,2) NOT NULL,
    Percent_Schools_Internet_Others DECIMAL(5,2) NOT NULL
);

DROP TABLE IF EXISTS SCHOOL_COMPUTER_FACILITY;
CREATE TABLE SCHOOL_COMPUTER_FACILITY (
    State VARCHAR(100) NOT NULL,
    Total_Schools_All_Management INT NOT NULL,
    Total_Schools_Govt INT NOT NULL,
    Total_Schools_Govt_Aided INT NOT NULL,
    Total_Schools_Pvt_Unaided INT NOT NULL,
    Total_Schools_Others INT NOT NULL,
    Schools_With_Computer_All_Management INT NOT NULL,
    Schools_With_Computer_Govt INT NOT NULL,
    Schools_With_Computer_Govt_Aided INT NOT NULL,
    Schools_With_Computer_Pvt_Unaided INT NOT NULL,
    Schools_With_Computer_Others INT NOT NULL,
    Percent_Schools_Computer_All_Management DECIMAL(5,2) NOT NULL,
    Percent_Schools_Computer_Govt DECIMAL(5,2) NOT NULL,
    Percent_Schools_Computer_Govt_Aided DECIMAL(5,2) NOT NULL,
    Percent_Schools_Computer_Pvt_Unaided DECIMAL(5,2) NOT NULL,
    Percent_Schools_Computer_Others DECIMAL(5,2) NOT NULL
);

DROP TABLE IF EXISTS SCHOOL_ELECTRICITY_FACILITY;
CREATE TABLE SCHOOL_ELECTRICITY_FACILITY (
    State VARCHAR(100) NOT NULL,
    Total_Schools_All_Management INT NOT NULL,
    Total_Schools_Govt INT NOT NULL,
    Total_Schools_Govt_Aided INT NOT NULL,
    Total_Schools_Pvt_Unaided INT NOT NULL,
    Total_Schools_Others INT NOT NULL,
    Schools_With_Electricity_All_Management INT NOT NULL,
    Schools_With_Electricity_Govt INT NOT NULL,
    Schools_With_Electricity_Govt_Aided INT NOT NULL,
    Schools_With_Electricity_Pvt_Unaided INT NOT NULL,
    Schools_With_Electricity_Others INT NOT NULL,
    Schools_With_Functional_Electricity_All_Management INT NOT NULL,
    Schools_With_Functional_Electricity_Govt INT NOT NULL,
    Schools_With_Functional_Electricity_Govt_Aided INT NOT NULL,
    Schools_With_Functional_Electricity_Pvt_Unaided INT NOT NULL,
    Schools_With_Functional_Electricity_Others INT NOT NULL,
    Percent_Schools_Electricity_All_Management DECIMAL(5,2) NOT NULL,
    Percent_Schools_Electricity_Govt DECIMAL(5,2) NOT NULL,
    Percent_Schools_Electricity_Govt_Aided DECIMAL(5,2) NOT NULL,
    Percent_Schools_Electricity_Pvt_Unaided DECIMAL(5,2) NOT NULL,
    Percent_Schools_Electricity_Others DECIMAL(5,2) NOT NULL,
    Percent_Schools_Functional_Electricity_All_Management DECIMAL(5,2) NOT NULL,
    Percent_Schools_Functional_Electricity_Govt DECIMAL(5,2) NOT NULL,
    Percent_Schools_Functional_Electricity_Govt_Aided DECIMAL(5,2) NOT NULL,
    Percent_Schools_Functional_Electricity_Pvt_Unaided DECIMAL(5,2) NOT NULL,
    Percent_Schools_Functional_Electricity_Others DECIMAL(5,2) NOT NULL
);

DROP TABLE IF EXISTS POPULATION_DATA;
CREATE TABLE POPULATION_DATA(
    state VARCHAR(255),
    `1951` INT NOT NULL,
    `1961` INT NOT NULL,
    `1971` INT NOT NULL,
    `1981` INT NOT NULL,
    `1991` INT NOT NULL,
    `2001` INT NOT NULL,
    `2011` INT NOT NULL,
    data VARCHAR(255)NOT NULL );
 
 DROP TABLE IF EXISTS RESULTS;
 CREATE TABLE RESULTS(
	    
         dummy INT NOT NULL,
         marks INT NOT NULL,
         state VARCHAR(50) NOT NULL,
         city VARCHAR(50) NOT NULL,
         center_name VARCHAR(100) NOT NULL,
         center_number INT NOT NULL
     );

DROP TABLE IF EXISTS INDIA;
CREATE TABLE INDIA(
    state VARCHAR(255),
    `1990` INT,
    `1991` INT,
    `1992` INT,
    `1993` INT,
    `1994` INT,
    `1995` INT,
    `1996` INT,
    `1997` INT,
    `1998` INT,
    `1999` INT,
    `2000` INT,
    `2001` INT,
    `2002` INT,
    `2003` INT,
    `2004` INT,
    `2005` INT,
    `2006` INT,
    `2007` INT,
    `2008` INT,
    `2009` INT,
    `2010` INT,
    `2011` INT,
    `2012` INT,
    `2013` INT,
    `2014` INT,
    `2015` INT,
    `2016` INT,
    `2017` INT,
    `2018` INT,
    `2019` INT,
    `2020` INT,
    `2021` INT,
    `2022` INT,
    category VARCHAR(255)
);

DROP TABLE IF EXISTS LIBRARY_FACILITY;
CREATE TABLE LIBRARY_FACILITY (
    State VARCHAR(100) PRIMARY KEY,
    Total_Schools_All_Management INT,
    Total_Schools_Govt INT,
    Total_Schools_Govt_Aided INT,
    Total_Schools_Pvt_Unaided INT,
    Total_Schools_Others INT,
    Schools_with_Library_All_Management INT,
    Schools_with_Library_Govt INT,
    Schools_with_Library_Govt_Aided INT,
    Schools_with_Library_Pvt_Unaided INT,
    Schools_with_Library_Others INT,
    Percent_Schools_with_Library_All_Management DECIMAL(5,2),
    Percent_Schools_with_Library_Govt DECIMAL(5,2),
    Percent_Schools_with_Library_Govt_Aided DECIMAL(5,2),
    Percent_Schools_with_Library_Pvt_Unaided DECIMAL(5,2),
    Percent_Schools_with_Library_Others DECIMAL(5,2)
);

DROP TABLE IF EXISTS NUMBER_OF_TEACHERS;
CREATE TABLE NUMBER_OF_TEACHERS (
    State VARCHAR(100) PRIMARY KEY,
    Total_Male INT,
    Total_Female INT,
    Total_Teachers INT,
    PrePrimary_Only_Male INT,
    PrePrimary_Only_Female INT,
    PrePrimary_Only_Total INT,
    PrePrimary_Primary_Male INT,
    PrePrimary_Primary_Female INT,
    PrePrimary_Primary_Total INT,
    Primary_Only_Male INT,
    Primary_Only_Female INT,
    Primary_Only_Total INT,
    Primary_UpperPrimary_Male INT,
    Primary_UpperPrimary_Female INT,
    Primary_UpperPrimary_Total INT,
    UpperPrimary_Only_Male INT,
    UpperPrimary_Only_Female INT,
    UpperPrimary_Only_Total INT,
    UpperPrimary_Secondary_Male INT,
    UpperPrimary_Secondary_Female INT,
    UpperPrimary_Secondary_Total INT,
    Secondary_Only_Male INT,
    Secondary_Only_Female INT,
    Secondary_Only_Total INT,
    Secondary_HigherSecondary_Male INT,
    Secondary_HigherSecondary_Female INT,
    Secondary_HigherSecondary_Total INT,
    HigherSecondary_Only_Male INT,
    HigherSecondary_Only_Female INT,
    HigherSecondary_Only_Total INT
);

DROP TABLE IF EXISTS VOCATIONAL_COURSES;
CREATE TABLE VOCATIONAL_COURSES (
    State VARCHAR(100) PRIMARY KEY,
    Total_Secondary_HigherSecondary_Schools INT,
    Govt_Schools INT,
    Govt_Aided_Schools INT,
    Pvt_Unaided_Schools INT,
    Other_Schools INT,
    Schools_With_Vocational_All INT,
    Schools_With_Vocational_Govt INT,
    Schools_With_Vocational_Govt_Aided INT,
    Schools_With_Vocational_Pvt_Unaided INT,
    Schools_With_Vocational_Others INT,
    Enrolment_Vocational_All INT,
    Enrolment_Vocational_Govt INT,
    Enrolment_Vocational_Govt_Aided INT,
    Enrolment_Vocational_Pvt_Unaided INT,
    Enrolment_Vocational_Others INT
);

