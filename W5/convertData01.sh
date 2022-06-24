inputFile="$1"
outputFile="$2"

# Check if input and output is not zero length
if [ -z "$inputFile" ] || [ -z "$outputFile" ]; then
  echo "Usage: $0 <input file> <output file>"
  exit 1
fi

# Check if inputFile exists
if [ ! -f "$inputFile" ]; then
  echo "Input file does not exist"
  exit 1
fi

# Check if outputFile exists and delete if it does
if [ -f "$outputFile" ]; then
  echo "Output file exists, deleting..."
  rm -i "$outputFile"
fi

echo "Transforming $inputFile into $outputFile..."

# Transform data
# -a force grep to read as text-file
# -w check for 2 at the beginning of the line and remove if it doesn't
# | pipe the output to the next command
# -v "^2  26" filter out lines that start with 2<tab>26
# cut -f3-4 -> cut out everything but the third and fourth columns
# use Regex to remove all occurrences where it *doesn't* have a character and then 7 numbers
grep -a -w "^2" "$inputFile" | grep -a -v -w "^2  26" | cut -f3-4 | grep -a -v "[A-Z][0-9][0-9][0-9][0-9][0-9][0-9][0-9]" > "$outputFile"

exit 0
