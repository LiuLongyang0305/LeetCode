// https://leetcode.com/problems/max-number-of-k-sum-pairs/
class Solution {
    func maxOperations(_ nums: [Int], _ k: Int) -> Int {
        var cnt = 0
        var counter = [Int:Int]()
        for num in nums {
            if let c = counter[k - num], c >= 1 {
                cnt += 1
                if c == 1 {
                    counter.removeValue(forKey: k - num)
                } else {
                    counter.updateValue(c - 1, forKey: k - num)
                }
            } else {
                counter[num,default: 0] += 1
            }
        }
        return cnt
    }
}