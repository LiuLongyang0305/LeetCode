#include<iostream>
int guess(int num);

class Q374_Solution {
public:
    int guessNumber(int n) {
        int left = 1;
        int right = n;
        while(left <= right){
            int mid = left + (right - left) / 2;
            int result = guess(mid);
            if (result == 0){
                return mid;
            } else if (result < 0)
            {
                right = mid - 1;
            } else
            {
                left = mid + 1;
            }
        }
        return -1;
    }
};

bool isBadVersion(int version);

class Q278_Solution {
public:
    int firstBadVersion(int n) {
        int left = 1;
        int right = n;
        while(left < right){
            int mid = left + (right - left) / 2;
            if (isBadVersion(mid)) {
                if(isBadVersion(mid - 1)) {
                    right = mid + 1;
                } else
                {
                    return mid;
                }
                
            } else
            {
                left = mid + 1;
            }
        }
        return isBadVersion(left) ? left : (left + 1);
    }
};