
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
int queue[100],QueueSize;
//definition of empty array or queue
int frontOfQueue = -1;
int endOfQueue = -1;

//function to display element at end of queue
void endofQueue(){
    if(frontOfQueue == -1 && endOfQueue ==-1){
        printf("Queue is empty");
    }
    printf("The element at the end of queue is %d\n",queue[endOfQueue]);
}


//function to get peek value
void headofQueue(){
    if(frontOfQueue == -1 && endOfQueue ==-1){
        printf("Queue is empty");
    }
    printf("The element at the head of queue is %d\n",queue[frontOfQueue]);
}


//function to display all values
void display() {
    int i = frontOfQueue;
    if (frontOfQueue ==-1 && endOfQueue == -1)
    {
        printf("Queue is empty");
        return;
    }
    
    else{
        printf("Queue is :");
        while(i != endOfQueue){
            printf(" %d ", queue[i]);
            i = (i+1)%QueueSize;       }
        printf(" %d ", queue[endOfQueue]);
    }
    
}

void enqueue(int data){
    //condition for full array
    if(
    (endOfQueue+1)%QueueSize == frontOfQueue 
    ){
        printf("Queue overflow");
    }
    //condition of empty array
    else if (frontOfQueue == -1 && endOfQueue == -1)
    { //array is empty
        frontOfQueue = endOfQueue = 0;
        queue[endOfQueue]= data;
    }
    else{
        //inserting new element
        endOfQueue = (endOfQueue + 1)%QueueSize;
        queue[endOfQueue] = data;
    }
}

int dequeue(){
    //empty queue
    if (frontOfQueue == -1 && endOfQueue == -1)
    {
        printf("Queue underflow");
    }
    //only one element in the queue
    else if(frontOfQueue == endOfQueue){
              queue[frontOfQueue];
    printf("Deleted %d,now queue array is empty",queue[frontOfQueue]);
        frontOfQueue = endOfQueue = -1;
      
    }
    else{
        printf("The deleted data is %d", queue[frontOfQueue]);
        frontOfQueue = (frontOfQueue+1)%QueueSize;
    }

}


//function to get size of array
void sizeOfQueue(){
    printf("Queue array size: %d\n",QueueSize);
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