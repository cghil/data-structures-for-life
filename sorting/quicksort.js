function swap(items, firstIndex, secondIndex){
	var temp = items[firstIndex];
	items[firstIndex] = items[secondIndex];
	items[secondIndex] = temp;
}

function partition(items, left, right){
	var pivot = items[Math.floor((right + left) / 2)],
		leftPointer = left,
		rightPointer = right;

	while (leftPointer<=rightPointer){
		while(items[leftPointer] < pivot){
			leftPointer++;
		}
		while(items[rightPointer] > pivot){
			rightPointer--;
		}
		if (leftPointer<=rightPointer){
			swap(items, leftPointer, rightPointer);
			leftPointer++;
			rightPointer--;
		}
	}
	return leftPointer
}

// this partition function accepts three arguments: 
// 1. items, which is the array of values to sort
// 2. left, which is the index to start the left pointer
// 3. right, which is the index to start the right pointer

// The pivot value is determined by added together the left and right values and then dividing by two
// The outer loop determines when all of the items in the array range have been processed

// The two inner loops control movement of the left and right pointers
// When both of the inner loops are completed, the pointers are compared and are swapped if necessary.
// After the swap, both pointers are shifted so that the outer loop continues in the right spot.

// The function returns the value of the lieft pointer because this is used to determine where to 
// start the partioning the next time.

// The quicksort algorithm works by partitioning the entire array and then recursively partitioning 
// the left and right parts of the array until the entire array is sorted.

function quickSort(items, left, right){
	var index;

	if (items.length > 1){
		index = partition(items, left, right)

		if (left < index -1){
			quickSort(items, left, index - 1);
		}

		if (index < right){
			quickSort(items, index, right);
		}
	}
	return items
}

// Worst case O(n^2)
// Average case O(nlog(n))