# Race Condition in Shell Script Counter

This repository demonstrates a race condition bug in a simple shell script.

## Bug Description
The script attempts to increment a counter in a file using two concurrent processes. Because there's no mechanism to ensure atomicity (e.g., file locking), the final value of the counter is likely to be less than the expected 2 due to race conditions. 

## Bug Reproduction
1. Clone the repository.
2. Run `./bug.sh`
3. Observe the final value of the counter, it's likely to be 1 instead of 2. 

## Solution
The `bugSolution.sh` file provides a corrected version of the script, using `flock` to implement file locking and prevent race conditions.

## Technologies Used
Shell scripting
