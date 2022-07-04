# M122 - Bash Scripting

## References

- echo
    - Prints to the screen
    - Syntax: echo [string]
    - Example: echo "Hello World"

- printf:
    - Prints to the screen
    - Syntax: printf [format] [arguments]
    - Example: `printf "Hello World"`

- man
    - Shows manual of given command
    - Syntax: man [command]
    - Example: `man nano`

- variables
    - Save values in variables (e.g string, numbers etc.)
    - Create: `name="Jonas"`
    - Usage: `echo $name` will print Jonas to the terminal

- parameters
  - Pass values to the script
  - Syntax: `$1`
  - Example: `echo $1` will print the first parameter to the terminal

- function
    - Save reusable code
    - Create: `function name() {
      code
      }`
    - Usage: `name` will execute the code

- if/elif/else
    - Conditional statement, to check if a condition is true or false
    - Syntax:
  ```shell
  if [condition]; then
      code
    elif [condition]; then
      code
    else
      code
    fi
   ```

    - Example:
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
      - Output:
        ```
        Hello Jonas
        ```

- for
  - Loop through a list of values
  - Syntax:
  ```shell
    for i in [list]; do
      code
    done
    ```
  - Example:
      ```shell
      for i in $(ls); do
        echo $i
      done
      ```
      - Output:
        ```
        .bash_profile
        .bashrc
        .gitconfig
        .gitignore
        .vimrc
        .zshrc
        ```

- while
  - Loop while a condition is true
  - Syntax:
  ```shell
    while [condition]; do
      code
    done
    ```
    - Example:
        ```shell
        while [[ $i -lt 10 ]]; do
            echo $i
            i=$((i+1))
        done
        ```
        - Output:
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

- until
  - Loop until a condition is true
  - Syntax:
  ```shell
    until [condition]; do
      code
    done
    ```
    - Example:
        ```shell
        counter=1
        until [[ $counter -gt 10 ]]
        do
            echo $counter
            counter=$((counter+1))
        done
        ```
        - Output:
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

- date
  - Prints current date and time
  - Syntax:
  ```shell
    date [format]
    ```
    - Example:
        ```shell
        date +%Y-%m-%d
        ```
        - Output:
            ```
            2022-01-01
            ```

- read
  - Reads input from the user
  - Syntax:
  ```shell
    read [variable]
    ```
    - Example:
        ```shell
        echo "Please enter your name: "
        read -r name
        echo "Hello $name"
        ```
        - Output:
            ```
            Please enter your name: Jonas
            Hello Jonas
            ```

- exit
  - Exits the program
  - Syntax:
  ```shell
    exit [exit code]
    ```
    - Example:
        ```shell
        exit 0
        ```

- break
  - Breaks out of a loop
  - Syntax:
  ```shell
    break
    ```
    - Example:
        ```shell
        for i in $(ls); do
            if [[ $i == "README.md" ]]; then
                echo "README.md found"
                break
            fi
        done
        ```

[//]: # (Show a table of different operators)
- comparators


- ls
  - List files in a directory
  - Syntax:
  ```shell
    ls [directory]
    ```
    - Example:
        ```shell
        ls
        ```
        - Output:
            ```
            README.md .gitignore etc...
            ```

- cat
  - Concatenates files
  - Syntax:
  ```shell
    cat [file]
    ```
  - Example:
    ```shell
    cat .gitignore
    ```
    - Output:
        ```
        .idea/
        ```

- nano
  -  
- find
  -  
- wc
  -  
- mv
  -  
- cp
  -  
- kill
  -  
- grep
  -  
- | / >> / >
  -  
- join
  -  
- rm
  -  
- stat
  -  
- PID

## Scripts

### Number Guesser

### Extra exercises \#4, 5, 8, 15, 16

### Data Converter

### Mini Projects

### Best Practices
