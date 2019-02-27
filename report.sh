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
# TODO: tratar keywords con espacios!

set -o nounset                              # Treat unset variables as an error

KEYWORD=$1
printf -- '---\n'> report_"$KEYWORD".md 
printf -- 'title: Resumen para la palabra clave \"%b\" \n' $KEYWORD \
          >> report_"$KEYWORD".md
printf -- 'author: Bitacora de Mariano Daniel Forti\n' >> report_"$KEYWORD".md
printf -- 'date: Generado el %b\n' $HOY >> report_"$KEYWORD".md
printf -- '\n---\n' >> report_"$KEYWORD".md

for file in */*.md
do
  ismatch=$(awk -v keyword=$KEYWORD  'BEGIN{RS="##"};{if(match($0, keyword)){print $0}}' $file | tee match | wc -l )
  if [ $ismatch -gt 0 ]
  then
    date=$(dirname $file)
    year=${date:0:4}
    month=${date:4:2}
    day=${date:6:2}
    printf "\n## $day/$month/$year\n\n###" >> report_"$KEYWORD".md 
    sed 's/\#//g' match >> report_"$KEYWORD".md 
  fi
done

