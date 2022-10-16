// https://leetcode.com/problems/count-number-of-distinct-integers-after-reverse-operations/
class Solution {
    func countDistinctIntegers(_ nums: [Int]) -> Int {
        let newNumbers = nums.map { revers($0)}
        return Set<Int>(nums).union(Set<Int>(newNumbers)).count
    }

    private func revers(_ num: Int) -> Int {
        var ans = 0
        var t = num
        while t > 0 {
            ans = 10 * ans + (t % 10)
            t /= 10
        }
        return ans
    }
}