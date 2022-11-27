#include <stdio.h>
#include <stdlib.h>

struct node{
    int data;
    struct node *link;
};

int main(int argc, char const *argv[])
{
    //code for generating the next node
    struct node *head = malloc(sizeof(struct node));
    head->data = 45;
    head->link=NULL;

    //display of second node
    struct node *current = malloc(sizeof(struct node));
    current->data = 98;
    current->link=NULL;
    head->link=current;

    //3rd node
    current = malloc(sizeof(struct node));
    current->data=4;
    current->link=NULL;
    head->link->link = current;
    printf("Head pointing to %ld\n",head->link->link);
    return 0;
}



// A stack is a [linear DS] in which insertions and deletions are 
//allowed only [at the end] called the 
//top of the stack

//Defining a stack as an ADT(Abstract Data Type) means we are concerned
//only with the operations from the user point of view

//primary stack operations
//1. push(data) : inserting data onto stack
//2.pop(): removes data
//3.top(): returns the top element
//4.size(): returns the size of the stack
//5. isEmpty(): returns true if stack is empty
//6.isFull():returns true if the stack is full

//Note: top = 0 indicates that the top most element is at index 0
//and this means there's only one element in the stack.

//Overflow state is when the array is full and any new element can't be
//added to it.

/******************/
//to add element: increment variable top first then store the value at the index.
//to remove element : element at position top is deleted and top is decremented.