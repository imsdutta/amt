# LCA

# PROBLEM 1: DATA:LCA.CSV. It is a simple contingency table of social class of parents, having 6 classes in the rows 
# to the mental health of the students, having 4 classes in the columns.
# The data is of total of 1660 students, with social status of parents from 1 standing for rich to 6, standing for poor. 
# Similarly, mental health ranges from 1, standing for best to 4, standing for the worst. 
# The objective is to come up with the appropriate number of latent classes of the students 
# incorporating both the mental health of students and social status of their parents.  

LCAD=read.csv("LCA.csv")
View(LCAD)
LCAD1=LCAD[,-1]
chisq.test(LCAD1)
# As the p-value is less than the .05 significance level, we reject the null hypothesis.
# that the mental health status is independent of parental soico economic status.


# PROBLEM 2: DATA: VALUES. It contains dichotomous survey responses 
# from 216 respondents to four questions (A, B, C, D) measuring tendencies 
# towards "universalistic" or "particularistic" values. 
# A data frame with 216 observations on 4 variables representing survey responses
# to dichotomous questions, with 1 denoting the "particularistic" values response 
# and 2 denoting the "universalistic" values response. 
# The objective is the clustering of the respondents according to their responses.  

library(poLCA)
library(MASS)
library(scatterplot3d)
View(values)
data(values)
str(values)
f <- cbind(A,B,C,D)~1
?cbin
M0 <- poLCA(f,values,nclass=1)
M1 <- poLCA(f,values,nclass=2,graphs = TRUE)
M2 <- poLCA(f,values,nclass=3,maxiter=8000,graphs = TRUE)
# Max Log likelihood  - Icrease between the models to be robust.
# Aic - Decrease between the models to be robust.


# PROBLEM 3: DATA: ELECTION. 
# This is the survey data from the 2000 American National Election Study. 
# There are two sets of six questions with four responses each, 
# asking respondents' opinions of how well various traits (moral, caring, knowledgeable, good leader, dishonest, intelligent) 
# describe presidential candidates Al Gore and George W. Bush.
# The objective is to find the type and profile of the voters voting for Bush and Al Gore and thus find who is in the lead. 

data(election)
View(election)
f2a <- cbind(MORALG,CARESG,KNOWG,LEADG,DISHONG,INTELG,MORALB,CARESB,KNOWB,LEADB,DISHONB,INTELB)~PARTY 
nes2a <- poLCA(f2a,election,nclass=3,nrep=5,graphs = TRUE) 


