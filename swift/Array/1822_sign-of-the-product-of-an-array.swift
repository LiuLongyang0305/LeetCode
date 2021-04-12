// https://leetcode.com/problems/sign-of-the-product-of-an-array/
class Solution {
    func arraySign(_ nums: [Int]) -> Int {
        var sign = 1
        for num in nums {
            guard num  != 0 else {
                return 0
            }
            if num < 0 {
                sign = -sign
            }
        }
        return sign
    }
}