# Markdown Log Reports

This script is thought as a simple keyword filter for your markdown logs. 
You just cd to the topdir of your markdown logs and execute the script:

```{bash}
/path/too/report.sh _keyword_ 
```

where _keyword_ can have spaces as long as I have tested. 
The command *find* is used to locate all the md files in all
the subfolders, and then *awk* is used to separate between the title 
marks in the files where the keyword is explicitly used. 

The output will be a report_keyword.md file with the 
blocks of text between # or ## where the keyword is mentioned.

The script is pretty simple, suggestions are wellcome. 

## detail on the log structure

The script suposes a structure of your logs where you have a different directory for each day of log.

for example:
```{shell}
(ins)$ tree 2020 | head
2020
├── 20200212
│   ├── TODAY.md
├── 20200313
│   ├── TODAY.md
├── 20200316
│   ├── TODAY.md
```

I do it automatically whith a shell function which is included in update_bashrc_or_profile.sh. 
simply append this file to your .bashrc or just source it in your init files. 


Also, the daytlte folder is included with a template to use. just update the directory where you will install it.

## Dependencies:
bash, awk, common shell commands: find, date.



## Possible improvements:

- change simple bash / awk wildcard filtering by real regex 

- keep it shell based, no python. 

- translate 
