//https://leetcode.com/problems/find-in-mountain-array/
/**
 * *********************************************************************
 * // This is the MountainArray's API interface.
 * // You should not implement it, or speculate about its implementation
 * *********************************************************************
 */
 int get(MountainArray *, int index);
 int length(MountainArray *);
 
int findInMountainArray(int target, MountainArray* mountainArr){
	int  arrLength = length(mountainArr);
	int targetIndex = arrLength / 2;
	int deltaIndex = arrLength / 2;
	while(1) {
		deltaIndex /=  2;
		int first = get(mountainArr,targetIndex - 1);
		int third = get(mountainArr,targetIndex + 1);
		int second = get(mountainArr,targetIndex);
		if (first < second && second > third) {
			break;
		} else if (first < second && second < third) {
			targetIndex += deltaIndex;
		} else {
			targetIndex -= deltaIndex;
		}
	}

	if(arr[targetIndex] < target) {
		return -1;
	} else if (arr[targetIndex] == target) {
		return targetIndex;
	}
    // printf("****%d",targetIndex);
	int low = 0;
	int high = targetIndex - 1;
	while (low < high && low >= 0) {
		int mid = low + (high - low) >> 1;
		int temp = get(mountainArr,mid);
		if(temp == target) {
			return mid;
		} else if(temp > target) {
			high = mid - 1;
		} else {
			low = mid + 1;
		}
	}
	if (low == high) {
		if (get(mountainArr,low) == target) {
			return low;
		}
	}

	low = targetIndex + 1;
	high = arrLength - 1;
	while (low < high && high < arrLength) {
		int mid = low + (high - low) >> 1;
		int temp = get(mountainArr,mid);
		if(temp == target) {
			return mid;
		} else if(temp > target) {
			low = mid + 1;
		} else {
			high = mid - 1;
		}
	}
	if (low == high) {
		if (get(mountainArr,low) == target) {
			return low;
		}
	}
	return -1;
}


