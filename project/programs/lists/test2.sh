#!/bin/bash

echo "test gui"

while true; do
  echo "Choose an option:"
  echo "1. Add a task"
  echo "2. Display tasks"
  echo "3. Remove a task"
  echo "4. Quit"

  read choice

  if [ "$choice" = "1" ]; then
    add_task

  elif [ "$choice" = "2" ]; then
    display_task

  elif [ "$choice" = "3" ]; then
    remove_task

  elif [ "$choice" = "4" ]; then
    echo "Goodbye!"
    break

  else
    echo "Invalid option. Please try again."
  fi
done

add_task() {
  # function implementation here
}

display_task() {
  # function implementation here
}

remove_task() {
  # function implementation here
}
