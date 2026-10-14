    //https://leetcode.cn/problems/maximum-profitable-triplets-with-increasing-prices-i/
    class Solution {
        func maxProfit(_ prices: [Int], _ profits: [Int]) -> Int {
            let N = prices.count
            var lefMax = [Int](repeating: Int.min / 10, count: N)
            var rightMax = [Int](repeating: Int.min / 10, count: N)
            for i in 0..<N {
                var j = 0
                var p = 0
                while j < i {
                    if prices[j] < prices[i] {
                        p = max(p,profits[j])
                    }
                    j += 1
                }
                if p > 0 {
                    lefMax[i] = p
                }
            }

            for i in 0..<N {
                var p = 0
                var j = i + 1
                while j < N {
                    if prices[j] > prices[i] {
                        p = max(p,profits[j])
                    }
                    j += 1
                }
                if p > 0 {
                    rightMax[i] = p
                }
            }

            var sb = Int.min / 10
            for j in stride(from: 1, to: N - 1, by: 1) {
                sb = max(sb,profits[j] + lefMax[j] + rightMax[j])
            }
            return max(-1,sb)
        }
    }
