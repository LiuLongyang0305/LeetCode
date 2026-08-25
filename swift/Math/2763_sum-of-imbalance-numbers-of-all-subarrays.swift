    // https://leetcode.cn/problems/sum-of-imbalance-numbers-of-all-subarrays/
    class Solution {
        func sumImbalanceNumbers(_ nums: [Int]) -> Int {
            var ans = 0
            let N = nums.count
            for i in 0..<N {
                var visited = [Bool](repeating: false, count: N + 2)
                visited[nums[i]] = true
                var cnt = 0
                for j in stride(from: i + 1, to: N, by: 1) {
                    var  x = nums[j]
                    if !visited[x] {
                        cnt += 1
                        if visited[x - 1] {
                            cnt -= 1
                        }
                        if visited[x + 1] {
                            cnt -= 1
                        }
                        visited[x] = true
                    }
                    ans += cnt
                }
            }
            return ans
        }
    }
