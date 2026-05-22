//https://leetcode.cn/problems/count-dominant-indices/
class Solution {
    func dominantIndices(_ nums: [Int]) -> Int {
        var sb = 0
        var cnt = nums.count
        var sum = nums.reduce(0) {$0 + $1}
        for num in nums {
            sum -= num
            cnt -= 1
            if cnt > 0 {
                if 10 * num > (sum * 10) / cnt {
                    sb += 1
                }
            }
        }
        return sb
    }
}
