// https://leetcode.com/problems/number-of-submatrices-that-sum-to-target/
class Solution {
    
    func numSubmatrixSumTarget(_ matrix: [[Int]], _ target: Int) -> Int {
        
        let M = matrix.count
        let N = matrix[0].count
        var prefixSum = matrix
        for i in 0..<M {
            for j in 1..<N {
                prefixSum[i][j] += prefixSum[i][j - 1]
            }
        }
        var ans = 0
        for c1 in 0..<N {
            for c2 in c1..<N {
                var map:[Int:Int] = [0:1]
                var cur = 0
                for r in 0..<M {
                    cur += prefixSum[r][c2] - (c1 > 0 ? prefixSum[r][c1 - 1] : 0)
                    ans += map[cur - target] ?? 0
                    map.updateValue((map[cur] ?? 0 ) + 1, forKey: cur)
                    
                }
            }
        }
        return ans
    }
}