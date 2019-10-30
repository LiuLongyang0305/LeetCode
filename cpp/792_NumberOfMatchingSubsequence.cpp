//https://leetcode.com/problems/number-of-matching-subsequences/
class Solution {
private :
    vector<vector<int >> charToIndices = vector<vector<int >>(26, vector<int>());
public:
    int numMatchingSubseq(string S, vector<string> &words) {
        for (int i = 0; i < S.length(); ++i) {
            charToIndices[S[i] - 'a'].push_back(i);
        }
        int ans = 0;
        for(auto word: words){
            vector<int > wordToInt = vector<int >(word.length(),0);
            for (int i = 0; i < word.length(); ++i) {
                wordToInt[i] = word[i] - 'a';
            }
            if(match(wordToInt)) {
                ans += 1;
            }
        }
        return ans;
    }

private:
    bool match(vector<int> &word) {

        int maxIndex = -1;
        int index = 0;
        int wordLength = word.size();
        while (index < wordLength) {
            int indicesLength = charToIndices[word[index]].size();
            int left = 0;
            int right = indicesLength;

            while (left < right) {
                int mid = (left + right) >> 1;
                if (charToIndices[word[index]][mid] > maxIndex) {
                    right = mid;
                } else if (charToIndices[word[index]][mid] < maxIndex) {
                    left = mid + 1;
                } else {
                    left = mid + 1;
                    break;
                }
            }
            if (left == indicesLength) {
                return false;
            }
            if (index == wordLength - 1) {
                return true;
            }
            maxIndex = charToIndices[word[index]][left];
            index += 1;
        }
        return false;
    }
};