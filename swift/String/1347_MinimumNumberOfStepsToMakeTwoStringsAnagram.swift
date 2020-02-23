//https://leetcode.com/problems/minimum-number-of-steps-to-make-two-strings-anagram/ 
class Solution {
    private let AAsciiValue = Character("a").asciiValue!
    func minSteps(_ s: String, _ t: String) -> Int {
        let sortedSource = s.sorted()
        let sortedTarget = t.sorted()
        var count = 0
        for index in 0..<s.count {
            if sortedSource[index] != sortedTarget[index] {
                count += 1
            }
        }
        return count
    }
 }

