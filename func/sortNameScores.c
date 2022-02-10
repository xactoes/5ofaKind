#include <gb/gb.h>
#include <string.h>

//global variables
#include "../func/glob_vars.h"
#include "../sram/save_vars.h"

// C program to sort the array in an
// ascending order using selection sort
// obtained from https://www.geeksforgeeks.org/c-program-to-sort-an-array-in-ascending-order/

void swapScores(unsigned int* xp, unsigned int* yp){
	unsigned int sTemp = *xp;
	*xp = *yp;
	*yp = sTemp;
}

void swapNames(unsigned char nIndex1, unsigned char nIndex2){
	unsigned char nTemp[1][8];

    for(k = 0; k < 8; k++){
        nTemp[0][k] = namesArray[nIndex1][k];
        namesArray[nIndex1][k] = namesArray[nIndex2][k];
        namesArray[nIndex2][k] = nTemp[0][k];
    }
}

// Function to perform Selection Sort
void selectedNameScoreSort(unsigned int sArr[], unsigned int n){
	unsigned int maxScore;

	// One by one move boundary of unsorted subarray
	for (i = 0; i != n - 1; i++) {
		// Find the minimum di in unsorted array
		maxScore = i;
		for (j = i + 1; j < n; j++){
			if (sArr[j] > sArr[maxScore]){
				maxScore = j;
                // Swap the found minimum element
                // with the first element
                swapScores(&sArr[maxScore], &sArr[i]);
                swapNames(maxScore, i);
            }
            //doesn't sort if it returns and breaks for loop of sorting
            //else return;
        }
	}
}

// Driver code
void sortNameScores(){
    ENABLE_RAM_MBC1;
    SWITCH_RAM_MBC1(0);

	unsigned int n = sizeof(hiScores) / sizeof(hiScores[0]);
    //unsigned int m = sizeof(namesArray) / sizeof(namesArray[0][8]);

	selectedNameScoreSort(hiScores, n);
}

//end copied sorting algorithm
