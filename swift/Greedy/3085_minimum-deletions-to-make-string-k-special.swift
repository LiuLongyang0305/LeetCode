//https://leetcode.com/problems/minimum-deletions-to-make-string-k-special/

class Solution {
    func minimumDeletions(_ word: String, _ k: Int) -> Int {

        var ans = word.count
        var counter = [Character:Int]()
        for ch in word {counter[ch,default: 0] += 1}
        for (_,cnt1) in counter {
            var remove = 0
            for (_,cnt2) in counter {
                if cnt2 < cnt1 {
                    remove += cnt2
                }

                if cnt2 > cnt1 + k {
                    remove += cnt2 - cnt1 - k
                }
            }
            ans = min(ans,remove)
        }
        return ans
    }
}
