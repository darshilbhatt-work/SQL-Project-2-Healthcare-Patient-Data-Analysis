-- Insert Patients
INSERT INTO patients VALUES
(1, 'Sarah', 'Smith', 'F', '1990-05-14'),
(2, 'James', 'Brown', 'M', '1985-09-22'),
(3, 'Sophia', 'Taylor', 'F', '2000-01-11'),
(4, 'Lucas', 'Johnson', 'M', '1993-07-05'),
(5, 'Stella', 'Davis', 'F', '1988-03-30'),
(6, 'Santos', 'Lopez', 'M', '1995-10-10');

-- Insert Doctors
INSERT INTO doctors VALUES
(1, 'Dr. Adams', 'Cardiology'),
(2, 'Dr. Baker', 'Pediatrics'),
(3, 'Dr. Clark', 'Orthopedics');

-- Insert Visits
INSERT INTO visits VALUES
(1, 1, 1, '2023-08-01'),
(2, 2, 2, '2023-08-03'),
(3, 3, 1, '2023-08-05'),
(4, 1, 3, '2023-08-07'),
(5, 4, 2, '2023-08-10'),
(6, 1, 1, '2023-08-15'),
(7, 6, 1, '2023-08-20');

-- Insert Treatments
INSERT INTO treatments VALUES
(1, 1, 'Physical Therapy'),
(2, 2, 'Vaccination'),
(3, 3, 'Cardiac Checkup'),
(4, 4, 'Fracture Treatment'),
(5, 1, 'Stress Therapy'),
(6, 6, 'Cardiac Checkup');
