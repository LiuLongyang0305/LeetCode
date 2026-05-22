    // https://leetcode.cn/problems/number-of-alternating-xor-partitions/
    class Solution {
        private let MOD = 1_000_000_007
        func alternatingXOR(_ nums: [Int], _ target1: Int, _ target2: Int) -> Int {
            let N = nums.count
            // 表示分割异或和为 s 的前缀，满足题目异或和交替的要求，且最后一段的异或和是 target1的方案数
            var endWithTarget1 = [Int:Int]()
            //表示分割异或和为 s 的前缀，满足题目异或和交替的要求，且最后一段的异或和是 target2的方案数。
            var endWithTarget2 = [Int:Int]()
            endWithTarget2[0] = 1

            var sb = 0
            var preXorSum  = 0
            for i in 0..<N {
                preXorSum = preXorSum ^ nums[i]
                let last1 = endWithTarget2[preXorSum ^ target1] ?? 0
                let last2 = endWithTarget1[preXorSum ^ target2] ?? 0
                if i == N - 1 {
                    return (last1 + last2) % MOD
                }
                endWithTarget1[preXorSum] = ((endWithTarget1[preXorSum] ?? 0) + last1) % MOD
                endWithTarget2[preXorSum] = ((endWithTarget2[preXorSum] ?? 0) + last2) % MOD
            }
            return -1
        }
    }

