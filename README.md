README
======

This README file accompanies **Project 1** for the course "*Exploratory Data Analysis*". 

**Data specification can be found on this [course webpage](https://class.coursera.org/exdata-007/human_grading/view/courses/972594/assessments/3/submissions)**

##Goals of the Project

The goals of this project are fully explicatd by the course instructor, and are copied here: 

1. To examine how household energy usage varies over a 2-day period in February, 2007. Your task is to reconstruct the following plots below, all of which were constructed using the base plotting system.

2. First you will need to fork and clone the following GitHub repository: https://github.com/rdpeng/ExData_Plotting1

3. For each plot you should

   a. Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.

   b. Name each of the plot files as plot1.png, plot2.png, etc.
   
   c. Create a separate R code file (plot1.R, plot2.R, etc.) that constructs the corresponding plot, i.e. code in plot1.R constructs       the plot1.png plot. Your code file should include code for reading the data so that the plot can be fully reproduced. You should also include the code that creates the PNG file.

4. Add the PNG file and R code file to your git repository

5. When you are finished with the assignment, push your git repository to GitHub so that the GitHub version of your repository is up to date. There should be four PNG files and four R code files.

##Dependencies Required for Running the R Script
All `plot*.R` files have a dependency on the `sqldf` package so that SQL commands can be used to read in
only data from 01 and 02 Feb 2007

## Other Information
The user is reminded to use `setwd()` prior to running the programs. Please note that it is assumed that
the user has the data set file "*household_power_consumption.txt*" is in the working directory


##How `plot*.R` Implements the Project Goals

1. Requires the `sqldf` library
2. Reads the "*household_power_consumption.txt*" data file using date restrictions set forth in the SQL command using `read.csv.sql`
3. Converts date and time using `as.Date()` and `as.POSIXct()` commands
4. Constructs the plot of interest using the base package
5. Prints the plot as a "*.png" file, which is saved in the working directory
