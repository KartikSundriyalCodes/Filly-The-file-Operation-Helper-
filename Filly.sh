#!/bin/bash

# Function to display the menu
display_menu() {
  clear
  echo "====================================="
  echo "          FILE OPERATIONS            "
  echo "====================================="
  echo "1. Append text to file"
  echo "2. Replace text in file"
  echo "3. View file content"
  echo "4. Exit"
  echo "====================================="
  read -p "Enter your choice (1-4): " choice
}

# Function to append text
append_text() {
  read -p "Enter the file name: " fileName
  read -p "Enter text to append: " appendText
  echo "$appendText" >> ./$fileName
  echo "Text appended successfully. Press any key to return to the menu."
  read -n 1
}

# Function to replace text
replace_text() {
  read -p "Enter the file name: " fileName
  read -p "Enter text to find: " searchText
  read -p "Enter text to replace with: " replaceText
  sed -i "s/$searchText/$replaceText/g" ./$fileName
  echo "Text replaced successfully. Press any key to return to the menu."
  read -n 1
}

# Function to view file content
view_file() {
  read -p "Enter the file name: " fileName
  cat ./$fileName
  echo "Press any key to return to the menu."
  read -n 1
}

# Main loop
while true; do
  display_menu
  case $choice in
    1)
      append_text
      ;;
    2)
      replace_text
      ;;
    3)
      view_file
      ;;
    4)
      echo "Exiting..."
      exit 0
      ;;
    *)
      echo "Invalid choice. Press any key to try again."
      read -n 1
      ;;
  esac
done