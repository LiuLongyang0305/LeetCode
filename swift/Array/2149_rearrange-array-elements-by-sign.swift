//https://leetcode.com/problems/rearrange-array-elements-by-sign/
class Solution {
    func rearrangeArray(_ nums: [Int]) -> [Int] {
        var positive = [Int]()
        var negative = [Int]()
        nums.forEach { v in
            if v < 0 {
                negative.append(v)
            } else {
                positive.append(v)
            }
        }
        var ans = [Int]()
        let M = positive.count
        for i in 0..<M {
            ans += [positive[i],negative[i]]
        }
        return ans
    }
}