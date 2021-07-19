// https://leetcode.com/problems/add-minimum-number-of-rungs/
class Solution {
    func addRungs(_ rungs: [Int], _ dist: Int) -> Int {
        var ans = 0
        var last = 0
        for i in 0..<rungs.count {
            let delta = rungs[i] - last - 1
            if delta >= dist {
                ans += delta / dist
            }
            last = rungs[i]
        }
        return ans
    }
}