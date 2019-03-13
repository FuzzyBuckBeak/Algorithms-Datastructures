# Make middle node head in a linked list
Given a singly linked list, find middle of the linked list and set middle node of the linked list at beginning of the linked list.

### The idea is to first find middle of a linked list using two pointers, first one moves one at a time and second one moves two at a time. When second pointer reaches end, first reaches middle. We also keep track of previous of first pointer so that we can remove middle node from its current position and can make it head.
