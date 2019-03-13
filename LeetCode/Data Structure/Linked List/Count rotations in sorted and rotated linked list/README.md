# Count rotations in sorted and rotated linked list

Given a linked list of n nodes which is first sorted, then rotated by k elements. Find the value of k.

### The idea is to traverse singly linked list to check condition whether current node value is greater than value of next node. If the given condition is true, then break the loop. Otherwise increase the counter variable and increase the node by node->next. Below is the implementation of this approach.
