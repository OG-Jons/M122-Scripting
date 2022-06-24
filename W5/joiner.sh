#!/bin/bash
# Join Person.txt and Password.txt to new file called UserAndPassword.txt

join -1 1 -2 3 Person.txt Password.txt
