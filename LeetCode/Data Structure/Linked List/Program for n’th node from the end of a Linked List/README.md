# Program for n’th node from the end of a Linked List

### Given a Linked List and a number n, write a function that returns the value at the n’th node from end of the Linked List.


### Maintain two pointers – reference pointer and main pointer. Initialize both reference and main pointers to head. First move reference pointer to n nodes from head. Now move both pointers one by one until reference pointer reaches end. Now main pointer will point to nth node from the end. Return main pointer.
