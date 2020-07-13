// https://leetcode.com/problems/number-of-good-pairs/
class Solution {
    func numIdenticalPairs(_ nums: [Int]) -> Int {
        var ans = 0
        var counter = [Int:Int]()
        for num in nums {
            if let c = counter[num] {
                ans += c
            }
            counter[num,default: 0 ] += 1
        }
        return ans
    }
}