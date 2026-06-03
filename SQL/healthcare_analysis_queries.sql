# Total Patients 

SELECT COUNT(*) AS total_patients
FROM patients;

# Total doctors

SELECT COUNT(*) AS total_doctors
FROM doctors;

# Appointment Status Analysis

SELECT status,
       COUNT(*) AS total_appointments
FROM appointments
GROUP BY status
ORDER BY total_appointments DESC;

# Most common visit reasons

SELECT reason_for_visit,
       COUNT(*) AS total_visits
FROM appointments
GROUP BY reason_for_visit
ORDER BY total_visits DESC;

# Top Doctors by appointments

SELECT d.first_name,
       d.last_name,
       d.specialization,
       COUNT(a.appointment_id) AS total_appointments
FROM doctors d
JOIN appointments a
ON d.doctor_id = a.doctor_id
GROUP BY d.doctor_id
ORDER BY total_appointments DESC;

# Most Experienced Doctors

SELECT first_name,
       last_name,
       specialization,
       years_experience
FROM doctors
ORDER BY years_experience DESC;

# Average Treatment Cost

SELECT treatment_type,
       ROUND(AVG(cost),2) AS average_cost
FROM treatments
GROUP BY treatment_type
ORDER BY average_cost DESC;

 # Most Expensive Treatments
 
 SELECT treatment_type,
       MAX(cost) AS highest_cost
FROM treatments
GROUP BY treatment_type
ORDER BY highest_cost DESC;

# Total Hospital Revenue 

SELECT ROUND(SUM(amount),2) AS total_revenue
FROM billing;

# Payment Method Analysis

SELECT payment_method,
       COUNT(*) AS transactions
FROM billing
GROUP BY payment_method
ORDER BY transactions DESC;

# Payment Status Analysis

SELECT payment_status,
       COUNT(*) AS total
FROM billing
GROUP BY payment_status;

# Revenue by treatment type 

SELECT t.treatment_type,
       ROUND(SUM(b.amount),2) AS total_revenue
FROM treatments t
JOIN billing b
ON t.treatment_id = b.treatment_id
GROUP BY t.treatment_type
ORDER BY total_revenue DESC;

# Monthly Appointment Trend

SELECT MONTH(appointment_date) AS month,
       COUNT(*) AS total_appointments
FROM appointments
GROUP BY month
ORDER BY month;

# Monthly Reveue Trend 

SELECT MONTH(bill_date) AS month,
       ROUND(SUM(amount),2) AS monthly_revenue
FROM billing
GROUP BY month
ORDER BY month;

# Specialization Performance

SELECT d.specialization,
       COUNT(a.appointment_id) AS total_appointments
FROM doctors d
JOIN appointments a
ON d.doctor_id = a.doctor_id
GROUP BY d.specialization
ORDER BY total_appointments DESC;


