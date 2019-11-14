//https://leetcode.com/problems/escape-the-ghosts/
extension Int {
    func abs() -> Int  {
        return self  > 0 ? self : -self
    }
}
class Solution {

    func escapeGhosts(_ ghosts: [[Int]], _ target: [Int]) -> Bool {
        let targetSteps = target[0].abs() + target[1].abs()
        for ghost in ghosts {
            if (ghost[0] - target[0]).abs() + (ghost[1] - target[1]).abs() <= targetSteps {
                return false
            }
        }
        return true
    }
}