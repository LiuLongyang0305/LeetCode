//https://leetcode.com/problems/bitwise-or-of-even-numbers-in-an-array/
class Solution {
    func evenNumberBitwiseORs(_ nums: [Int]) -> Int {
        var sb =  0
        for num in nums {
            if num & 1 == 0 {
                sb = sb | num
            }
        }
        return sb
    }
}
