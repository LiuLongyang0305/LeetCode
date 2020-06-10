//https://leetcode-cn.com/problems/zheng-ze-biao-da-shi-pi-pei-lcof/
class Solution {
public:
    bool isMatch(string s, string p) {
        vector<vector<bool>> dp(s.size() + 1, vector<bool>(p.size() + 1,false));
        dp[s.size()][p.size()] = true;
        for(int i = s.size(); i >= 0; --i){
            for(int j = p.size() - 1;j >= 0 ; --j) {
                bool firstMatch = i < s.size() && (s[i] == p[j] || p[j] == '.') ;
                if(j < p.size() - 1 && p[j + 1] == '*') {
                    dp[i][j] = (firstMatch && (dp[i + 1][j] || dp[i][j + 2])) || (!firstMatch && dp[i][j + 2]);
                } else {
                    dp[i][j] = firstMatch && dp[i + 1][j + 1];
                }
            }
        }
        return dp[0][0];
    }
};