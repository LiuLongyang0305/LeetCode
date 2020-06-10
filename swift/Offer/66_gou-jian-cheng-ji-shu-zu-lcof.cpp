// https://leetcode-cn.com/problems/gou-jian-cheng-ji-shu-zu-lcof/
class Solution {
public:
    vector<int> constructArr(vector<int>& a) {
        vector<int> res(a.size());
        for (int i = 0, ans = 1; i < a.size(); ans *= a[i], i ++) res[i] = ans;
        for (int i = a.size() - 1, ans = 1; i >= 0; ans *= a[i], i --) res[i] *= ans;
        return res;
    }
};