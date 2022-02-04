#include <stdio.h>

//global variables
#include "../func/glob_vars.h"
#include "../sram/save_vars.h"


//I need to make my own sorting that sorts the scores, and moves themAND the names around as needed






// C program to sort the array in an
// ascending order using selection sort
// obtained from https://www.geeksforgeeks.org/c-program-to-sort-an-array-in-ascending-order/

void swapScores(unsigned int* xp, unsigned int* yp){
	unsigned int temp = *xp;
	*xp = *yp;
	*yp = temp;
}

// Function to perform Selection Sort
void choiceSort(unsigned int arr[], unsigned int n){
	unsigned int minScore;

	// One by one move boundary of unsorted subarray
	for (i = 0; i < n - 1; i++) {
		// Find the minimum di in unsorted array
		minScore = i;
		for (j = i + 1; j < n; j++)
			if (arr[j] < arr[minScore])
				minScore = j;

			// Swap the found minimum element
			// with the first element
			swapScores(&arr[minScore], &arr[i]);
	}
}

// Driver code
void sortScore(){
	unsigned int n = sizeof(hiScores) / sizeof(hiScores[0]);

	choiceSort(diceValues, n);
}

//end copied sorting algorithm
