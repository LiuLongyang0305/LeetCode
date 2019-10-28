//https://leetcode.com/contest/weekly-contest-160/problems/find-positive-integer-solution-for-a-given-equation/
class Solution {
public:
    vector<vector<int>> findSolution(CustomFunction &customfunction, int z) {
        int left = 1;
        int right = 1000;
        while (left < right) {
            int mid = (left + right) >> 1;
            if (customfunction.f(mid, 1) > z) {
                right = mid;
            } else {
                left = mid + 1;
            }
        }
        int xMax = left;
        left = 1;
        right = 1000;
        while (left < right) {
            int mid = (left + right) >> 1;
            if (customfunction.f(1, mid) > z) {
                right = mid;
            } else {
                left = mid + 1;
            }
        }
        int yMax = left;
        vector<vector<int>> ans;
        for (int k = 1; k <= xMax; ++k) {
            left = 1;
            right = yMax;
            while (left < right) {
                int mid = (left + right) >> 1;
                int rel = customfunction.f(k, mid);
                if (rel > z) {
                    right = mid;
                } else if (rel < z) {
                    left = mid + 1;
                } else {
                    ans.push_back(vector<int>({k,mid}));
                    break;
                }
            }
        }
        return ans;
    }
};