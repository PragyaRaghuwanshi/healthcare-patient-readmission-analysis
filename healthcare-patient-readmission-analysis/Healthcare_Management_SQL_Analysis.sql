/*
CAPSTONE PROJECT

Healthcare Management: Patient Readmission Prediction

Submitted By: Pragya Raghuwanshi
Tool Used: MySQL Workbench

Project Objective:
Analyze patient healthcare records to identify readmission patterns, diagnoses, treatment trends, and healthcare utilization.
*/

CREATE DATABASE healthcare;
USE healthcare;


/* Task 1: Calculate the Total Number of Patient Encounters */

SELECT COUNT(*) AS total_patient_encounters
FROM diabetic_data_utf8;

/*
Observation:
The healthcare dataset contains 101,766 patient encounter records, providing a large and comprehensive dataset for analyzing patient demographics, diagnoses, treatment patterns, and hospital readmission behavior.
*/

/* Task 2: Identify the Top 10 Most Frequent Diagnoses */

SELECT
diag_1,
COUNT(*) AS diagnosis_count
FROM diabetic_data_utf8
GROUP BY diag_1
ORDER BY diagnosis_count DESC
LIMIT 10;

/*
Observation:
The analysis identifies the most frequently occurring primary diagnoses among patients and highlights the most common medical conditions treated within the healthcare system.
*/

/* Task 3: Calculate the Average Length of Hospital Stay for Each Admission Type */

SELECT
admission_type_id,
ROUND(AVG(time_in_hospital),2) AS avg_hospital_stay
FROM diabetic_data_utf8
GROUP BY admission_type_id
ORDER BY avg_hospital_stay DESC;

/*
Observation:
The average hospital stay varies across admission types, helping identify categories requiring extended treatment and medical attention.
*/

/* Task 4: Determine the Number of Readmitted Patients and Percentage of Total Encounters */

SELECT
COUNT(*) AS readmitted_patients,
ROUND(
COUNT(*) * 100.0 /
(SELECT COUNT(*) FROM diabetic_data_utf8),
2
) AS percentage_of_total
FROM diabetic_data_utf8
WHERE readmitted <> 'NO';

/*
Observation:
The results indicate the proportion of patients who experienced hospital readmission and help evaluate healthcare service effectiveness and patient outcomes.
*/

/* Task 5: Identify the Age Distribution of Patients */

SELECT
age,
COUNT(*) AS patient_count
FROM diabetic_data_utf8
GROUP BY age
ORDER BY age;

/*
Observation:
The age distribution provides insight into the demographic composition of the patient population and identifies the most represented age groups.
*/

/* Task 6: Identify the Most Common Procedures Performed During Patient Encounters */

SELECT
num_procedures,
COUNT(*) AS procedure_count
FROM diabetic_data_utf8
GROUP BY num_procedures
ORDER BY procedure_count DESC;

/*
Observation:
The analysis reveals the most frequently performed procedures and highlights healthcare service utilization patterns.
*/

/* Task 7: Calculate the Average Number of Medications Prescribed for Patients in Each Age Group */

SELECT
age,
ROUND(AVG(num_medications),2) AS avg_medications
FROM diabetic_data_utf8
GROUP BY age
ORDER BY age;

/*
Observation:
Medication requirements vary across age groups, reflecting differences in treatment complexity and healthcare needs.
*/

/* Task 8: Identify the Distribution of Readmission Rates Across Different Payer Codes */

SELECT
payer_code,
COUNT(*) AS readmission_count
FROM diabetic_data_utf8
WHERE readmitted <> 'NO'
GROUP BY payer_code
ORDER BY readmission_count DESC;

/*
Observation:
The analysis highlights variations in readmission rates across payer categories and provides insights into healthcare utilization patterns.
*/

/* SQL Project Conclusion

The SQL analysis successfully explored patient demographics, diagnoses, admission details, medications, procedures, and readmission patterns within the healthcare dataset. The findings provide valuable insights into patient healthcare utilization and factors influencing hospital readmissions.

These insights can help healthcare providers improve patient care, optimize treatment planning, enhance discharge management, and reduce hospital readmission rates through data-driven decision-making.

*/

