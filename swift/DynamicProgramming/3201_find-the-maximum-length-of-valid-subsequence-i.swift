//https://leetcode.com/problems/find-the-maximum-length-of-valid-subsequence-i/
class Solution {
    func maximumLength(_ nums: [Int]) -> Int {

        //奇数
        var odd = 0
        //偶数
        var even = 0
        for num in nums {
            if num & 1 == 0 {
                even += 1
            } else {
                odd += 1
            }
        }
        var ans = max(odd,even)

        var cnt = 0
        var needOdd = true
        //奇数开始：奇偶
        for num in nums {
            if needOdd {
                if num & 1 == 1 {
                    cnt += 1
                    needOdd.toggle()
                }
            } else {
                if num & 1 == 0 {
                    cnt += 1
                    needOdd.toggle()
                }
            }
        }
        ans = max(ans,cnt)
        //偶数开始：偶奇

        cnt = 0
        needOdd = false

        for num in nums {
            if needOdd {
                if num & 1 == 1 {
                    cnt += 1
                    needOdd.toggle()
                }
            } else {
                if num & 1 == 0 {
                    cnt += 1
                    needOdd.toggle()
                }
            }
        }
        ans = max(ans,cnt)
        return ans
    }
}
