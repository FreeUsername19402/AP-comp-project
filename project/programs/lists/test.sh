#!/bin/bash

#credits to chatgpt and blackbox ai

#variable for list
declare -a todolist

#while true; do 
echo "test gui"
read choice
if [ "$choice" -eq "1" ]; then
	add_task

elif [ "$choice" -eq "2" ]; then
	display_task

elif [ "$choice" -eq "3" ]; then
	remove_task

elif [ "$choice" -eq "4" ]; then
	display_task

else
	echo "invalid"
fi



add_task() {
	if [ ${#todolist[@]} -ge 10 ]; then
		echo "your todo list is full"
	else
		echo -n "write your task: "
		read task
		todolist+=("$task")
		echo "task added, heres your current list: ${todolist[@]}"
	fi
}

display_task() {
	if [ ${#todolist[@]} -eq 0 ]; then
		echo "Your list is empty"
	else
		echo "to-do list:"
		for i in "${!todolist[@]}"; do
			echo "- ${i+1}. ${todolist[$i]}"
		done
	fi
}

remove_task() {
	if [ ${#todolist[@]} -eq 0 ]; then
		echo "No tasks to remove"
	else
		echo -n "task number to remove: "
		read remtask
		if [ $remtask -gt ${#todolist[@]} ] || [ $remtask -lt 1 ]; then
			echo "Invalid task number"
		else
			unset 'todolist[$(($remtask - 1))]'
			todolist=("${todolist[@]}")
			echo "Task removed, heres your current list: ${todolist[@]}"
		fi
	fi
}


