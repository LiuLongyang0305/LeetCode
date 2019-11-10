//https://leetcode.com/problems/reconstruct-a-2-row-binary-matrix/
class Solution {
    func reconstructMatrix(_ upper: Int, _ lower: Int, _ colsum: [Int]) -> [[Int]] {

        var indices = [Int]()
        var onesCount = 0
        var  ans = Array<Array<Int>>(repeating: Array<Int>(repeating: 0, count: colsum.count), count: 2)
        for i in 0..<colsum.count {
            if colsum[i] == 2 {
                ans[1][i] = 1
                ans[0][i] = 1
                onesCount += 1
            } else if colsum[i] == 1 {
                indices.append(i)
            }
        }
        let upperRemain = upper - onesCount
        let lowerRemain = lower - onesCount
        guard upperRemain >= 0 && lowerRemain >= 0 && upperRemain + lowerRemain == indices.count else {
            return []
        }
        let currentUpperSum = upper - onesCount
        var j = 0
        while j < currentUpperSum {
            ans[0][indices[j]] = 1
            j += 1
        }
        while j < indices.count {
            ans[1][indices[j]] = 1
            j += 1
        }
        return ans
    }
}