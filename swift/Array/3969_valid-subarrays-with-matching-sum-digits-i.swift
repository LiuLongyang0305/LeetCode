// https://leetcode.cn/problems/valid-subarrays-with-matching-sum-digits-i/
    class Solution {
        func countValidSubarrays(_ nums: [Int], _ x: Int) -> Int {
            let N = nums.count
            var sb = 0
            for left in 0..<N {
                var s = 0
                for right in left..<N {
                    s += nums[right]
                    if check(num: s, x) {
                        sb += 1
                    }
                }
            }
            return sb
        }

        private func check(num sum: Int, _ x: Int) -> Bool {
            guard x == sum % 10 else {return false}
            var t = sum
            while t > 10000 {
                t /= 10000
            }
            while t > 100  {
                t /= 100
            }

            while t >= 10 {
                t  /= 10
            }

            // print("\(sum)  t = \(t) x = \(x)")
            return t == x
        }
    }
