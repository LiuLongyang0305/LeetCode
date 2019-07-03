//https://leetcode.com/problems/arithmetic-slices/
class Solution {
    func numberOfArithmeticSlices(_ A: [Int]) -> Int {
        guard A.count > 2 else {
            return 0
        }
        
        var ans = 0
        let size = A.count
        var dp = Array<Array<Bool>>(repeating: Array<Bool>(repeating: false, count: size), count: size)
        for i in 1..<size - 1 {
            if 2 * A[i] == A[i - 1] + A[i + 1] {
                dp[i - 1][i + 1] = true
                ans += 1
            }
        }
        guard A.count > 3 else {
            return ans
        }
        for subsequenceLength in 4...size{
            for p in 0...(size - subsequenceLength) {
                let endIndex = p + subsequenceLength - 1
                if 2 * A[endIndex - 1] == A[endIndex] + A[endIndex - 2] && dp[p][endIndex - 1] {
                    dp[p][endIndex] = true
                    ans += 1
                }
            }
        }
        return ans
    }
}

var arr = [1,2,3,4]
Solution().numberOfArithmeticSlices(arr)