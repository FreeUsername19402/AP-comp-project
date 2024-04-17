#!/bin/bash

#credits to chatgpt and blackbox ai

#variable for list
declare -a todolist

if [ -e tasks.txt ] then 
	echo "saved tasks exist, continuing"
else
	"saved tasks doesn't exist, creating.."
	touch tasks.txt
fi

add_task() {
	if [ ${#todolist[@]} -ge 10 ]; then
		echo "your todo list is full"
	else
		echo -n "write your task:"
		read task
		todolist+=("$task")
		echo "task added, heres your current list:"
		echo "${todolist[@]}"
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

save_tasks() {
  echo -n "" > tasks.txt # truncate the file
  for task in "${todolist[@]}"; do
    echo "$task" >> tasks.txt
  done
  echo "Tasks saved to tasks.txt"
}


remove_task() {
	if [ ${#todolist[@]} -eq 0 ]; then
		echo "No tasks to remove"
	else
		echo -n "task number to remove:"
		read remtask
		if [ $remtask -gt ${#todolist[@]} ] || [ $remtask -lt 1 ]; then
			echo "Invalid task number"
		else
			unset 'todolist[$(($remtask - 1))]'
			todolist=("${todolist[@]}")
			echo "Task removed, heres your current list:"
			echo "${todolist[@]}"
		fi
	fi
}

echo "test gui"

while true; do
	read -p "Enter a choice (1: add task, 2: display tasks, 3: save all tasks, 4: remove task, 0: exit): " choice

	case $choice in
		1) add_task ;;
		2) display_task ;;
		3) save_tasks ;;
		4) remove_task ;;
		0) echo "Exiting..."; exit 0 ;;
		*) echo "Invalid choice. Please try again." ;;
	esac
done
