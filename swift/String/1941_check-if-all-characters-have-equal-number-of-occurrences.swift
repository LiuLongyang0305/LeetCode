//https://leetcode.com/problems/check-if-all-characters-have-equal-number-of-occurrences/
class Solution {
    func areOccurrencesEqual(_ s: String) -> Bool {
        var counter = [Character:Int]()
        for ch in s {
            counter[ch,default:0] += 1
        }
        let target = counter[s.first!]!
        for (_,cnt) in counter {
            guard cnt == target else {
                return false
            }
        }
        return true
    }
}