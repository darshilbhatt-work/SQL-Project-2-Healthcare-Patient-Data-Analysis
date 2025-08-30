
---

## 2. create_tables.sql  

```sql
-- Create Patients table
CREATE TABLE patients (
    patient_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender CHAR(1),
    birth_date DATE
);

-- Create Doctors table
CREATE TABLE doctors (
    doctor_id INT PRIMARY KEY,
    doctor_name VARCHAR(100),
    specialty VARCHAR(50)
);

-- Create Visits table
CREATE TABLE visits (
    visit_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    visit_date DATE,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

-- Create Treatments table
CREATE TABLE treatments (
    treatment_id INT PRIMARY KEY,
    patient_id INT,
    treatment_name VARCHAR(100),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);
