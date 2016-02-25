# Find Similarities

The purpose is to find the similarities/differences in the files that located in a directory.
The script located (findDifferences.sh) will look at all the .py files located in the current
directory and will use the GNU utility "diff" to find the differences in any two files.

The command used for finding the differences is:
        diff -u -w file1.py file2.py | grep -c '^+'
&       diff -u -w file1.py file2.py | grep -c '^-'

Explanation: 
diff -u -w will give all the unified differences ignoring the whitespaces. The output of the diff
command will be fed into the grep utility which will then count the number of differences between
the two files. Counting the '+' which appear in the beginning of the output from diff operator are
the additions that will need to be done to the first file and the '-' are the deletions that will
need to be done to the first file to get the second file.
In the end, the addition of these two counts should give us an idea of how different the two files
are. The differences are on sentence level obviously.


To run:
    Option a.
        On your command line: $ bash findDifferences.sh
    Option b.
        Change the file permissions to make the file editable with "chmod 755 findDifferences.sh"
        and then run the script with "./findDifferences.sh"

diff version : 3.3
grep version : 2.21
sort version : 8.23
