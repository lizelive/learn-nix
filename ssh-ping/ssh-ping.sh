#!/bin/sh

DATE_CMD='date +%s%N'
SSH_CMD="ssh $* $DATE_CMD"




# DATE_CMD="date +%s.%N"

# SSH_CMD="ssh -i $@ -- $DATE_CMD"

# echo $SSH_CMD

# # Loop through the number of tests
# for i in $(seq 1 $NUM_TESTS); do
#     # Get the start time
#     start=$($DATE_CMD)

#     # Run the SSH command
#     remote=$(ssh -i $SSH_ARGS -- "$DATE_CMD")

#     # Get the end time
#     end=$(date +%s.%N)

#     # Calculate the latency
#     latency=$((remote - start))
#     timediff=$((end - remote))
    

#     # Print the latency
#     echo "Latency for test $i: $latency ns ($timediff ns difference)"
# done