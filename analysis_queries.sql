1. Show all patients with their assigned doctor.
SELECT p.first_name, p.last_name, d.doctor_name, d.specialty
FROM patients p
JOIN visits v ON p.patient_id = v.patient_id
JOIN doctors d ON v.doctor_id = d.doctor_id;


Insight:

Patients are connected to different doctors based on their specialty.

Eg: Sarah visited Dr. Adams (Cardiology) and Dr. Clark (Orthopedics).

This helps identify which doctors handle which patients.

2. Find patients who visited more than 2 times.
SELECT p.first_name, p.last_name, COUNT(v.visit_id) AS visit_count
FROM patients p
JOIN visits v ON p.patient_id = v.patient_id
GROUP BY p.first_name, p.last_name
HAVING COUNT(v.visit_id) > 2;


Insight:

Sarah visited 3 times, making her a frequent patient.

Frequent patients may need chronic care programs or loyalty follow-ups.

3. List all unique patient first names that occur only once.
SELECT first_name
FROM patients
GROUP BY first_name
HAVING COUNT(*) = 1;


Insight:

Unique names: James, Sophia, Lucas, Stella, Santos.

Only Sarah repeats.

Helps in patient identification and avoids duplicate entries.

4. Find patients whose names start and end with 's' and have at least 6 characters.
SELECT patient_id, first_name
FROM patients
WHERE first_name LIKE 's%s'
  AND LENGTH(first_name) >= 6;


Insight:

Patient Santos matches (starts and ends with ‘s’, 6 letters).

Could be used for pattern recognition in names (e.g., text cleaning, fraud detection).

5. Show the most common treatment given.
SELECT treatment_name, COUNT(*) AS freq
FROM treatments
GROUP BY treatment_name
ORDER BY freq DESC
LIMIT 1;


Insight:

Cardiac Checkup is the most frequent treatment (2 patients).

Suggests high demand for cardiology services → possible area for resource allocation.

6. Display doctors with no assigned patients.
SELECT d.doctor_name, d.specialty
FROM doctors d
LEFT JOIN visits v ON d.doctor_id = v.doctor_id
WHERE v.doctor_id IS NULL;


Insight:

In this dataset, all doctors have at least one patient.

If a doctor had none, it would highlight underutilized staff or imbalance in patient-doctor allocation.

7. Calculate the average age of patients by gender.
SELECT gender, ROUND(AVG(EXTRACT(YEAR FROM AGE(CURRENT_DATE, birth_date))), 1) AS avg_age
FROM patients
GROUP BY gender;


Insight:

Avg age (approx results from dataset):

Female = ~29.6 years

Male = ~31.0 years

Balanced age distribution across genders → useful for demographic segmentation in healthcare planning.

8. List patients who visited in the last 30 days.
SELECT p.first_name, p.last_name, v.visit_date
FROM patients p
JOIN visits v ON p.patient_id = v.patient_id
WHERE v.visit_date >= CURRENT_DATE - INTERVAL '30 days';


Insight:

Patients Santos & Sarah visited within the last 30 days.

Helps in follow-up scheduling & patient engagement programs.

9. Find patients who received multiple treatments.
SELECT p.first_name, p.last_name, COUNT(t.treatment_id) AS treatment_count
FROM patients p
JOIN treatments t ON p.patient_id = t.patient_id
GROUP BY p.first_name, p.last_name
HAVING COUNT(t.treatment_id) > 1;


Insight:

Sarah had 2 treatments (Physical Therapy + Stress Therapy).

Multi-treatment patients → could indicate chronic conditions or complex cases needing more care.

10. Rank patients by number of visits.
SELECT p.first_name, p.last_name, COUNT(v.visit_id) AS total_visits,
       RANK() OVER (ORDER BY COUNT(v.visit_id) DESC) AS visit_rank
FROM patients p
JOIN visits v ON p.patient_id = v.patient_id
GROUP BY p.first_name, p.last_name;


Insight:

Sarah = Rank 1 (3 visits)

Others = Rank 2 (1 visit each)

Ranking shows patient engagement level and can guide priority care programs.

📌 Final Business Insights

Frequent Patient (Sarah) → needs chronic care program.

Most Common Treatment: Cardiac Checkup → allocate more resources to Cardiology.

Unique Names → useful for cleaning duplicate data.

Recent Visitors (Santos & Sarah) → follow-up reminders possible.

Multi-Treatment Patient (Sarah) → indicates possible long-term condition.

Doctor Workload Balanced → no idle doctors found.

Demographics → average age ~30 → young population, preventive care focus.
