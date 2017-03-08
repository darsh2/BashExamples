#!/bin/bash

##########################################################
# Array declaration
##########################################################

# Declaring an array
declare -a array_indexed

# Declaring an array by assigning a value to a
# particular index
key=3
array_assignment[3]='Created array by assigning value at a particular index'
# echo "${array_assignment[@]}"

# Creating an array by specifying a list of elements
array=(0 1 2 3 4)

##########################################################
# Array operations
##########################################################

# Size of array
echo "Size of array: ${#array[@]}"

# Print all elements of the array
echo "Elements in array: ${array[@]}"

# Add new value to the array using +=
array+=($(( ${#array[@]} )))
echo -e "\nAdded new element by using += operator"
echo "Elements in array: ${array[@]}"

# Add new value to the array by using paranthesis expansion
# Surround with quotes only if value contains spaces in between
array=("${array[@]}" "$(( ${#array[@]} ))")
echo -e "\nAdded new element by using paranthesis expansion"
echo "Elements in array: ${array[@]}"

# Get list of keys in array
echo -e "\nArray index and value at index:"
for index in "${!array[@]}"; do
	echo "array[$index] = ${array[$index]}"
done

# Removing a particular element
unset array[3]
echo -e "\nDeleting element at index 3"
echo "Array is now:"
for index in "${!array[@]}"; do
	echo "array[$index] = ${array[$index]}"
done

# Adding new element at index 11
array[11]=11
echo -e "\nAdding new element at index 11"
echo "Array is now:"
for index in "${!array[@]}"; do
	echo "array[$index] = ${array[$index]}"
done

# Updating value at a particular index
array[11]=$(( ${array[11]} * ${array[11]} ))
echo -e "\nUpdating value at index 11 to it's square"
echo "Array is now:"
for index in "${!array[@]}"; do
	echo "array[$index] = ${array[$index]}"
done

# Delete the entire array
unset array_indexed
unset array_assignment
unset array