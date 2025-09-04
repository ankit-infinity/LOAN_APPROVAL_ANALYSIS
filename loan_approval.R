# TITLE= LOAN APPROVAL ANALYSIS
#AUTHOR- ANKIT GHOSH


#import libraries 
library(tidyr)
library(dplyr)
library(ggplot2)


#data import
setwd("D:/r_project/r_islr_work/LOAN_APPROVAL_ANALYSIS")
getwd() 
df=read.csv("Loan_Train.csv")
dim(df)


#data cleaning
df[df==""]=NA
df1=drop_na(df)
dim(df1)
str(df1)
Total_Income=df1$ApplicantIncome+df1$CoapplicantIncome
log_total_income=log(Total_Income,base = exp(1))
hist(log_total_income,col="blue",xlim = c(7.5,11.5),breaks = 20)
   
#PERFORMING SOME SORTS OF EDA RELATED TO DATA

#number of people who take loan group by gender
loan_gender=data.frame(df1$Gender)
gender_count=loan_gender%>%count(df1$Gender)
print(gender_count)
ggplot(data = loan_gender,aes(x=df1$Gender))+geom_bar(aes(fill = df1.Gender))+labs(title=" gender counts",x="Gender")+theme()
  
#number of people who take loan group by martial status
loan_married=data.frame(df1$Married)
married_count=loan_married%>%count(df1$Married)
print(married_count)
ggplot(data = loan_married,aes(x=df1.Married))+geom_bar(aes(fill=df1$Married))+labs(title=" loan based on martial status",x="married")+theme()
 

#number of people who take loan group by dependents
loan_dependents=data.frame(df1$Dependents)
dependents_count=loan_dependents%>%count(df1$Dependents)
print(dependents_count)
ggplot(data = loan_dependents,aes(x=df1.Dependents))+geom_bar(aes(fill=df1$Dependents))+labs(title=" dependents counts",x="dependentts")+theme()

#number of people who take loan group by self employed
loan_employed=data.frame(df1$Self_Employed)
employed_count=loan_employed%>%count(df1$Self_Employed)
print(employed_count)
ggplot(data = loan_employed,aes(x=df1.Self_Employed))+geom_bar(aes(fill=df1$Self_Employed))+labs(title=" employed counts",x="self employed")+theme()
       

#proportion of loan approved by demographic analysis

#loan approved proportion by gender
ggplot(df1,aes(x=Gender,fill=Loan_Status))+geom_bar(position = "fill")+labs(title = "loan approved proprtion  by Gender",y="proportion")

#loan approved proportion by martial status
ggplot(df1,aes(x=Married,fill=Loan_Status))+geom_bar(position = "fill")+labs(title = "loan approved proportion by martial status",y="proportion")

#loan approved proportion by educational status
ggplot(df1,aes(x=Education,fill=Loan_Status))+geom_bar(position = "fill")+labs(title = "loan approved proportion by educational status",y="proportion")

#loan approved proportion by dependent status
ggplot(df1,aes(x=factor(Dependents),fill=Loan_Status))+geom_bar(position = "fill")+labs(title = "loan approved proportion by dependent status",y="proportion")


#income and loan analysis

#income distribution
ggplot(df1,aes(x=ApplicantIncome))+geom_histogram(bins = 30,fill="steelblue",color="black")+labs(title = "distribution of applicant income")

#loan amount distribution
ggplot(df1,aes(x=LoanAmount))+geom_histogram(bins = 30,fill="green",color="black")+labs(title = "distribution of loan amount")

#income vs loanstatus
ggplot(df1,aes(x=Loan_Status,y=ApplicantIncome))+geom_boxplot()+labs(title = " applicant income vs loan status")

#total inaome vs loan amount
ggplot(df1,aes(x=Total_Income,y=LoanAmount,color=Loan_Status))+geom_point(aes(size=LoanAmount),alpha=0.6)+labs(title = "total income vs loan amount")+theme_minimal()


#CREDIT HISTORY AND LOAN APPROVAL
ggplot(df1,aes(x=factor(Credit_History),fill = Loan_Status))+geom_bar(position = "fill")+labs(title = "loan approved  proportion by credit history",x="credit history(0=NO,1=YES)",y="proportion")


#LOAN APPROVAL RATE OVERALL
approv_rate =mean(df1$Loan_Status=="Y")*100
cat("overall loan approval rate:",round(approv_rate,2),"%\n")

#Approval rate by gender
gen_approv=df1%>%group_by(Gender)%>%summarise(approvalrate=mean(Loan_Status=="Y",na.rm=TRUE)*100)
print(gen_approv)
ggplot(gen_approv,aes(x=Gender,fill =approvalrate ))+geom_bar(position = "fill")+labs(title = "loan approved rate by gender")

#approval rate by martial status 
married_approval=df1%>%group_by(Married)%>%summarise(approvalrate=mean(Loan_Status=="Y",na.rm=TRUE)*100)
print(married_approval)
ggplot(married_approval,aes(x=Married,fill =approvalrate ))+geom_bar(position = "fill")+labs(title = "loan approved rate by martial ")


#approval rate by educational status 
edu_approval=df1%>%group_by(Education)%>%summarise(approvalrate=mean(Loan_Status=="Y",na.rm=TRUE)*100)
print(edu_approval)
ggplot(edu_approval,aes(x=Education,fill =approvalrate ))+geom_bar(position = "fill")+labs(title = "loan approved rate by education")

#approval rate by Dependents status 
dep_approval=df1%>%group_by(Dependents)%>%summarise(approvalrate=mean(Loan_Status=="Y",na.rm=TRUE)*100)
print(dep_approval)
ggplot(dep_approval,aes(x=Dependents,fill =approvalrate ))+geom_bar(position = "fill")+labs(title = "loan approved rate by dependents")
 
#approval rate by credit status 
cred_approval=df1%>%group_by(Credit_History)%>%summarise(approvalrate=mean(Loan_Status=="Y",na.rm=TRUE)*100)
print(cred_approval)
ggplot(cred_approval,aes(x=factor(Credit_History),fill = approvalrate ))+geom_bar(position = "fill")+labs(title = "loan approved rate by credit status")
 


#approval rate by property area 
p_approval=df1%>%group_by(Property_Area)%>%summarise(approvalrate=mean(Loan_Status=="Y",na.rm=TRUE)*100)
print(p_approval)
ggplot(p_approval,aes(x=Property_Area,fill =approvalrate ))+geom_bar(position = "fill")

#average loan amount by loan status
avg_loan=df1%>%group_by(Loan_Status)%>%summarise(AverageLoan=mean(LoanAmount,na.rm=TRUE))
print(avg_loan)
ggplot(avg_loan,aes(x=Loan_Status,fill =AverageLoan ))+geom_bar(position = "fill")+labs(title = "average loan vs loan status")





