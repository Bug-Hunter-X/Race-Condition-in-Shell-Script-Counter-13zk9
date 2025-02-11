#!/bin/bash

# This script demonstrates a race condition bug.
# It uses two processes to increment a counter in a file.
# Due to the lack of proper locking, the final count might be less than expected.

# Create a counter file and initialize it to 0
echo 0 > counter.txt

# Function to increment the counter
increment_counter() {
  local value=$(cat counter.txt)
  let value++
  echo $value > counter.txt
}

# Create and run two processes to increment the counter
for i in {1..2}; do
  increment_counter &
  # Without any synchronization mechanism, there is a race condition
done

wait  # Wait for the processes to finish

# Print the final counter value
cat counter.txt
