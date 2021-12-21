This is a short script to find *Boot Errors and Warnings* automatically
while the system is booting and then  forwarding them to a file which is
in the *Home Directoy*.

> dmesg | grep -iE 'error|warning' > $HOME/dmesg.txt

*dmesg* command is used to review boot messages of the system and it is
a cyclic buffer that contains log messages (includes Errors & Warnings) 
of the current system boot.

Also the *pipe* command sends the standard output of one command(dmesg)
to another which is *grep* command in here. The grep command with -iE switch
(i for ignor case distinctions and E for using extended grep)can search for
2 strings (Error-warning) and finally forward ( > ) the result to a file
named dmesg.txt which is in homedirectoy ($HOME variable returns
the homedirectoy address).

How to automate the script ?
 
    Use the crontab -e command to open your user account's crontab 
    file.Commands in this file run with your user account's permissions.
    If you want a command to run with system permissions, use the sudo
    crontab -e command to open the root account's crontab file.
    Go to the last line of the file and add this:
    @reboot [address to the script]
    save and exit.






