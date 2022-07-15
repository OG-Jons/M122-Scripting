# M122 - Bash Scripting
## Jonas Marschall - 15.07.2022

- [M122 - Bash Scripting](#m122---bash-scripting)
  * [References](#references)
  * [Operators](#operators)
  * [Scripts](#scripts)
    + [Number Guesser](#number-guesser)
    + [Extra exercises \#4, \#5, \#8, \#15, \#16](#extra-exercises-4-5-8-15-16)
    + [Data Converter](#data-converter)
    + [Remote server checker](#remote-server-checker)
    + [Backup creator](#backup-creator)
    + [Old file deleter](#old-file-deleter)
    + [Best Practices](#best-practices)
    + [Security checklist](#security-checklist)

## References

<table style="width: 100%">
<tr>
<td><strong>Element</strong>
</td>
<td style="min-width:20vw"><strong>Description</strong>
</td>
<td><strong>Example</strong></td>
<td><strong>Output (if any)</strong></td>
</tr>
<tr>
<td>

```shell
echo [string]
```

</td>
<td>Prints the string to the standard output</td>
<td>

```shell
$ echo "Hello World"
```

</td>
<td>

```
Hello World
```

</td>
</tr>
<tr>
<td>

```shell
printf [format] [arguments]
```

</td>
<td>Prints the string to the standard output, but encodes given string</td>
<td>

```shell
printf "\n"
```

</td>
<td>

```
((newline))
```

</td>
</tr>
<tr>
<td>

```shell
man [command]
```

</td>
<td>
Opens the manual of the given command, if it exists
</td>
<td>

```shell
$ man nano
```

</td>
<td>
<pre><span style="color: #4E9A06; "><b>NAME</b></span>
       nano
<span style="color: #4E9A06; "><b>SYNOPSIS</b></span>
<span style="color: #4E9A06; "><b>nano</b></span> [<span style="color: #06989A; "><b>options</b></span>] [[<span style="color: #4E9A06; "><b>
+</b></span><span style="color: #06989A; "><b>
line</b></span>[<span style="color: #4E9A06; "><b>,</b></span><span style="color: #06989A; "><b>column</b></span>]] <span style="color: #06989A; "><b>
file</b></span>]...
</pre>
</td>
</tr>
<tr>
<td>Variables</td>
<td>Save values (e.g strings, integers, arrays etc.) in variables, for future use</td>
<td>

```shell
name="Jonas"
echo $name
name="Peter"
echo $name
```

</td>
<td>

```
Jonas 
Peter
```

</td>
</tr>
<tr>
<td>Parameters</td>
<td>Pass values to the script</td>
<td>

```shell
echo $1
```

```shell
$ bash ./main.sh Hello!
```

</td>
<td>

```
Hello!
```

</td>
</tr>
<tr>
<td>Functions</td>
<td>Create a new function, for reusable code. Parameters can also be passed to the functions.</td>
<td>

```shell
function hello() {
    echo "Hello $1"
}
hello "Jonas"
```

</td>
<td>

```
Hello Jonas
```

</td>
</tr>
<tr>
<td>

`if`-`then`-`else`- `elif` -`fi`

</td>
<td>
Conditional statement, to check if a condition is true or false.
</td>
<td>

```shell
name="Jonas"
if [$name == "Jonas"]; then
    echo "Hello Jonas"
  elif [$name == "Peter"]; then
    echo "Hello Peter"
  else
    echo "Hello World"
fi
```

</td>
<td>

```
Hello Jonas
```

</td>
</tr>
<tr>
<td>

```shell
for variable in [array]; do
    [code]
done
```

</td>
<td>Loop through a list of values</td>
<td>

```shell
for i in $(ls); do
  echo $i
done
```

</td>
<td>

```
.bash_profile
.bashrc
.gitconfig
.gitignore
.vimrc
.zshrc
```

</td>
</tr>

<tr>
<td>

```shell
while [condition]; do
    [code]
done
```

</td>
<td>Loop <strong>while</strong> a condition is <strong>true</strong></td>
<td>

```shell
while [[ $i -lt 10 ]]; do
    echo $i
    i=$((i+1))
done
```

</td>

<td>

```
1
2
3
4
5
6
7
8
9
```

</td>
</tr>
<tr>
<td>

  ```shell
 until [condition]; do
   [code]
 done
 ```

</td>
<td>Loop <strong>until</strong> a condition is <strong>false</strong></td>
<td>

```shell
until [[ $i -gt 10 ]]; do
    echo $i
    i=$((i+1))
done
```

</td>
<td>

```
1
2
3
4
5
6
7
8
9
10
```

</td>
</tr>

<tr>
<td>

```shell
break
```

</td>
<td>
Breaks out of a loop
</td>
<td>

```shell
for i in $(ls); do
    if [ $i = "README.md" ]; then
        echo "README.md found"
        break 
    fi
done
```
</td>
<td>

Expected output, if README.md is in the directory

```
README.md found
```

</td>
</tr>
<tr>
<td>

```shell
date [format]
```

</td>
<td>
Get the current date print it. Optionally pass a format string.
</td>
<td>

```shell
$ date +%Y-%m-%d
```

</td>
<td>

```
2022-01-01
```

</td>
</tr>
<tr>
<td>

```shell
read [variable] [arguments]
```

</td>
<td>
Reads input from the user and stores it in a variable.
</td>
<td>

```shell
echo "Please enter your name: "
read -r name
echo "Hello $name"
```

</td>
<td>

```
Please enter your name: Jonas
Hello Jonas
```

</td>
</tr>
<tr>
<td>

```shell
exit [code]
```

</td>
<td>Exits the program, with the given exit code. The exit code can be read afterwards by using the <code>$?</code> variable.</td>
<td>

main.sh
```shell
exit 69
```

bash
```shell
$ bash ./main.sh
$ echo "$?"
```

</td>

<td>

```
69
```

</td>
</tr>
<tr>
<td>

```shell
ls [arguments] [directory]
```

</td>
<td>List files in a given directory. If no directory is passed, the current one will be listed.</td>
<td>

```shell
$ ls
```
</td>

<td>

```
README.md
```
</td>

</tr>
<tr>
<td>

```shell
cat [file]
```

</td>
<td>Read out content of files.</td>
<td>

```shell
$ cat .gitignore
```

</td>
<td>

```
.idea/
```

</td>
</tr>

<tr>
<td>

```shell
nano [file]
```
</td>
<td>
Edit files in a text editor.
</td>
<td>

```shell
$ nano .gitignore
# Opens file to be edited and saved
```

</td>
<td>
    
```
.idea/
```

</td>
</tr>

<tr>
<td>

```shell
find [directory] [arguments]
```
</td>

<td>
Search for files in a directory hierarchy
</td>
<td>

```shell
$ find . -name "*.sh"
```

</td>

<td>

```
All files with the extension .sh...

./W1/HelloWorld.sh
./W2/number-guesser.sh
```

</td>
</tr>

<tr>
<td>

```shell
mkdir [directory]
```

</td>

<td>
Creates a directory
</td>

<td>

```shell
$ mkdir new-directory
```
</td>

<td>
New directory created called new-directory
</td>

</tr>

<tr>
<td>

```shell
mv [file] [directory]
```
</td>

<td>
Move files or directories
</td>

<td>

```shell
$ mv .gitignore new-directory
```
</td>

<td>
.gitignore moved into new-directory
</td>

</tr>

<tr>
<td>

```shell
rm [file]
```
</td>

<td>
Delete a file or directory
</td>

<td>

```shell
$ rm -rf new-directory
```
</td>

<td>
Delete directory new-directory
-rf to delete all files inside as well
</td>
</tr>
<tr>
<td>

```shell
|
```

</td>
<td>
Use pipes to connect commands. Take the output from the first command and pass it as input to the second command.
</td>

<td>

```shell
$ echo "Hello" | wc -c
```
</td>

<td>

```
6
```

The count is 6, since echo adds a newline at the end, which is also counted.

</td>

</tr>
<tr>
<td>

```shell
>>
```

</td>
<td>
This is used to append to a file. If the file doesn't exist, it will be created.
</td>

<td>

```shell
$ echo "Hello, person reading this!" >> hello.txt
```
</td>

<td>

```shell
$ cat hello.txt
```

```
Hello, person reading this!
```

</td>

</tr>
</table>

## Operators

<table>
  <tr>
   <td><strong>Operator</strong>
   </td>
   <td><strong>Description</strong>
   </td>
   <td><strong>Example</strong>
   </td>
  </tr>
  <tr>
   <td colspan="3" ><strong>Compare integers - single brackets []</strong>
   </td>
  </tr>
  <tr>
   <td><strong>-gt</strong>
   </td>
   <td>Greater than
   </td>
   <td><code>if [ "$a" -gt "$b" ]</code>
   </td>
  </tr>
  <tr>
   <td><strong>-ge</strong>
   </td>
   <td>Greater or equal
   </td>
   <td><code>if [ "$a" -ge "$b" ]</code>
   </td>
  </tr>
  <tr>
   <td><strong>-lt</strong>
   </td>
   <td>Less than
   </td>
   <td><code>if [ "$a" -lt "$b" ]</code>
   </td>
  </tr>
  <tr>
   <td><strong>-le</strong>
   </td>
   <td>Less or equal
   </td>
   <td><code>if [ "$a" -le "$b" ]</code>
   </td>
  </tr>
  <tr>
   <td><strong>-eq</strong>
   </td>
   <td>Equal 
   </td>
   <td><code>if [ "$a" -eq "$b" ]</code>
   </td>
  </tr>
  <tr>
   <td><strong>-ne</strong>
   </td>
   <td>Not equal
   </td>
   <td><code>if [ "$a" -ne "$b" ]</code>
   </td>
  </tr>
  <tr>
   <td colspan="3" ><strong>Compare integers - double parentheses (())</strong>
   </td>
  </tr>
  <tr>
   <td><strong>></strong>
   </td>
   <td>Greater than
   </td>
   <td><code>(("$a" > "$b"))</code>
   </td>
  </tr>
  <tr>
   <td><strong>>=</strong>
   </td>
   <td>Greater or equal
   </td>
   <td><code>(("$a" >= "$b"))</code>
   </td>
  </tr>
  <tr>
   <td><strong>&lt;</strong>
   </td>
   <td>Less than
   </td>
   <td><code>(("$a" &lt; "$b"))</code>
   </td>
  </tr>
  <tr>
   <td><strong>&lt;=</strong>
   </td>
   <td>Less or equal
   </td>
   <td><code>(("$a" &lt;= "$b"))</code>
   </td>
  </tr>
  <tr>
   <td colspan="3" ><strong>String</strong>
   </td>
  </tr>
  <tr>
   <td><strong>=</strong>
   </td>
   <td>Equals
   </td>
   <td><code>if [ "$a" = "$b" ]</code>
   </td>
  </tr>
  <tr>
   <td><strong>==</strong>
   </td>
   <td>Equals
<p>
    Has different meanings, depending on the surrounding brackets
   </td>
   <td><code>[[ $a == z* ]]</code>   
<p>
Will return true, if $a starts with z
<p>
<code>[[ $a == "z*" ]]</code>
<p>
<code>[ "$a" == "z*" ]</code>
<p>
Will return true, if $a equals "z*"
   </td>
  </tr>
  <tr>
   <td><strong>!=</strong>
   </td>
   <td>Not equals
   </td>
   <td><code>if [ "$a" != "$b" ]</code>
   </td>
  </tr>
  <tr>
   <td><strong>-z</strong>
   </td>
   <td>Zero length
   </td>
   <td><code>if [ -z "$String" ]</code>
   </td>
  </tr>
  <tr>
   <td><strong>-n</strong>
   </td>
   <td>Not null
   </td>
   <td><code>if [ -n "$String" ]</code>
   </td>
  </tr>
  <tr>
   <td colspan="3" ><strong>File Operators</strong>
   </td>
  </tr>
  <tr>
   <td><strong>-e</strong>
   </td>
   <td>Checks, if file / directory exists
   </td>
   <td><code>if [ -e $filename ]</code>
   </td>
  </tr>
  <tr>
   <td><strong>-f</strong>
   </td>
   <td>Checks, if the file is a regular file
   </td>
   <td><code>if [ -f $filename ]</code>
   </td>
  </tr>
  <tr>
   <td><strong>-d</strong>
   </td>
   <td>Checks, if a directory exists
   </td>
   <td><code>if [ -d $filename ]</code>
   </td>
  </tr>
  <tr>
   <td><strong>-s</strong>
   </td>
   <td>Checks, if a file is empty
   </td>
   <td><code>if [ -s $filename ]</code>
   </td>
  </tr>
  <tr>
   <td><strong>-r</strong>
   </td>
   <td>Checks, if a file is readable
   </td>
   <td><code>if [ -r $filename ]</code>
   </td>
  </tr>
  <tr>
   <td><strong>-w</strong>
   </td>
   <td>Checks, if a file is writable
</td>
   <td><code>if [ -w $filename ]</code>
   </td>
  </tr>
  <tr>
   <td><strong>-x</strong>
   </td>
   <td>Checks, if a file is executable
   </td>
   <td><code>if [ -x $filename ]</code>
   </td>
  </tr>
  <tr>
   <td colspan="3" ><strong>Compound comparison [[]]</strong>
   </td>
  </tr>
  <tr>
   <td><strong>||</strong>
   </td>
   <td>or
   </td>
   <td><code>if [[ $a == 1 || $b == 1]]</code>
   </td>
  </tr>
  <tr>
   <td><strong>&&</strong>
   </td>
   <td>And
   </td>
   <td><code>if [[ $a == 1 && $b == 1]]</code>
   </td>
  </tr>
  <tr>
   <td><strong>!</strong>
   </td>
   <td>Not equal
   </td>
   <td>
   </td>
  </tr>
  <tr>
   <td colspan="3" ><strong>Compound comparison []</strong>
   </td>
  </tr>
  <tr>
   <td><strong>-o</strong>
   </td>
   <td>Or 
   </td>
   <td><code>if [ $n1 -gt 24 -o $n2 -lt 66 ]</code>
   </td>
  </tr>
  <tr>
   <td><strong>-a</strong>
   </td>
   <td>And 
   </td>
   <td><code>if [ $n1 -gt 24 -a $n2 -lt 66 ]</code>
   </td>
  </tr>
</table>

## Scripts

### Number Guesser

```shell
#!/bin/bash
## Number Guesser
## Author: Jonas Marschall
## Date: 15.06.2022
## 
## This script will ask the user to guess a number between 1 and 100.
##

max_guesses=3
random_number=$((RANDOM%20+1))

# Loop until the user has guessed the number or has run out of guesses
for (( i=1 ; i <= max_guesses ; i++ )) ; do

    echo "This is attempt #$i"

    # Ask the user to guess the number
    read -r -p "Pick a number between 1 and 20  " guess

    echo "You guessed $guess"

    # Check if the user guessed the number
    if [ "$random_number" -eq "$guess" ]; then
        echo "You guessed correctly!"
        exit 0
        break
    fi
    
    # Check if the user guessed higher than the number (-ge == greater or equal)
    if [ "$i" -ge $max_guesses ] ; then
        echo "You have exceeded $max_guesses tries and lost!"
        echo "The correct number was $random_number"
        exit 1
        break

    # Check if the user guessed lower than the number (-le == less or equal)
    elif [ "$random_number" -gt "$guess" ]; then
        echo "The hidden number is higher!"

    # Check if the user guessed higher than the number (-le == less or equal)
    elif [ "$random_number" -lt "$guess" ]; then
        echo "The hidden number is lower!"
    fi

done

```

### Extra exercises \#4, \#5, \#8, \#15, \#16         

```shell
#!/bin/bash -e
## Permission checker (Exercise #4)
## Author: Jonas Marschall
## Date: 15.06.2022
##
## The file_path is checked, if it exists (-f) and if the user has writing permission (-w).
##

if [ -f "file_path" ]; then
    echo "file_path passwords are enabled"
    if [ -w "file_path" ]; then
        echo "Sie haben die Berechtigung, \"file_path\" zu bearbeiten."
    else
        echo "Sie haben NICHT die Berechtigung, \"file_path\" zu bearbeiten."
    fi
fi
```


```shell
#!/bin/bash -e
## Arrays (Exercise #5)
## Author: Jonas Marschall
## Date: 15.06.2022
##
## Creates an array and prints it, with each on a new line
##

declare -a Creatures=("Mensch" "Bär" "Schwein" "Hund" "Katze" "Schaf")

printf "%s\n" "${Creatures[@]}"

```

```shell
#!/bin/bash -e
## Type of file checker (Exercise #6, #7 & #8)
## Author: Jonas Marschall
## Date: 15.06.2022
##
## Pass as many arguments as you want.
## Script will loop through, and check if it is a file, directory or special file / device.
##

# Loop through all parameters
for par in "$@"
do
  # Check if string entered is not empty
  if [ -n "$par" ]; then
      echo "Checking if the given parameter is a directory or file."
      
      # Check if the parameter is a directory
      # If it exists, display contents of directory
      if [ -d "$par" ]; then
          echo "The given parameter is a directory."
          echo "The files in the directory are:"
          ls -l "$par"
          
      # Check if the parameter is a file
      # If it exists, display contents of file, using cat
      elif [ -f "$par" ]; then
          echo "The given parameter is a file."
          echo "The file content is:"
          cat "$par"
          
      # Check if the parameter is a special file / device
      elif [ -c "$par" ]; then
          echo "It's a special file or a device."
          
      # Show a message, if it's none of them
      else
          echo "The given parameter is not a directory, file or special file."
      fi
      
      # Show file-type
      file "$par"
      
  # Show a message, if nothing was parsed
  else
      echo "You did not pass anything"
  fi
done

```

```shell
#!/bin/bash -e
## File-type renaming script (Exercise #15)
## Author: Jonas Marschall
## Date: 15.06.2022
##
## The script will ask the user to enter a file-prefix and a date. Additionally, it will prompt for the file-type.
## Then the script will rename all the files, with the given file-type, in the current directory,
## with the given prefix and date.
##

echo "Bitte geben Sie ein Präfix ein (Standardmäßig das heutige Datum):"

read -r prefix

if [[ -z $prefix ]]; then
  prefix=$(date +%Y-%m-%d)
fi

echo "Geben sie die Dateierweiterung ein (Standardmäßig \"jpg\"):"

read -r suffix

if [[ -z $suffix ]]; then
  suffix="jpg"
fi

for file in *."$suffix"; do
  echo "Alter name: $file"
  echo "Neuer Name: $prefix-$file"
  mv "$file" "$prefix-$file"
done

```

```shell
#!/bin/bash
## Process starter, stopper and reloader (Exercise #16)
## Author: Jonas Marschall
## Date: 16.06.2022
##
## The user has to give an operation type (start, stop or reload) and a process name.
## The script will then start, stop or reload the process.
## The process-id is stored in a file, so the script can stop the process later.
##

operationType="$1"
processToStart="$2"

if [ "$operationType" == "start" ]; then
  echo "Starting $processToStart"
  $processToStart &
  echo $! > "/run/user/$UID/$processToStart.pid"
  exit 0
elif [ "$operationType" == "stop" ]; then
  echo "Stopping $processToStart"
  pid=$(cat "/run/user/$UID/$processToStart.pid")
  kill "$pid"
  exit 0
elif [ "$operationType" == "reload" ]; then
  echo "Reloading $processToStart"
  pid=$(cat "/run/user/$UID/$processToStart.pid")
  kill -HUP "$pid"
  exit 0
else
  echo "Usage: $0 {start|stop|reload}"
  exit 1
fi

```

### Data Converter

```shell
#!/bin/bash -e
## Data Converter
## Author: Jonas Marschall
## Date: 24.06.2022
##
## This script takes an input file and converts it to a new file with specific formatting.
##

inputFile="$1"
outputFile="$2"

# Check if input and output is not zero length
if [ -z "$inputFile" ] || [ -z "$outputFile" ]; then
  echo "Usage: $0 <input file> <output file>"
  exit 1
fi

# Check if inputFile exists
if [ ! -f "$inputFile" ]; then
  echo "Input file does not exist"
  exit 1
fi

# Check if outputFile exists and delete if it does
if [ -f "$outputFile" ]; then
  echo "Output file exists, deleting..."
  rm -i "$outputFile"
fi

echo "Transforming $inputFile into $outputFile..."

# Transform data
# -a force grep to read as text-file
# -w check for 2 at the beginning of the line and remove if it doesn't
# | pipe the output to the next command
# -v "^2  26" filter out lines that start with 2<tab>26
# cut -f3-4 -> cut out everything but the third and fourth columns
# use Regex to remove all occurrences where it *doesn't* have a character and then 7 numbers
grep -a -w "^2" "$inputFile" | grep -a -v -w "^2  26" | cut -f3-4 | grep -a -v "[A-Z][0-9][0-9][0-9][0-9][0-9][0-9][0-9]" > "$outputFile"

exit 0
```

### Remote server checker

```shell
#!/bin/bash -e
## Check remote server
## Author: Jonas Marschall
## Date: 07.07.2022
##
## This script will take in a hostname and check if the server is online.
##


echo -n "Enter the host of the server you want to check: "
read -r host
ping -q -c 1 "$host" > /dev/null 2>&1 && echo "$host is online!" || echo "$host is offline!"
```

### Backup creator

```shell
#!/bin/bash -e
## SCP Backup creator
## Author: Jonas Marschall
## Date: 07.07.2022
##
## This script will zip a given directory and copy it to a remote server, using credentials from the user.
## It will then ask if the local copy should be deleted.
##


echo -n "Path to the directory you want to create a backup of: "
read -r backupPath

echo -n "Enter the host of the SCP server: "
read -r host

echo -n "Enter the user of the SCP server: "
read -r user

echo -n "Enter the password of the SCP server (optional): "
read -sr password

echo "Zipping: "
zip -r backup.zip "$backupPath"
echo "Zipping done. Zipped to backup.zip"

echo "Uploading: "
if [[ -n $password ]]; then
  scp backup.zip $user@$host:backup.zip
else
  scp backup.zip $user@$host:backup.zip -p $password
fi
echo "Uploading done. Backup.zip uploaded to $host"

echo "Do you want to delete the archive locally? (y/n)"
read -r delete
if [ "$delete" = "y" ]; then
  rm backup.zip
  echo "Deleted backup.zip"
fi
# Alternative is using rm -i to delete the file and requesting confirmation. But it's nicer for the user this way.
```

### Old file deleter

```shell
#!/bin/bash
## Old file deleter
## Author: Jonas Marschall
## Date: 07.07.2022
##
## This script will ask the user to enter a directory and a date.
## It will then delete all files in the directory that are older than the date.
## Before deleting, it will list the files and ask the user if he/she wants to delete them.
##

echo "Enter the directory: "
read -r path
# Check if path exists
if [ ! -d "$path" ]; then
  echo "$path does not exist"
  exit 1
fi

echo "From which date should the files be deleted (JJJJ-MM-TT): "
read -r date
# Check if date is valid
if ! [[ $date =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]]; then
  echo "Date $date is invalid"
  exit 1
fi

# Read out all the files in the given directory
files=$(find "$path" -type f)
deletable_files=()
#find "$path" -type f
# Loop through all the files
for file in $files; do
  # Check if the file is older than the given date
  if [[ $(stat -c %Y "$file") -lt $(date -d "$date" +%s) ]]; then
    deletable_files+=("$file")
    echo "$file"
  fi
done

echo "Should the files be deleted? (y/n)"
read -r answer
if [ "$answer" == "y" ]; then
  # Delete all the files
  for file in "${deletable_files[@]}"; do
    rm "$file"
  done

  echo "${#deletable_files[@]} files were deleted"
fi
```

### Best Practices

```shell
#!/bin/bash
## Best Practices
## Author: Jonas Marschall
## Date: 14.07.2022
##
## This script was handed in late, because i was occupied with sickness
## It is not meant to be perfect, but to be a good example of best practices
## for bash scripting.
##

set -o errexit # Stop the script if an error occurs (i.E non-zero exit code)
set -o nounset # Stop the script if an undefined variable is used
set -o pipefail # Stop the script if a command fails in a pipe

# Set some default exit codes
FILE_NOT_FOUND=404

# Logging functions, to be used in the script and give the user feedback
# This will not work as is, because the variables are not bound
function __msg_error() {
    [[ "${ERROR}" == "1" ]] && echo -e "[ERROR]: $*"
}

function __msg_debug() {
    [[ "${DEBUG}" == "1" ]] && echo -e "[DEBUG]: $*"
}

function __msg_info() {
    [[ "${INFO}" == "1" ]] && echo -e "[INFO]: $*"
}

__msg_error "Error messages are enabled"
__msg_debug "Debugging is enabled"
__msg_info "Info messages are enabled"


function handle_exit() {
    local exit_code=$?
    if [ $exit_code -ne 0 ]; then
        echo "Script failed with exit code $exit_code"
        exit $exit_code
    fi
}

# Listen to signals and handle them with the handle_exit function and exit the script
trap handle_exit 0 SIGHUP SIGINT SIGTERM SIGQUIT SIGABRT

# Test the default exit codes set above
function read_file() {
  if "file_that_does_not_exist.txt"; then
    return "$FILE_NOT_FOUND"
  fi
}
```

### Security Checklist

1. Handling all errors in the script.

To make sure, that no unexpected errors interfere with the script, you should always keep an eye on non-zero exit codes.
To do this, you can use `set -o errexit` in the script, which will exit the script, as soon as an error occurs.

To keep an eye on undefined variables, you can use `set -o nounset` in the script.

Lastly, `set -o pipefail` will **only** return a zero exit-code, if all commands in a pipeline succeed.

2. Preventing malicious scripts from users.

When asking a user for input, they could potentially enter a script, which will then be executed.
This could cause tremendous damage to the system.

To overcome this issue, you should always encase the variables in quotes.

An example of that is:

```shell
echo -n "Enter the path to the file: "
read -r path

# Using quotes here, prevents the input from being executed. It parses it as a string.
cat "$path"
```

3. Check dependencies

To make sure, that all dependencies are installed, you should check if the dependencies are installed, before executing the main part of a script.

An example of that could be:

```shell
# Create an array of dependencies
dependencies=(
  "git"
  "curl"
  "wget"
)
  
# Check if all dependencies are installed
for dependency in "${dependencies[@]}"; do
  if ! command -v "$dependency" >/dev/null 2>&1; then
    echo "Dependency $dependency is not installed"
    exit 1
  fi
done
```

4. Using the proper shell

There are more shells than just bash. Some examples are: `zsh`, `ksh` and `sh`. Each with their own set of pros and cons.

What to do, if you want to create a bash and specify, which shell you want to use?

```shell
# Define the shell to be bash
#!/bin/bash

# This can be changed, so for some others it would be:
#!/bin/zsh
#!/bin/ksh
#!/bin/sh
```
These should **always** be put at the top of the script, so that they are executed first.

5. Using proper code-style

To keep the code clean, you should use a proper style-guide, to help you keep an overview of the code.
An example, of a guide you could use, is the `Shell Style Guide` from Google.
A link to that would be here: [https://google.github.io/styleguide/shell.html](https://google.github.io/styleguide/shell.html)
