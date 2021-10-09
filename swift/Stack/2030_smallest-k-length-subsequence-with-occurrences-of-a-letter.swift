// https://leetcode.com/problems/smallest-k-length-subsequence-with-occurrences-of-a-letter/
//TLE
class Solution {
    func smallestSubsequence(_ s: String, _ k: Int, _ target: Character, _ repetition: Int) -> String {
        let N = s.count
        let chars = [Character](s)
        var remain = s.reduce(0) { $0 + ($1 == target ? 1 : 0)}
        var need = repetition
        var ans = ""
        for i in 0..<N {
            while !ans.isEmpty && ans.last!.asciiValue! > chars[i].asciiValue! && (N - i + ans.count > k) && (ans.last! != target || remain > need )  {
                if ans.last! == target {
                    need += 1
                }
                ans.removeLast()
            }
            if ans.count < k {
                if(chars[i] == target || k - ans.count > need) {
                    ans.append(chars[i])
                    if chars[i] == target {
                        need -= 1
                    }
                }
            }
            if chars[i] == target {
                remain -= 1
            }
        }
        return ans
    }
}

//CPP:AC
class Solution {
public:
    
    string smallestSubsequence(string s, int k, char target, int rep) {
        int N = int(s.size());
        long remain = count(s.begin(), s.end(), target);
        string ans;
        for(size_t i = 0; i < N; i++) {
            while (!ans.empty() && ans.back() > s[i] && (N - i + ans.size() > k) && (ans.back() != target || remain > rep)) {
                if(ans.back() == target) {
                    rep++;
                }
                ans.pop_back();
            }
            if(ans.size() < k) {
                if(s[i] == target || k - (int)ans.length() > rep) {
                    ans.push_back(s[i]);
                    if(s[i] == target) {
                        rep--;
                    }
                }
            }
            if(s[i] == target) remain--;
        }
        return ans;
    }
};


