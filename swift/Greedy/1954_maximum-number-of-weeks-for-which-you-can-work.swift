//https://leetcode.com/problems/maximum-number-of-weeks-for-which-you-can-work/
class Solution {
    func numberOfWeeks(_ milestones: [Int]) -> Int {
        let total = milestones.reduce(0) { $0 + $1}
        let maxMilesstone = milestones.max()!
        let res = total - maxMilesstone
        return min(res * 2 + 1, total)
    }
}