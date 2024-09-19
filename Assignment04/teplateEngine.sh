#! /bin/bash

fname=""
topic=""

for arg in "$@"; do
  key=$(echo "$arg" | cut -d '=' -f 1)
  value=$(echo "$arg" | cut -d '=' -f 2)
  case "$key" in
    fname)
      fname="$value"
      ;;
    topic)
      topic="$value"
      ;;
    *)
      echo "Unknown key: $key"
      ;;
  esac
done


template_content=$(<trainer.template)

template_content=$(echo "$template_content" | sed -e "s|{{fname}}|$fname|g" -e "s|{{topic}}|$topic|g")

echo "$template_content"

