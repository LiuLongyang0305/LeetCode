// https://leetcode.com/problems/minimum-deletions-to-make-character-frequencies-unique/
class Solution {
    func minDeletions(_ s: String) -> Int {
        var cnt = Array<Int>(repeating: 0, count: 26)
        s.forEach {cnt[Int($0.asciiValue! - 97)] += 1}
        cnt.sort {$0 > $1}
        var ans = 0
        for i in 1..<26 {
            while cnt[i] > 0 && cnt[i - 1] <= cnt[i] {
                cnt[i] -= 1
                ans += 1
            }
        }
        return ans
    }
}