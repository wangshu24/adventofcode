# Learned from a master on reddit, what wizardry is this?

tr ,- < input.txt \ |xargs -n2 seq|egrep '^(.+)\1+$'|paste -sd+|bc

# tr read file from stdin into stream and transform it on the fly

# xargs read from the stdin, and turn the value read into arguments
# using flag -n2 to specify how many arguments to be read at a time 
# hence if we want to process more arguments, pass larger flag number
# following the -n2 flag, is the command to be executed, in this case seq
# seq is a command that takes in a start and end number, and print out all
# the number from start to end, inclusive

# egrep is a command that takes in a regular expression and print out all the
# lines that match the regular expression

# paste is a command that takes in a file and paste it into a single line
# -sd+ means to paste all the lines into a single line, and use + as the delimiter

# bc is a command that takes in a mathematical expression and evaluate it

# | is the pipe operator, it takes the output of the left command 
# and feed it into the right command


