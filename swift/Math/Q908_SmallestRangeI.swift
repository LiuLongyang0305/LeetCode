//https://leetcode.com/problems/smallest-range-i/
class Solution {
    func smallestRangeI(_ A: [Int], _ K: Int) -> Int {
        var minEle = A[0]
        var maxEle = A[0]
        for ele in A {
            if minEle > ele {
                minEle = ele
            }
            if maxEle < ele {
                maxEle = ele
            }
        }
        let smallestRange = maxEle - minEle - 2 * K
        return smallestRange < 0 ? 0 : smallestRange
    }
}