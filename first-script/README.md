This is a short [script](https://github.com/samaneharia/scripts/blob/edit/first-script/errorfinder.sh) to find *Boot Errors and Warnings* automatically
while the system is booting and then  forwarding them to a file which is
in the ***Home Directoy***.

* First copy the filescript in this path :
> cp [filescrpit address] /usr/local/bin

* Then you must edit crontab file to automate the script :
> crontab -e

*Note:If you use ***sudo crontab -e*** the scirpt will run with root user
and will use the root home dirctory as a address to creat the final file.*

* And then go at the end of this file and add this command:
> @reboot /usr/local/bin/[script's name]

At the end press ***:wq*** to save and exit.

Now your scrpit will be run everytime that your system is starting up.




