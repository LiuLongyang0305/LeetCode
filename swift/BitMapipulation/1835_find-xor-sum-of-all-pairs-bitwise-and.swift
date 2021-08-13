// https://leetcode.com/problems/find-xor-sum-of-all-pairs-bitwise-and/
class Solution {
    func getXORSum(_ arr1: [Int], _ arr2: [Int]) -> Int {
        var ans = 0
        for i in 0...30 {
            var cnt1 = 0
            for num in arr1 {
                if num & (1 << i) != 0 {
                    cnt1 += 1
                }
            }
            var cnt2 = 0
            for num in arr2 {
                if num & (1 << i) != 0 {
                    cnt2 += 1
                }
            }
            if cnt1 % 2 == 1 && cnt2 % 2 == 1 {
                ans |= (1 << i)
            }
        }
        return ans
    }
}