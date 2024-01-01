WITH Month_Year AS
  (SELECT *,
          to_char("Transaction_Date", 'YYYY-MM') AS Month_Year
   FROM public."Ledger"),
     month_sum AS
  (SELECT month_year,
          SUM("Debit") AS Average_Debit
   FROM Month_Year
   GROUP BY month_year),
     month_average AS
  (SELECT AVG(average_debit) AS monthly_average
   FROM month_sum)
SELECT *,
       to_char("Transaction_Date", 'YYYY-MM') AS Month_Year,

  (SELECT monthly_average
   FROM month_average) AS month_average
FROM public."Ledger"
