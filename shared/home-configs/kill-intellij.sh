# UNTESTED

# get full path to running intellij java process
# see comment on this answer: https://askubuntu.com/a/806143/594870
intellij_process_path=$(ps -eo command | grep java | awk '{ print $1 }' | grep intellij)
printf "killing $intellij_process_path"

kill $intellij_process_path
