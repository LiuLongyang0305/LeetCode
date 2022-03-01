// https://leetcode.com/problems/minimum-number-of-steps-to-make-two-strings-anagram-ii/
class Solution {
    func minSteps(_ s: String, _ t: String) -> Int {
        
        var counter = [Character:Int]()
        s.forEach { counter[$0,default: 0] += 1}
        t.forEach { counter[$0,default: 0] -= 1}
        return counter.reduce(0) { $0 + abs($1.value)}
    }
}