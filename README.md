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

## Possible improvements:

- change simple bash / awk wildcard filtering by real regex 

- keep it shell based, no python. 

