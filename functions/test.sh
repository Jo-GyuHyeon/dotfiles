if ! commnad -v brew &> /dev/null; then
  echo "need install brew"
else 
  echo "Arledy install brew"


fi


if ! command -v brew &> /dev/null; then
    echo "<the_command> could not be found"
    exit
  else 
    echo  "Already"
fi
