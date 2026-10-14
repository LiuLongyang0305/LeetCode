    // https://leetcode.cn/problems/maximum-transactions-without-negative-balance/
    class Solution {
        func maxTransactions(_ transactions: [Int]) -> Int {
            var heap = Heap<Int>()
            var ans = transactions.count
            var sum = 0
            for v in transactions {
                if v < 0 {
                    heap.insert(-v)
                }
                sum += v
                if sum < 0 {
                    sum += (heap.popMax() ?? 0)
                    ans -= 1
                }
            }
            return ans
        }
    }
