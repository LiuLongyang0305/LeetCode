// https://leetcode.com/problems/map-of-highest-peak/
class Solution {
    private let directions = [(0,1),(0,-1),(1,0),(-1,0)]
    func highestPeak(_ isWater: [[Int]]) -> [[Int]] {
        let M = isWater.count
        let N = isWater[0].count
        var queue = [(Int,Int)]()
        var ans = Array<Array<Int>>(repeating: Array<Int>(repeating: -1, count: N), count: M)
        for r in 0..<M {
            for c in 0..<N {
                if isWater[r][c] == 1 {
                    queue.append((r,c))
                    ans[r][c] = 0
                }
            }
        }
        var depth = 0
        while !queue.isEmpty {
            depth += 1
            var nextLevel = [(Int,Int)]()
            for (x,y) in queue {
               
                for (dx,dy) in directions {
                    let (nx,ny) = (x + dx, y + dy)
                    guard nx >= 0 && nx < M && ny >= 0 && ny < N else {
                        continue
                    }
                    guard ans[nx][ny] == -1 else {
                        continue
                    }
                    ans[nx][ny] = depth
                    nextLevel.append((nx,ny))
                }
            }
            queue = nextLevel
        }
        return ans
    }
}