# Bash Cheat Sheet

## File and Directory Management
```sh
ls -la                        # detailed list of all files and directories in the current location
pwd                           # "print working directory", displays full path of the current directory
cd <directory>                # changes the current directory to the specified directory
mkdir <directory_name>        # creates a new directory with the given name
touch <file_name>             # creates a new, empty file or updates an existing files timestamp
cp <source> <destination>     # copies a file or directory from the source location to the destination
cp -R <source> <destination>  # copies directories recursively
mv <source> <destination>     # moves (or renames) a file or directory
rm <file_name>                # deletes the specified file
rm -rf <directory_name>       # remove directories and their contents
```

## Viewing and Searching Files
```sh
cat <file_name>             # prints file contents to the terminal
less <file_name>            # displays file contents one page at a time
head <file_name>            # prints the first 10 lines of a file
tail <file_name>            # prints the last 10 lines of a file
grep <pattern> <file_name>  # searches for a pattern within a file
```

## System Information and Utilities
```sh
echo <text>         # prints text or the value of a variable to the console
man <command_name>  # display manual pages for a given command
history             # shows a list of previously executed commands
clear               # clears the terminal screen
df -h <path>        # displays the available disk space in a human-readable format
du -sh <path>       # displays the dusk usage of files/directories in human-readble format
uptime              # displays how long the system has been running since it's last boot
ps aux              # displays currently running processes for all users
top                 # displays running processes and system statistics in real-time
```

## Pipe and Redirection
```sh
>   # redirects standard output of a command into a file, overwriting contents
>>  # appends the standard output of a command to the end of a file
|   # pipe output of one command as the input to another command
```
