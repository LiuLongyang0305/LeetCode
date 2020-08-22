// https://leetcode.com/problems/check-if-a-string-can-break-another-string/
class Solution {
    func checkIfCanBreak(_ s1: String, _ s2: String) -> Bool {
        let sortedS1 = s1.sorted()
        let sortedS2 = s2.sorted()
        var larger = false
        var smaller = false
        for i in 0..<s1.count {
            if sortedS1[i] > sortedS2[i] {
                guard !smaller else {
                    return false
                }
                larger = true
            } else if sortedS1[i] < sortedS2[i] {
                guard !larger else {
                    return false
                }
                smaller = true
            }
        }
        return true
    }
}




