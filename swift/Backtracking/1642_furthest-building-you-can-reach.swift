// https://leetcode.com/problems/furthest-building-you-can-reach/
class Solution {
    func furthestBuilding(_ heights: [Int], _ bricks: Int, _ ladders: Int) -> Int {
        func backtracking(_ idx: Int, _ remainBricks: Int,_ remainLadders: Int)  -> Int {
            guard idx < heights.count else {
                return 0
            }
            if heights[idx] <= heights[idx - 1] {
                return 1 + backtracking(idx + 1, remainBricks, remainLadders)
            }
            let needBricks = heights[idx] - heights[idx - 1]
            var temp = Int.min
            if needBricks <= remainBricks {
                temp = max(temp, backtracking(idx + 1, remainBricks - needBricks, remainLadders))
            } else if remainLadders > 0 {
                temp = max(temp, backtracking(idx + 1, remainBricks, remainLadders - 1))
            } else {
                return 0
            }
            return 1 + temp
        }
        
        return backtracking(1, bricks, ladders)
    }
}

