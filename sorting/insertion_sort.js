function insertionSort(list){
	var size = list.length,
		value,
		index,
		jindex;

	for (index = 0; index < size; index++){
		value = list[index];
		console.log(+value+ ' Unsorted Item');
		for (jindex = index - 1; jindex > -1 && list[jindex] > value; jindex--){
			list[jindex+1] = list[jindex];
			console.log('switch')
		}
		list[jindex+1] = value;
		console.log('sorted list: '+ list+'')
	}
	return list;
}

var array = [1, 4, 98, 45, 10, 145];

console.log(insertionSort(array));