 //https://leetcode.cn/problems/maximum-product-of-three-elements-after-one-replacement/
    class Solution {
        func maxProduct(_ nums: [Int]) -> Int {
            var firstMaxAbs = nums[0]
            var secondMaxAbs = nums[1]
            if abs(nums[0]) < abs(nums[1]) {
                (firstMaxAbs,secondMaxAbs) = (nums[1],nums[0])
            }
            // print("\(firstMaxAbs)  \(secondMaxAbs)")
            for num in nums.dropFirst(2) {
                let curAbs = abs(num)
                guard curAbs > abs(secondMaxAbs) else {continue}
                if curAbs >= abs(firstMaxAbs) {
                    (firstMaxAbs,secondMaxAbs) = (num,firstMaxAbs)
                } else {
                    secondMaxAbs = num
                }
            }
            // print("\(firstMaxAbs)  \(secondMaxAbs)")

            return abs(firstMaxAbs * secondMaxAbs * 100000)
        }
    }
