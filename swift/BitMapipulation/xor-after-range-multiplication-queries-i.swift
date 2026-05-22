    // https://leetcode.cn/problems/xor-after-range-multiplication-queries-i/
    class Solution {
        private  let   MOD = 1_000_000_007
        func xorAfterQueries(_ nums: [Int], _ queries: [[Int]]) -> Int {
            var numsCopy = nums
            let N = numsCopy.count
            for q in queries {

                for idx in stride(from: q[0], through: q[1], by: q[2]) {
                    var num = numsCopy[idx]
                    num *= q[3]
                    num %= MOD
                    numsCopy[idx] = num
                }
            }
            return numsCopy.reduce(0) { $0 ^ $1}
        }
    }
