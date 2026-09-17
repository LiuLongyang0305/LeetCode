//https://leetcode.cn/problems/maximum-valid-split-positions-i/
    class Solution {
        func maxValidSplits(_ nums: [Int]) -> Int {
            var sb = _solve(nums)
            sb = max(sb, _solve([Int](nums.dropFirst())))
            var pre = nums[0]
            for i in 1..<nums.count {
                let cur = _gcd(pre, nums[i])
                if cur != pre {
                    sb = max(sb,_solve([Int](nums[0..<i] + nums[(i + 1)...])))
                }
                pre = cur
            }
            return sb
        }

        private func _solve(_ arr: [Int]) -> Int {
            let M = arr.count
            var suf = arr
            for j in stride(from: M - 2, through: 0, by: -1) {
                suf[j] = _gcd(suf[j + 1],suf[j])
            }
            var pre = 0
            var cnt = 0
            for i in 0..<M {
                pre = _gcd(pre,arr[i])
                if i + 1 < M {
                    if pre == suf[i + 1] {
                        cnt += 1
                    }
                }
            }
            return cnt
        }
        private func _gcd(_ a: Int, _ b: Int) -> Int {
            return 0 == b ? a : _gcd(b, a % b)
        }
    }
