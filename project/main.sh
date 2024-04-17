#!/etc/bash

echo basic bash program

echo "select a program"
echo "type out the name of the program you want to use"
ls programs/
echo
read select
echo 
echo select an option:
echo "Main[1] History[2] Clear history[3]" 
echo select an option:
read choice
if [ "$choice" = "1" ]; then
	bash programs/$select/main.sh
elif [ "$choice" = "2" ]; then
	cat programs/$select/history
elif [ "$choice" = "2" ]; then
	rm -rf programs/$select/history
else
	echo "Invalid, please enter a valid option"
fi
