// https://leetcode.com/problems/maximize-number-of-subsequences-in-a-string/
class Solution {
    func maximumSubsequenceCount(_ text: String, _ pattern: String) -> Int {
        var ans = 0
        let pf = pattern.first!, pl = pattern.last!
        var pfCnt = 0, plCnt = 0
        
        for ch in text {
            if ch == pf {
                pfCnt += 1
            } 
            if ch == pl {
                ans +=  pfCnt - (pl == pf ? 1 : 0)
                plCnt += 1
            }
        }
        // print(ans)
        return ans + max(pfCnt, plCnt)
    }
    
}