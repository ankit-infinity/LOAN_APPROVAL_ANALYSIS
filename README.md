# LOAN_APPROVAL_ANALYSIS

# project overview
This project aims to analyse loan approval pattern using Exploratory Data
Analysis (EDA) on a loan application dataset.This analysis provide data 
driven insights of applicant profile which will help bank and other organisation 
to take proper future decision regarding loan approval.

# Dataset

The dataset include the following features:
loan_ID: This include applicant loan id

Gender: whether applicant is male or female

married: whether applicant is married or not

Dependents:number of member depends on applicant

Education:whether applicant is graduate or not

Self_employed: whether applicant is employed or not

Applicantincome: it include applicant income

CoApplicantincome:it include Coapplicant income

Loan amount : amount of loan applicant applied for

Loan amount term:

Credit history: whether applicant has good(1) credit history or not(0)

Property area: whether applicant live in rural urban or semiurban

loan status: whether loan is approved (1) or not(0)

# Methodology

1.Data preparation

The dataset was cleaned and pre -processed , including handling missing value,
outlier detection .

2.Exploratory Data Analysis

Using various library like tidyr,dplyr and ggplot2 to plot histogram,boxplot,
bargraph ,scatterplot and  also using pipe operator and group by function to 
sort out data relevantly.

# Key findings and recommendation

Gender: male applicants are more in number than female candidates though both
have almost similar approval rates hence gender is not a strong factor.

Martial status: married applicant are more in number than non married applicant
also former has higher approval status

Dependents:applicants with no dependents is more to apply for loan than 
applicants with higher dependents, also applicant with fewer dependents have higher
approval rate.

Education: Graduates have higher approval rate compared to non-graduates

self employed : self employed are less in number to apply for loan than 
those who are not.

The income of majority of the applicant is ranging from (2,500-5,000) per months.

Most approvals cluster around moderate income of (2000-10000) and loan amount 100-200
high loan amount are less frequently approved regardless of income.

# Bank's Insights
  
1.priotize applicants with a solid credit history they are less risky .for customers with no history
 history offer small starter loans or credit builder products to bring them into the credit system.
 
 2.Use a debt to income (DTI) ratio policy .Define clear cutoffs (e.g.loan amount should not exceed 40%of
 total monthly income).This reduces the risk of defaults.
 
 3.partner with universities ,professionaltraining centers,and companies to provide loan schemes
 to educated and employed individuals.
 
 4.introduce sticter eligibillity checks(or collateral requirements) for applicants
 with more dependents.
 
 5.semiurbans regions represent low-risk ,high potentials markets banks can focus more on marketing 
 and product and development here .in rural areas aproval criteria may need to be adjusted
 or banks should offer secured loans (e.g gold ,land or asset backed loans)
 
 6.offer tiered loan products (e.g. ,small tickets with collateral checks, and large loans with
 strict eligibility)