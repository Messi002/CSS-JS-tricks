

#include <stdio.h>
#include <stdlib.h>
#include <string.h>


int top = -1, StackArray[100], ArraySize;

//function to check whether array is full
int isStackArrayFull(){
    if (top == ArraySize -1)
    {
       return 1;
    }

    return 0;
    
}

//function to check whether stack is empty
int isStackArrayEmpty(){
    if (top == -1)
    {
       return 1;
    }

    return 0;
    
}
//function to add an element into a STACK DS
void push(int data){
    if(isStackArrayFull()){
        printf("Stack Overflow! Can't add further elements\n");
        return;
    }

    top = top + 1;
    StackArray[top] = data;
}

//function to remove an element from a STACK DS
int pop(){

int value;
 if(isStackArrayEmpty()){
    printf("Stack underflow pop\n");
    exit(1);
 }

value = StackArray[top];
top = top -1;
return value;

}

//function to display values in stack
void display(){
    int i;
    if(top == -1){
        printf("Stack underflow print\n");
        return;
    }

 for(i= top; i>=0;i--)
 printf("%d\n",StackArray[i]);
}

//function peek
int topOfStack(){
    if(isStackArrayEmpty()){
        printf("Stack underflow\n");
        exit(1);
    }
return StackArray[top];
}

//function to get size of array
void sizeOfQueue(){
    printf("Stack array size: %d\n",ArraySize);
}


int main(int argc, char *argv[]){
  
//choice variable is based on the user's choice selected
//data variable is what is sent to the different functions
    int choice, data;

    while(1){
        printf("\n");
        printf("0. Create Stack_Array size\n");
        printf("1. Push\n");
        printf("2. Pop\n");
        printf("3. Print the top most element\n");
        printf("4. Print all the elements of the stack\n");
        printf("5. Size of the Stack\n");
        printf("6. Exit\n");

        printf("\n");
        printf("Please enter your choice: ");
        scanf("%d", &choice);
        printf("\n");

        switch (choice)
        {
         case 0:
            printf("Enter the Stack_Array size: ");
            scanf("%d", &ArraySize);
            break;
        case 1:
            printf("Enter the element to be pushed: ");
            scanf("%d", &data);
            push(data);
            break;
         case 2:
            data = pop();
            printf("Deleted element %d\n: ",data);
            break;
        case 3:
            printf("The topmost element is %d ",topOfStack());
            break;
        case 4:
            display();
            break;
        case 5:
            sizeOfQueue();
            break;
        case 6:
            exit(1);
        default:
        printf("Something went wrong...");
            break;
        }
    }
    return 0;
}

//gcc stack.c
//./a.out

    // int size = sizeof(queue) /sizeof(queue[0]);
