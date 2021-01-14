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
printf -- '---\n'> report_"${KEYWORD/ /_}".md 
printf -- 'title: Resumen para la palabra clave \"%b\" \n' $KEYWORD \
          >> report_"${KEYWORD/ /_}".md
printf -- 'author: Bitacora de Mariano Daniel Forti\n' >> report_"${KEYWORD/ /_}".md
printf -- 'date: Generado el %b\n' $HOY >> report_"${KEYWORD/ /_}".md
printf -- '\n---\n' >> report_"${KEYWORD/ /_}".md

# for file in */*.md
for file in $(find -iname \*.md)
do
  ismatch=$(awk -v keyword="$KEYWORD"  -v RS='(^|\n)## ' -v IGNORECASE=1 \
            '{if(match($0, keyword)){print $0}}' $file \
	    | tee match | wc -l )
  if [ $ismatch -gt 0 ]
  then
    date=$(dirname $file)
    year=${date:0:4}
    month=${date:4:2}
    day=${date:6:2}
    printf "\n## $day/$month/$year\n\n###" >> report_"${KEYWORD/ /_}".md 
    sed 's/\#//g' match >> report_"${KEYWORD/ /_}".md 
  fi
done

