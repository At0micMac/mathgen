# mathgen
Generates text files with math in them

## Files will look something like this:
```
29 + 17 = 46
3 + 58 = 61
17 + 82 = 99
75 + 99 = 174
86 + 80 = 166
49 + 35 = 84
4 + 22 = 26
99 + 44 = 143
19 + 56 = 75
15 + 92 = 107
```

You can set it to randomize, like above, or keep it in order. It supports additon, subtraction, multiplication, and division.

## mathgen -h
```
Usage: mathgen number -r
number: the number to count to, default 100
-r: randomize the list
-a: do addition list (default if none specified)
-m: do multiplication list
-s: do subtraction list
-all: do all of the lists
-h: show this help message

saves (operation name).txt in working directory
```
