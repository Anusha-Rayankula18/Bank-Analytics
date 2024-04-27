use excleer;
select * from finance_1;
select* from  finance_2;


#kpi 1 year wise loan amount

select year(issue_d)as year_of_issue_date,sum(loan_amnt) as total_loan_amount from finance_1
group by year_of_issue_date
order by year_of_issue_date;

#kpi 2 grade and subgrade wise revol_bal

select grade,sub_grade, sum(revol_bal) as total_revol_balance from finance_1
inner join finance_2 on (finance_1.id=finance_2.id)
group by grade,sub_grade
order by grade,sub_grade;

#kpi 3 total payment for verified status and non verified status

select  verification_status,round(sum(total_pymnt),2)as total_payment from finance_1
inner join finance_2 on (finance_1.id=finance_2.id)
group by verification_status;


#kpi 4 state wise and month wise loan status 

select loan_status, substr((f2.last_credit_pull_d),1,3) as Month_credit ,addr_state from finance_1 as f1  join finance_2  as f2 on f1.id=f2.id group by Month_credit,addr_state ,loan_status order by month_credit;


# kpi 5 home ownership vs last payment date stats

select home_ownership,last_pymnt_d
from finance_1
inner join finance_2 on(finance_1.id=finance_2.id)
group by home_ownership,last_pymnt_d;