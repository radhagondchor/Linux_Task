while getopts "u:d:" opt; do
    case $opt in

    u)
          repo="$OPTARG"

        ;;
     d)
          days="$OPTARG"
       ;;
    esac
   done


if [ -z "$repo" ] || [ -z "$days" ]; then
  usage
fi

repo_name=$(mktemp -d)
git clone "$repo" "$repo_name"

cd $repo_name
commits=$(git log --since="$days days ago" --pretty=format:"%H|%an|%ae|%s" --date=local)

echo "Commit Id,Author Name,Author Email,Commit Message" > "commit_report.csv"
while IFS= read -r line; do
IFS='|' read -ra commit_info <<< "$line"
commit_Id="${commit_info[0]}"
author_Name="${commit_info[1]}"
author_Email="${commit_info[2]}"
commit_Message="${commit_info[3]}"

  if [[ $commit_message =~ ^JIRA-[0-9]+: ]]; then
    validity="Valid"
  else
    validity="Invalid"
  fi
  
  # Append information to the CSV file
  echo "$Commit_Id,$Author_Name,$Author_Email,\"$Commit_Message\",$validity" >> commit_report.csv
done <<< "$commits" 