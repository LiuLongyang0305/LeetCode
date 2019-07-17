//https://leetcode.com/problems/brick-wall/
class Solution {
    func leastBricks(_ wall: [[Int]]) -> Int {
        var ans = 0
        var notCrossCount = Dictionary<Int,Int>()
        for level in wall {
            var currentWallWidth = 0
            for i in 0..<(level.count - 1) {
                currentWallWidth += level[i]
                var temp = 1
                if let notCross = notCrossCount[currentWallWidth] {
                    temp = notCross + 1
                }
                notCrossCount[currentWallWidth] = notCross
                ans = max(notCross, ans)
            }
        }
        return wall.count - ans
    }
}

var wall = [[1,2,2,1],[3,1,2],[1,3,2],[2,4],[3,1,2],[1,3,1,1]]
Solution().leastBricks(wall)