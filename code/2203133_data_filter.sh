#!/bin/bash

# Creation of variables 
file_name=$1
field_name=$2
field_value=$3

# Creating a variable which would just store 2  characters of the file name
file_name_2=${file_name:0:2}

# Creating the output file name first
output_file_name=$file_name_2"_"$field_name"_"$field_value".csv"

# Creating the output file
touch $output_file_name

# Storing the total number of lines after filtering the data into a  file
grep -iw "$field_value" $file_name >> $file_name.txt

# Storing the number of lines into a variable
lines=$(wc -l $file_name.txt)

# Removing unecessary file
rm $file_name.txt

# Entering the first line into the output file

echo $file_name, $field_name, $field_value, $lines >> $output_file_name

# Entering the second line of column headers into the outptu file

cat $file_name | head -n 1 >> $output_file_name

# Storing all the rows which have their field name equal to the field value 

grep -iw "$field_value" $file_name >> $output_file_name

# PROGRAM OVER
