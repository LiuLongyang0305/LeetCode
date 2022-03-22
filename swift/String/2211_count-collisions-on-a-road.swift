// https://leetcode.com/problems/count-collisions-on-a-road/
class Solution {
    func countCollisions(_ directions: String) -> Int {
        var dirs = directions
        while let f = dirs.first, f == "L" {
            dirs.removeFirst()
        }
        while let r = dirs.last, r == "R" {
            dirs.removeLast()
        }
        return dirs.count - dirs.reduce(0, { $0 + ($1 == "S" ? 1 : 0)})
    }
}