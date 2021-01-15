#!/bin/bash
#===============================================================================
#
#          FILE:  update_bashrc_or_profile.sh
# 
#         USAGE:  ./update_bashrc_or_profile.sh 
# 
#   DESCRIPTION:  
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Mariano Forti (MF), mfotri@cnea.gov.ar
#       COMPANY:  Comisión Nacional de Energía Atómica
#       VERSION:  1.0
#       CREATED:  15.01.2021 08:31:40 CET
#      REVISION:  ---
#===============================================================================

#########
### Iniciar nueva bitacora
TODAY=$(date +%Y%m%d)
export TODAY
HOY=$(date +%d/%m/%Y)
export HOY
## set your log root directory:
ROOTLOG=/$HOME/Bitacoras/$(date +%Y)
##################################################
## set up a template for your logs
TEMPLATES=/PATH_TO_THE_TEMPLATE/daytlte/TODAY.md 
##################################################
# set up the file for today
TODAY_LOG=$ROOTLOG/$TODAY/TODAY.md
export TODAY
export HOY

# this function sets up yor log for today, and opens vim for editing the log and a task list
function bi() {

if [ ! -d $ROOTLOG/$TODAY ]; then mkdir $ROOTLOG/$TODAY ; fi
cd $ROOTLOG/$TODAY

if [ ! -f $TODAY_LOG ]
then
  cp $TEMPLATES $TODAY_LOG
  echo $TEMPLATES
  echo $TODAY_LOG
  sed "s|HOY|$HOY|g" $TEMPLATES > $TODAY_LOG 
  # uncomment if you want system logs:
#  logger -t $USERNAME "$TODAY_LOG"
#  logger -t $USERNAME "Se generó la bitácora de hoy, $TODAY "
# else  # uncomment if you want to syslog this
#  logger -t $USERNAME "la bitácora de hoy ya existe"
fi

vim TODAY.md +"vsplit $ROOTLOG/Bitacoras/$(date +%Y)/ListaDeTareas$(date +Y).md"

}

# and then an alias go to the 
alias tbi='cd '$ROOTLOG'/Bitacoras/'$(date +%Y)'/'
