#!/bin/bash

#################################
# Array declaration 
#################################

# Declaring an associative array
declare -A associative_array_1

# Creating an associative array by specifying a list of key value pairs
echo "Declaring associative array by listing nodes:"
declare -A associative_array_2=([one]="Value1" [two]="Value2" [three]="Value3")
echo "Size of array: ${#associative_array_2[@]}"
echo "Values in array: ${associative_array_2[@]}"

# Creating associative array without flag -A
echo -e "\nCreating associative array without flag -A"
associative_array_3=([no_flag]="No -A flag set")
echo "associative_array_3[no_flag] = ${associative_array_3[no_flag]}"

#################################
# Array operations
#################################

declare -A associative_array

# Adding a new key value pair to the array
associative_array[key_1]="Value1"
echo "Added new key value pair, associative_array[key_1]=${associative_array[key_1]}"
echo "Size: ${#associative_array[@]}"

echo

# Checking if key already exists
if [[ ${associative_array[key_1]+exists} ]]; then
	echo "key_1 already exists"
else
	echo "key_1 does not exist"
fi

# Adding another key if it does not already exist
if [[ ${associative_array[key_2]+exists} ]]; then
	echo "key_2 already exists"
else
	associative_array[key_2]="Value2"
	echo "key_2 added, associative_array[key_2]=${associative_array[key_2]}; Size of array: ${#associative_array[@]}"
fi

# Updating a key value pair is done by just re-assigning the
# value reference by that key. If the key does not exist, a
# new key will be created with the provided value
associative_array[key_2]="Updated key_2 Value2"
echo "Updated associative_array[key_2]=${associative_array[key_2]}"

echo

# Iterating through all keys
for key in "${!associative_array[@]}"; do
	echo "Key: $key Value: ${associative_array[$key]}"
done

echo

# Deleting a particular key
unset -v associative_array[key_2]
echo "Deleted key_2. Keys present:"
for key in "${!associative_array[@]}"; do
	echo "Key: $key Value: ${associative_array[$key]}"
done

echo

# Adding keys using += operator
associative_array+=([key_2]="Value2")
associative_array+=([key_3]="Value3")
echo "Added new keys using += operator"
for key in "${!associative_array[@]}"; do
	echo "Key: $key Value: ${associative_array[$key]}"
done

unset associative_array_1
unset associative_array_2
unset associative_array_3
unset associative_array