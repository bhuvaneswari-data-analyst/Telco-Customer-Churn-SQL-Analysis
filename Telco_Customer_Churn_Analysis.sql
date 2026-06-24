-- TELCO CUSTOMER CHURN ANALYSIS PROJECT --

USE telco_customer_churn;

-- 1. Total Customers
SELECT COUNT(*) AS Total_Customers
FROM telco_customer_churn_data;

-- 2. Churn Distribution
SELECT
    Churn,
    COUNT(*) AS Customer_Count
FROM telco_customer_churn_data
GROUP BY Churn;

-- 3. Overall Churn Rate
SELECT
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 /
        COUNT(*), 2
    ) AS Churn_Rate_Percentage
FROM telco_customer_churn_data;

-- 4. Gender vs Churn
SELECT
    gender,
    Churn,
    COUNT(*) AS Customer_Count
FROM telco_customer_churn_data
GROUP BY gender, Churn
ORDER BY gender;

-- 5. Senior Citizen vs Churn
SELECT
    SeniorCitizen,
    Churn,
    COUNT(*) AS Customer_Count
FROM telco_customer_churn_data
GROUP BY SeniorCitizen, Churn;

-- 6. Contract Type vs Churn
SELECT
    Contract,
    Churn,
    COUNT(*) AS Customer_Count
FROM telco_customer_churn_data
GROUP BY Contract, Churn
ORDER BY Contract;

-- 7. Internet Service vs Churn
SELECT
    InternetService,
    Churn,
    COUNT(*) AS Customer_Count
FROM telco_customer_churn_data
GROUP BY InternetService, Churn;

-- 8. Payment Method vs Churn
SELECT
    PaymentMethod,
    Churn,
    COUNT(*) AS Customer_Count
FROM telco_customer_churn_data
GROUP BY PaymentMethod, Churn
ORDER BY Customer_Count DESC;

-- 9. Tech Support vs Churn
SELECT
    TechSupport,
    Churn,
    COUNT(*) AS Customer_Count
FROM telco_customer_churn_data
GROUP BY TechSupport, Churn;

-- 10. Online Security vs Churn
SELECT
    OnlineSecurity,
    Churn,
    COUNT(*) AS Customer_Count
FROM telco_customer_churn_data
GROUP BY OnlineSecurity, Churn;

-- 11. Partner Status vs Churn
SELECT
    Partner,
    Churn,
    COUNT(*) AS Customer_Count
FROM telco_customer_churn_data
GROUP BY Partner, Churn;

-- 12. Dependents vs Churn
SELECT
    Dependents,
    Churn,
    COUNT(*) AS Customer_Count
FROM telco_customer_churn_data
GROUP BY Dependents, Churn;

-- 13. Average Monthly Charges by Churn Status
SELECT
    Churn,
    ROUND(AVG(MonthlyCharges),2) AS Avg_Monthly_Charges
FROM telco_customer_churn_data
GROUP BY Churn;

-- 14. Average Tenure by Churn Status
SELECT
    Churn,
    ROUND(AVG(tenure),2) AS Avg_Tenure
FROM telco_customer_churn_data
GROUP BY Churn;

-- 15. Total Revenue by Churn Status
SELECT
    Churn,
    ROUND(SUM(TotalCharges),2) AS Total_Revenue
FROM telco_customer_churn_data
GROUP BY Churn;

-- 16. Revenue by Contract Type
SELECT
    Contract,
    ROUND(SUM(TotalCharges),2) AS Revenue
FROM telco_customer_churn_data
GROUP BY Contract
ORDER BY Revenue DESC;

-- 17. Revenue by Payment Method
SELECT
    PaymentMethod,
    ROUND(SUM(TotalCharges),2) AS Revenue
FROM telco_customer_churn_data
GROUP BY PaymentMethod
ORDER BY Revenue DESC;

-- 18. Top 10 Customers by Total Charges
SELECT
    customerID,
    TotalCharges
FROM telco_customer_churn_data
ORDER BY TotalCharges DESC
LIMIT 10;

-- 19. Revenue Lost Due to Churn
SELECT
    ROUND(SUM(TotalCharges),2) AS Revenue_Lost
FROM telco_customer_churn_data
WHERE Churn = 'Yes';

-- 20. High Risk Customers
SELECT
    customerID,
    Contract,
    InternetService,
    PaymentMethod,
    MonthlyCharges
FROM telco_customer_churn_data
WHERE Churn = 'Yes'
AND Contract = 'Month-to-month';