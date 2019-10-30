// https://leetcode.com/problems/number-of-subarrays-with-bounded-maximum/
class Solution {
public:
    int numSubarrayBoundedMax(vector<int> &A, int L, int R) {
        int ans = 0;
        int lastLargeThanRNumIndex = -1;
        int lastInTheRangeNumIndex = -1;
        for (int i = 0; i < A.size(); ++i) {
            if(A[i] > R) {
                lastLargeThanRNumIndex =  i;
            } else if (A[i] < L ) {
                if(lastInTheRangeNumIndex  != -1 && lastInTheRangeNumIndex > lastLargeThanRNumIndex) {
                    ans += lastInTheRangeNumIndex - lastLargeThanRNumIndex;
                }
            } else {
                lastInTheRangeNumIndex = i;
                ans += i - lastLargeThanRNumIndex;
            }
        }
        return ans;
    }
};