
#include <stdio.h>
#include <stdlib.h>
#include <string.h>



//definition of queue array
int queue[100];

//queue size
int QueueSize;

//definition of empty array or queue
int frontOfQueue = -1;
int endOfQueue = -1;




//function to display element at start of queue
void headofQueue(){
    if(frontOfQueue == -1 && endOfQueue ==-1){
        printf("Queue is empty");
    }
    printf("The element at the start of queue is %d\n",queue[frontOfQueue]);
}

//function to display element at end of queue
void endofQueue(){
    if(frontOfQueue == -1 && endOfQueue ==-1){
        printf("Queue is empty");
    }
    printf("The element at the end of queue is %d\n",queue[endOfQueue]);
}

//function to display all elements
void display() {
    int i;
    if (frontOfQueue ==-1 && endOfQueue == -1)
    {
        printf("Queue is empty");
        return;
    }
    

    for (int i = frontOfQueue; i < endOfQueue + 1; i++)
    {
        printf("%d\n", queue[i]);
    }
    
}

//function to add an new element
void enqueue(int data){
    //condition for full array
    if(endOfQueue == QueueSize - 1){
        printf("Queue overflow");
    }
    //condition of empty array
    else if (frontOfQueue == -1 && endOfQueue == -1)
    { 
        frontOfQueue = endOfQueue = 0;
        queue[endOfQueue]= data;
    }
    else{
        //inserting new element
        endOfQueue++;
        queue[endOfQueue] = data;

    }
}

//function to delete an element
int dequeue(){
    if (frontOfQueue == -1 && endOfQueue == -1)
    {
        printf("Queue underflow");
    }
    //empty array
    else if(frontOfQueue == endOfQueue){
        frontOfQueue = endOfQueue = -1;
         queue[frontOfQueue];
    printf("Deleted element %d, now queue array is empty",queue[1]);
         
    }
    else{
        printf("Deleted element %d", queue[frontOfQueue]);
        frontOfQueue++;
    }

}


//function to get size of array
void sizeOfQueue(){
    printf("Queue's size is: %d\n",QueueSize);
}

int main(){
    int choice, data;

    while(1){
        printf("\n");
        printf("0. Create Queue's size\n");
        printf("1. Enqeue\n");
        printf("2. Deqeue\n");
        printf("3. Print the element at head of queue\n");
        printf("4. Print the element at end of queue\n");
        printf("5. Print all the elements in the queue\n");
        printf("6. Size of the Queue array\n");
        printf("7. Exit\n");

        printf("Please enter your choice: ");
        scanf("%d", &choice);
        printf("\n");

        switch (choice)
        {
        case 0:
            printf("Enter the Queue's size: ");
            scanf("%d", &QueueSize);
            break;
        case 1:
            printf("Enter the element to be enqueued: ");
            scanf("%d", &data);
            enqueue(data);
            break;
         case 2:
            dequeue();
            break;
        case 3:
           headofQueue();
           break;
        case 4:
           endofQueue();
            break;
        case 5:
            display();
            break;
        case 6:
            sizeOfQueue();
            break;
        case 7:
            exit(1);
        default:
        printf("Something went wrong...");
            break;
        }
    }
    return 0;
}