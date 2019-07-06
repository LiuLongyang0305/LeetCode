//https://leetcode.com/problems/maximize-sum-of-array-after-k-negations/
class Solution {
    func largestSumAfterKNegations(_ A: [Int], _ K: Int) -> Int {
        var sum = 0
        var ACopy = A
        for ele in ACopy {
            sum += ele
        }
        var i = 0
        while i < K {
            let minEle = ACopy.min()!
            let index = ACopy.firstIndex(of: minEle)!
            ACopy[index] = -minEle
            sum -= minEle
            sum += -minEle
            i += 1
        }
        return sum
    }
}