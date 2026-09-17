    //https://leetcode.cn/problems/maximize-subarray-gcd-score/
    class Solution {
        func maxGCDScore(_ nums: [Int], _ k: Int) -> Int {
            let M = nums.count
            var twoCnt = [Int](repeating: 0, count: M)
            for i in 0..<M {
                var t = nums[i]
                while t % 2 == 0 {
                    t /= 2
                    twoCnt[i] += 1
                }
            }
            var counter = [Int](repeating: 0, count: 31)
            var preffix = [[Int]](repeating: [], count: M + 1)
            preffix[0] = counter
            for i in 0..<M {
                counter[twoCnt[i]] += 1
                preffix[i + 1] = counter
            }


            func canDoubleGcd(_ l:Int, _ r: Int) -> Bool {
                let (c1,c2) = (preffix[l],preffix[r + 1])
                for i in 0..<31 {
                    let delta = c2[i] - c1[i]
                    if delta > 0 {
                        return delta <= k
                    }
                }
                return false
            }


            let gcdVal = subarrayGCDMatrix(nums)
            var sb = nums.max()!

            for l in 0..<M {
                for r in stride(from: l, to: M, by: 1) {
                    let gv = gcdVal[l][r] * (canDoubleGcd(l, r) ? 2 : 1)
                    sb = max(sb,gv * (r - l + 1))
                }
            }

            return sb
        }
        private func _gcd(_ a: Int, _ b: Int) -> Int {
            return 0 == b ? a : _gcd(b, a % b)
        }

        private func subarrayGCDMatrix(_ nums: [Int]) -> [[Int]] {
            let n = nums.count
            guard n > 0 else { return [] }

            // 初始化 n x n 的二维数组，默认值为 0
            var dp = Array(repeating: Array(repeating: 0, count: n), count: n)
            // 枚举左端点 L
            for l in 0..<n {
                // 子数组长度为 1 时
                dp[l][l] = nums[l]

                // 枚举右端点 R，向右扩展
                for r in (l + 1)..<n {
                    // 状态转移：利用前一个子数组 [l, r-1] 的结果
                    dp[l][r] = _gcd(dp[l][r - 1], nums[r])
                }
            }

            return dp
        }
    }
