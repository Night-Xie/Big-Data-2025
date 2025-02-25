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


