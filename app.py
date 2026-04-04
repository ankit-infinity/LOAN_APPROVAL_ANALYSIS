import pickle
import streamlit as st
import numpy as np 
import pandas as pd
from sklearn.preprocessing import LabelEncoder

# load model
model=pickle.load(open("model.pkl",'rb'))

# Title
st.title("Loan Approval prediction Analysis App")
st.write("enter applicant details to check loan approval status")

#user input
gender=st.selectbox("Gender",["Male","Female"])
Married=st.selectbox("married",["Yes","No"])
dependents=st.selectbox("dependents",["0","1","2","+3"])
education=st.selectbox("education",["Graduate","Not Graduate"])
self_employed=st.selectbox("self_employed",["yes","No"])
loan_amount=st.number_input("Loan amount")
credit_history=st.selectbox("credit history",[1,0])
property_area=st.selectbox("Property Area",["urban","semiurban","rural"])

#prepare the input data
def preprocess():
    data=[]

    data.append(1 if gender == "Male"else 0)
    data.append(1 if Married == "Yes"else 0)
    data.append(0 if dependents == "0"else 1 if dependents =="1"else 2 if dependents =="2"else 3)
    data.append(1 if gender == "Not Graduate"else 0)
    data.append(1 if self_employed == "Yes"else 0)
    data.append(loan_amount)
    data.append(credit_history)
# property area label encoding
    if property_area=="Rural":
        data.append(0)
    elif property_area == "Semiurban":
        data.append(1)
    else:
        data.append(2)
    return np.array(data).reshape(1,-1)



#prediction
if st.button("predict"):
    input_data=preprocess()
    prediction=model.predict(input_data)
    if prediction[0]==1:
        st.write(f'loan approved')
    else:
        st.write(f'loan not approved')
