// https://leetcode.com/problems/arithmetic-slices-ii-subsequence/
class Solution {
    func numberOfArithmeticSlices(_ nums: [Int]) -> Int {
        var ans = 0
        let N = nums.count
        var map = Array<[Int:Int]>(repeating: [:], count: N)
        for i in 0..<N {
            var curMap = [Int:Int]()
            var j = 0
            while j < i {
                let diff = nums[i] - nums[j]
                let c1 = curMap[diff] ?? 0
                let c2 = map[j][diff] ?? 0
                ans += c2
                curMap[diff] = c1 + c2 + 1
                j += 1
            }
            map[i] = curMap
        }
        return ans
    }
}