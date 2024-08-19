#! bin/bash


if [ -z "$1" ]; then
  echo "Add the model name as a variable when rinning the script"
else
  # docker exec command:
  sudo docker exec ollama ollama run $1

fi

