//https://leetcode.com/problems/projection-area-of-3d-shapes/
class Solution {
    func projectionArea(_ grid: [[Int]]) -> Int {
        let size = grid.count
        var frontView = Array<Int>(repeating: 0, count: size)
        var sideView = Array<Int>(repeating: 0, count: size)
        var ans = 0
        for i in 0..<size {
            for j in 0..<size {
                let temp = grid[i][j]
                if temp != 0 {
                    ans += 1
                    if sideView[i] < temp{
                        ans = ans - sideView[i] + temp
                        sideView[i] = temp
                    }
                    if frontView[j] < temp {
                        ans = ans - frontView[j] + temp
                        frontView[j] = temp
                    }
                }
            }
        }
        return ans
    }
}