//https://leetcode.com/problems/single-number-iii/
class Solution {
    func singleNumber(_ nums: [Int]) -> [Int] {
        var ans = [0,0]
        var temp = 0
        for ele in nums {
            temp ^= ele
        }
        var  flag  = 1
        while flag & temp ==  0 {
            flag <<= 1
        }
        for ele in nums {
            if ele & flag == 0 {
                ans[0] ^= ele
            } else  {
                ans[1] ^= ele
            }
        }
        return ans
    }
}