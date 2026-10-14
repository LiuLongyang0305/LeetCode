// https://leetcode.cn/problems/maximum-product-pair-with-target-sum/
class Solution {
    func maxProductPair(_ nums: [Int], _ target: Int) -> [Int] {
        let M = nums.count
        var maxP = Int.min
        var first = -1,second = -1
        for i in 0..<(M - 1) {
            for j in (i + 1)..<M {
                guard nums[i] != nums[j] else {continue}
                if nums[i] + nums[j] == target {
                    let p = nums[i] * nums[j]
                    guard p > maxP else {continue}
                    if p > maxP {
                        first = i
                        second = j
                        maxP = p
                    }
                    if nums[i] < nums[j] {
                        swap(&first, &second)
                    }
                }
            }
        }
        return [first,second]
    }
}

