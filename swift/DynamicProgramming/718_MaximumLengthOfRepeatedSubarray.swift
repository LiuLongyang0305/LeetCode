//https://leetcode.com/problems/maximum-length-of-repeated-subarray/
class Solution {
    func findLength(_ A: [Int], _ B: [Int]) -> Int {
        var ans = 0
        let ASize = A.count
        let BSize = B.count
        var maxCls = Array<Array<Int>>(repeating: Array<Int>(repeating: 0, count: BSize), count: ASize)
        for j in 0..<ASize {
            if A[j] == B[0] {
                maxCls[j][0] = 1
                ans = 1
            } else {
                maxCls[j][0] = 0
            }
        }
        for j in 0..<BSize {
            if B[j] == A[0] {
                maxCls[0][j] = 1
                ans = 1
            } else {
                maxCls[0][j] = 0
            }
        }
        for i in 1..<ASize {
            for j in 1..<BSize {
                if A[i] == B[j] {
                    maxCls[i][j] = maxCls[i - 1][j - 1] + 1
                    if maxCls[i][j] > ans {
                        ans = maxCls[i][j]
                    }
                }
            }
        }
        return ans
    }
}

var A = [1,2,3,2,1]
var B = [3,2,1,4,7]
Solution().findLength(A, B)