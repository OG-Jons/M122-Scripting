
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
