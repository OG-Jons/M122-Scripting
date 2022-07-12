# M122 - Bash Scripting

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

### Extra exercises \#4, 5, 8, 15, 16

### Data Converter

### Mini Projects

### Best Practices
