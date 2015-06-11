function swap(list, firstIndex, secondIndex){
	var temp = list[firstIndex];
	list[firstIndex] = list[secondIndex];
	list[secondIndex] = temp;
}

function selectionSort(list){
	var size = list.length, minIndex;

	for (var i=0; i < size; i++){
		minIndex = i;
		for (nextIndex= i+1; nextIndex < size; nextIndex++){
			if (list[nextIndex] < list[minIndex]){
				minIndex = nextIndex;
			}
		}
		if (minIndex != i){
			swap(list, i, minIndex);
		}
	}
	return list;
}

var array = [949, 394, 29, 30, 1, 75, 9203];
var results = selectionSort(array);
console.log(results);


