//https://leetcode.com/problems/longest-repeating-character-replacement/
class Solution {
public:
    int characterReplacement(string s, int k) {
        int count[26] = {0};
        int left = 0, right = 0, maxCount = 0, ans = 0;
        while (right < s.size()) {
            count[s[right] - 'A']++;
            maxCount = max(maxCount, count[s[right] - 'A']);
            while (right - left + 1 - maxCount > k) {
                count[s[left] - 'A']--;
                left++;
            }
            ans = max(ans, right - left + 1);
            right++;
        }
        return  ans;
    }
};