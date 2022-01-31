#include <stdio.h>

//global variables
#include "../func/glob_vars.h"

// C program to sort the array in an
// ascending order using selection sort
// obtained from https://www.geeksforgeeks.org/c-program-to-sort-an-array-in-ascending-order/

void swapDice(unsigned int* xp, unsigned int* yp){
	unsigned int temp = *xp;
	*xp = *yp;
	*yp = temp;
}

// Function to perform Selection Sort
void selectionSort(unsigned int arr[], unsigned int n){
	unsigned int minDi;

	// One by one move boundary of unsorted subarray
	for (i = 0; i < n - 1; i++) {
		// Find the minimum di in unsorted array
		minDi = i;
		for (j = i + 1; j < n; j++)
			if (arr[j] < arr[minDi])
				minDi = j;

			// Swap the found minimum element
			// with the first element
			swapDice(&arr[minDi], &arr[i]);
	}
}

// Function to print an array
void printArray(unsigned int arr[], unsigned int size){
	for (i = 0; i < size; i++)
		printf("%d ", arr[i]);
	printf("\n");
}

// Driver code
void sortDice(){
	unsigned int n = sizeof(diceValues) / sizeof(diceValues[0]);
	//printf("Original array: \n");
	//printArray(diceValues, n);

	selectionSort(diceValues, n);
	//printf("\nSorted array in Ascending order: \n");
	//printArray(diceValues, n);
}

//end copied sorting algorithm
