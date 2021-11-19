// https://leetcode.com/problems/check-whether-two-strings-are-almost-equivalent/
class Solution {
    func checkAlmostEquivalent(_ word1: String, _ word2: String) -> Bool {
        var counter = [Character:Int]()
        word1.forEach { counter[$0, default: 0] += 1}
        word2.forEach { counter[$0, default: 0] -= 1}
        for (_,cnt) in counter {
            guard cnt >= -3 && cnt <= 3 else {
                return false
            }
        }
        return true
    }
}