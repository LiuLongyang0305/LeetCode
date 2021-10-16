// https://leetcode.com/problems/minimum-operations-to-make-a-uni-value-grid/
class Solution {
    func minOperations(_ grid: [[Int]], _ x: Int) -> Int {
        let M = grid.count
        let N = grid[0].count
        guard M * N > 1 else {return 0}
        var nums = [Int]()
        for row in grid {
            for num in row {
                nums.append(num)
            }
        }
        nums.sort()
        var ans = 0
        let  target = nums[M * N / 2]
        for row in grid {
            for num in row {
                let delta = abs(num - target)
                guard delta % x == 0 else {
                    return -1
                }
                ans += delta / x
            }
        }
        return ans
    }
}