
//https://leetcode.com/problems/partition-array-into-three-parts-with-equal-sum/
class Solution {
    func canThreePartsEqualSum(_ A: [Int]) -> Bool {
        var sum = 0
        var maxElement = Int.min
        var currentSum = [Int]()
        
        for ele in A {
            sum += ele
            if maxElement < ele {
                maxElement = ele
            }
            currentSum.append(sum)
        }
        var targetVal = sum / 3
        if sum % 3 != 0 {
            return false
        }
        var i = 0
        while i < A.count - 2 {
            if currentSum[i] == targetVal {
                break
            }
            i += 1
        }
        if i == A.count - 2 {
            return false
        }
        i += 1
        targetVal *= 2
        while i < A.count - 1 {
            if currentSum[i] == targetVal {
                break
            }
            i += 1
        }
        if i == A.count - 1 {
            return false
        }
        return true
    }
}