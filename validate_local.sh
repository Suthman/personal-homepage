#!/bin/bash

# 1. Define your scripts in a list (array) here
SCRIPTS=(
  "bundle exec ruby exclude/postprocess_and_validate_llms_full.rb"
  "bundle exec ruby exclude/validate-published-files.rb"
  "bundle exec ruby exclude/validate-robots-txt.rb"
  "bundle exec ruby exclude/validate-html.rb --swap-localhost" # will opften fail locally -> execute at last!
)

# 2. Loop through each script in the list
for script in "${SCRIPTS[@]}"; do
  echo "----------------------------------------"
  echo "Running: $script"
  echo "----------------------------------------"
  
  # Execute the current script
  $script
  
  # Check the exit code of the last command ($?)
  # If it is not 0, a failure occurred
  if [ $? -ne 0 ]; then
    echo "❌ ERROR: '$script' failed!"
    echo "Aborting execution."
    exit 1
  fi
done

echo "----------------------------------------"
echo "✅ All scripts completed successfully!"
exit 0
