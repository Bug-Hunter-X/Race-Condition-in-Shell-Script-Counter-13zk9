#!/bin/bash

# This script demonstrates the solution to the race condition bug.
# It uses flock to ensure atomicity of counter increments.

# Create a counter file and initialize it to 0
echo 0 > counter.txt

# Function to increment the counter with proper locking
increment_counter() {
  flock -n 200 counter.txt || exit 1 # acquire a lock on the file; exit on failure
  local value=$(cat counter.txt)
  let value++
  echo $value > counter.txt
  flock -u 200 counter.txt  # unlock file
}

# Create and run two processes to increment the counter
for i in {1..2}; do
  increment_counter &
done

wait  # Wait for the processes to finish

# Print the final counter value
cat counter.txt
