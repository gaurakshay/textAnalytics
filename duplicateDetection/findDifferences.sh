#!/bin/bash
clear

echo -n "This utility will iterate through all the *.py files and sort them"
echo " according to the difference amongst them."

# Print the current working directory
curpath=$(pwd)
echo "Current working directory $curpath"

loc_inserts=0
loc_deletes=0
loc_totdiff=0

# Go through all the files pairwise and find 
# the number of differences between them
echo -e "First file\t\t\tSecond file\t\t\tDifferences"

for filename1 in ./python-submissions/*.py; do
    for filename2 in ./python-submissions/*.py; do

        # If they are the same files, skip the comparison.
        if [ "$filename1" == "$filename2" ]; then
            continue
        fi

        # Find all the additions that will need to be done to the first file.
        loc_inserts=$(diff -u -w "$filename1" "$filename2" | grep -c '^+')
        # Find all the removals that will need to be done to the first file.
        loc_deletes=$(diff -u -w "$filename1" "$filename2" | grep -c '^-')
        # Add the differences to get total diff.
        loc_totdiff=$((loc_inserts+loc_deletes))

        # Print the file names along with differences.
        echo -e "${filename1}\t${filename2}\t${loc_totdiff}"
    done
done | sort -t$'\t' -nk5 -nk1 -nk3 # Sort the output according to the number of differences.
