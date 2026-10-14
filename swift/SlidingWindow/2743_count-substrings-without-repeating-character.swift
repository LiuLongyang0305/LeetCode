    //https://leetcode.cn/problems/count-substrings-without-repeating-character/
    class Solution {
        func numberOfSpecialSubstrings(_ s: String) -> Int {
            let nums = s.map {Int($0.asciiValue!) - 97}
            let M = nums.count

            var curMask = 0
            var j = 0
            var cnt = 0
            for i in 0..<M {
                while j < M && (curMask & (1 << nums[j]) == 0) {
                    curMask = curMask | (1 << nums[j])
                    j += 1
                }
                cnt += j - i
                curMask = curMask & (~(1 << nums[i]))
            }
            return cnt
        }
    }
