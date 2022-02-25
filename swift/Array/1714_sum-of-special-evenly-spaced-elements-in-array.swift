//https://leetcode.com/problems/sum-of-special-evenly-spaced-elements-in-array/
class Solution {
    
    
    private let MOD = 1_000_000_007
    func solve(_ nums: [Int], _ queries: [[Int]]) -> [Int] {
        
        let N = nums.count
        let sqrtN = Int(sqrt(Double(N)))
        var sufSum = [[Int]](repeating: [Int](repeating: 0, count: N + 1), count: sqrtN + 1)
        var delta = 1
        while delta < sqrtN + 1{
            var start = N - 1
            while start > N - 1 - delta {
                sufSum[delta][start] = nums[start] % MOD
                start -= 1
            }
            start = N - 1 - delta
            while start > -1 {
                sufSum[delta][start] = (sufSum[delta][start + delta] + nums[start]) % MOD
                start -= 1
            }
            delta += 1
        }
        var ans = [Int]()
        for query in  queries {
            let start = query[0]
            let delta = query[1]
            if delta <= sqrtN {
                ans.append(sufSum[delta][start])
            } else {
                var t = 0
                var idx = start
                while idx < N {
                    t = (t + nums[idx]) % MOD
                    idx += delta
                }
                ans.append(t)
            }
        }
        return ans
    }
}