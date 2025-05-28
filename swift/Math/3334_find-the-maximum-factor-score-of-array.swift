//https://leetcode.com/problems/find-the-maximum-factor-score-of-array/

class Solution {
    func maxScore(_ nums: [Int]) -> Int {
        if nums.count == 1 {
            return nums[0] * nums[0]
        }

        var gcdCur = 0
        var lcmCur = 1
        for num in nums {
            gcdCur = gcd(gcdCur, num)
            lcmCur = lcm(lcmCur,num)
        }
        var ans = gcdCur * lcmCur

        for i in 0..<nums.count {

            ans  = max(ans,cal(nums, i))
        }



        return ans
    }

    func cal(_ nums: [Int], _ excludeIdx: Int) -> Int {
        var gcdCur = 0
        var lcmCur = 1
        for i in 0..<nums.count {

            if i != excludeIdx {
                gcdCur = gcd(gcdCur, nums[i])
                lcmCur = lcm(lcmCur,nums[i])
            }
        }
        return gcdCur * lcmCur
    }
    func gcd(_ a: Int, _ b: Int) -> Int {
        return b == 0 ? a : gcd(b, a % b)
    }
    func lcm(_ a: Int, _ b: Int) -> Int {
        return a / gcd(a, b) * b
    }
}

