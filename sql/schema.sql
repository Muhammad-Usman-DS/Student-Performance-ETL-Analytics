-- Enable foreign key constraints
PRAGMA foreign_keys = ON;

-- Drop existing tables (in reverse order of dependencies)
DROP TABLE IF EXISTS Student_Performance_Data;
DROP TABLE IF EXISTS Student_Counceling_Information;
DROP TABLE IF EXISTS Student_Counseling_Information;  -- Extra spelling variation
DROP TABLE IF EXISTS Employee_Information;
DROP TABLE IF EXISTS Department_Information;
DROP TABLE IF EXISTS Cleaned_Performance;  -- Extra cleaned table

-- Department_Information Table
CREATE TABLE Department_Information (
    Department_ID TEXT PRIMARY KEY,
    Department_Name TEXT NOT NULL UNIQUE,
    DOE TEXT
);

-- Employee_Information Table
CREATE TABLE Employee_Information (
    Employee_ID TEXT PRIMARY KEY,
    DOB TEXT,
    DOJ TEXT,
    Department_ID TEXT,
    FOREIGN KEY (Department_ID) REFERENCES Department_Information(Department_ID)
);

-- Student_Counceling_Information Table
-- Note: Keeping "Counceling" spelling to match CSV filename
CREATE TABLE Student_Counceling_Information (
    Student_ID TEXT NOT NULL,
    DOA TEXT NOT NULL,
    DOB TEXT,
    Department_Choices TEXT NOT NULL,
    Department_Admission TEXT,
    PRIMARY KEY (Student_ID, Department_Choices, DOA),
    FOREIGN KEY (Department_Choices) REFERENCES Department_Information(Department_ID),
    FOREIGN KEY (Department_Admission) REFERENCES Department_Information(Department_ID)
);

-- Student_Performance_Data Table
-- Note: CSV has typo "Semster_Name" not "Semester_Name"
CREATE TABLE Student_Performance_Data (
    Student_ID TEXT NOT NULL,
    Semster_Name TEXT NOT NULL,
    Paper_ID TEXT NOT NULL,
    Paper_Name TEXT,
    Marks REAL,
    Effort_Hours REAL,
    PRIMARY KEY (Student_ID, Paper_ID, Semster_Name),
    FOREIGN KEY (Student_ID) REFERENCES Student_Counceling_Information(Student_ID)
);