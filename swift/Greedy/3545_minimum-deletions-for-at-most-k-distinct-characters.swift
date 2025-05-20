//https://leetcode.com/problems/minimum-deletions-for-at-most-k-distinct-characters/
class Solution {
    func minDeletion(_ s: String, _ k: Int) -> Int {
        var counter = [Character:Int]()
        for ch in s {counter[ch,default: 0] += 1}
        var sortedCounter = counter.sorted { $0.value < $1.value}
        var ans = 0
        while sortedCounter.count > k {
            ans += sortedCounter.removeFirst().value
        }
        return ans
    }
}