#!/bin/bash - 
#===============================================================================
#
#          FILE: report.sh
# 
#         USAGE: ./report.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Mariano Forti (MDF), mforti@cnea.gov.ar
#  ORGANIZATION: Comisión Nacional de Energía Atómica, Argentina
#       CREATED: 21/02/19 18:22
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

KEYWORD=$1
echo "" > report_"$KEYWORD".md

for file in *.md */*.md
do
  ismatch=$(awk -v keyword=$KEYWORD  'BEGIN{RS="##"};{if(match($0, keyword)){print $0}}' $file | tee match | wc -l )
  if [ $ismatch -gt 0 ]
  then
    date=$(dirname $file)
    year=${date:0:4}
    month=${date:4:2}
    day=${date:6:2}
    echo -e "\n## $day/$month/$year\n\n###$(sed 's/\#//g' match) " >> report_"$KEYWORD".md 
  fi
done

