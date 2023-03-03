## Making Hypothesis
# H0: The mena sales volumes of new items are all equal
# Ha: At least one of them are not equal

set.seed(145)

## Making a data fram form our given data 

Item_1 <- c(22,42,44,52,45,37)
Item_2 <- c(52,33,8,47,43,32)
Item_3 <- c(16,24,19,18,34,38)

df1 <- data.frame(Item_1,Item_2,Item_3)
str(df1)

## Concatenate the data rows of df1 into a single vector r

r <- c(t(as.matrix(df1))) # response data 

## Assign new variable for the treatment levels & number of ovservations.

f <- c("Item_1","Item_2","Item_3") #treatment levels
k <- 3       #numders of treatment levels
n <- 6       #observations per treatment

## Create a vector of treatment factors, corresponding to each element of "r", using the "gl" function.

tm <- gl(k, 1, n*k, factor(f))  #matching treatments.

## Apply the function "aov" to a formula thet describes the response r by the teratment factor tm

av <- aov(r ~ tm)

## Print out the ANOVA table with the "summsry" function.

summary(av)

## Comments: p-value 0f 0.105 > 0.05 significance level. Do not reject H0. Theis means that the mena sales volumes of new items are all equal. 