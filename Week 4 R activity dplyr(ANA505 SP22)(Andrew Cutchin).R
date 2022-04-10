#Week 4: dplyr package

#Task: Write the function to get a dataset from Base R: HairEyeColor
#and give the dataset a new name of your choice
getwd()
setwd(dir(path.package(HairEyeColor)))
HairEyeColor
hair_eye_color <- HairEyeColor
hair_eye_color

#See the top rows of the data
#TASK: Write the function to see the top rows of the data
str(object = hair_eye_color)
# Top 2 Rows of each Male and Female
hair_eye_color[1:2, , "Male"]
hair_eye_color[1:2, , "Female"]

#Install and call the package dplyr
#TASK: Write the functions to install and call dplyr
install.packages(pkgs = "dplyr")
library(package = "dplyr")

#Let's just see the hair and sex columns
#Task: Write the function to 'select' just the hair and sex columns 
#(hint: use the 'select' function)
library(package = "tibble")
hair_eye_color <- as_tibble(hair_eye_color)
hair_eye_color %>% select(Hair, Sex)

#Let's name the dataset with just the two columns, Hair and Sex
#TASK: Write the function to save the two columns as a new dataset
#and give it a name
hair_color_sex <- hair_eye_color %>% select(Hair, Sex)
hair_color_sex

#Let's get rid of the Sex column in the new dataset created above
#TASK: Write the function that deselects the sex column
#(hint: use the 'select' function to not select a -column)
hair_color_sex %>% select(!(Sex))

#Let's rename a column name
#TASK: Write the function that renames 'sex' to 'gender'
rename(hair_eye_color, Gender = Sex)

#Let's make a new dataset with the new column name
#TASK: Write the function that names a new dataset that includes the 'gender' column
hair_eye_color <- rename(hair_eye_color, Gender = Sex) 
hair_eye_color

hair_eye_gender <- hair_eye_color
hair_eye_gender

#Let's 'filter' just the males from our dataset
#TASK: Write the function that includes only rows that are 'male'
hair_eye_male <- filter(hair_eye_gender, Gender == "Male")

#Let's 'group' our data by gender
#TASK: Write the function to group the data by gender (hint: group_by)
group_by(hair_eye_gender, Gender)
hair_eye_gender

#Let's see how many students were examined in the dataset (total the frequency)
#TASK: replace 'datasetname' with the name of your dataset and get the total
#After you run it, write the total here:_528___
total = mutate(hair_eye_color, total = cumsum(1:32))
total$total

#Since we have a males dataset, let's make a females dataset
#TASK: Write the function that includes only rows that are 'female'
hair_eye_female <- filter(hair_eye_gender, Gender == "Female")

#And now let's join the males and females
#TASK: Write the function that joins the male and female rows 
#(hint: try using 'union' or 'bind_rows')
hair_eye_mf <- bind_rows(hair_eye_male, hair_eye_female)
hair_eye_mf

#Optional Task: add any of the other functions 
#you learned about from the dplyr package
tally(hair_eye_mf)
