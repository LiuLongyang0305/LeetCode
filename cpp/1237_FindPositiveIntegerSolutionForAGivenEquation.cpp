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
//        cout << xMax << "     " << yMax << endl;
        vector<vector<int>> ans;
        for (int i = 1; i <= xMax; ++i) {
            for (int j = 1; j <= yMax; ++j) {
                if (customfunction.f(i, j) == z) {
                    vector<int> temp;
                    temp.push_back(i);
                    temp.push_back(j);
                    ans.push_back(temp);
                }
            }
        }
        return ans;
    }
};