#include <gb/gb.h>
#include <string.h>

//global variables
#include "../func/glob_vars.h"
#include "../sram/save_vars.h"

// C program to sort the array in an
// ascending order using selection sort
// obtained from https://www.geeksforgeeks.org/c-program-to-sort-an-array-in-ascending-order/

void swapScores(unsigned int* xp, unsigned int* yp){
	unsigned int temp = *xp;
	*xp = *yp;
	*yp = temp;
}

// Function to perform Selection Sort
void selectedScoreSort(unsigned int arr[], unsigned int n){
	unsigned int maxScore;

	// One by one move boundary of unsorted subarray
	for (i = 0; i != n - 1; i++) {
		// Find the minimum di in unsorted array
		maxScore = i;
		for (j = i + 1; j < n; j++){
			if (arr[j] > arr[maxScore]){
				maxScore = j;
                // Swap the found minimum element
                // with the first element
                swapScores(&arr[maxScore], &arr[i]);
            }
            //doesn't sort if it returns and breaks for loop of sorting
            //else return;
        }
	}
}

// Driver code
void sortScores(){
    ENABLE_RAM_MBC1;
    SWITCH_RAM_MBC1(0);

	unsigned int n = sizeof(hiScores) / sizeof(hiScores[0]);

	selectedScoreSort(hiScores, n);
}

//end copied sorting algorithm
