//https://leetcode.cn/problems/minimum-number-of-operations-to-make-array-xor-equal-to-k/
class Solution {
    func minOperations(_ nums: [Int], _ k: Int) -> Int {
        var counterOnes = Array<Int>(repeating: 0, count: 20)
        for num in nums {
            for bit in 0..<20 {
                if num & (1 << bit) != 0{
                    counterOnes[bit] += 1
                } 
            }
        }
        var ans = 0
        for bit in 0..<20 {
            //需要是1，奇数个1
            if k & (1 << bit) > 0 {
                if counterOnes[bit] & 1 == 0 {
                    ans += 1
                }
            } else {
                //需要是0，偶数个1
                if counterOnes[bit] & 1 != 0 {
                    ans += 1
                }
            }
        }



        return ans
    }
}
