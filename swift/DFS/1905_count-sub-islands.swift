// https://leetcode.com/problems/count-sub-islands/
class Solution {
    private typealias Direction = (dr:Int ,dc: Int)
    private let directions: [Direction] = [(-1,0),(1,0),(0,-1),(0,1)]
    func countSubIslands(_ grid1: [[Int]], _ grid2: [[Int]]) -> Int {
        
        let R = grid1.count
        let C = grid1[0].count
        
        var islandId = 2
        var grid1Copy = grid1
        
        func dfs1(_ r: Int, _ c: Int) {
            grid1Copy[r][c] = islandId
            for (dr,dc) in directions {
                let newR = r + dr
                guard newR >= 0 && newR < R else {
                    continue
                }
                let newC = c + dc
                guard newC >= 0 && newC < C else {
                    continue
                }
                guard grid1Copy[newR][newC] == 1 else {
                    continue
                }
                dfs1(newR, newC)
            }
        }
        
        for r in 0..<R {
            for c in 0..<C {
                if grid1Copy[r][c] == 1 {
                    islandId += 1
                    dfs1(r, c)
                }
            }
        }
        
        // print(grid1Copy)
        
        var grid2Visited = Array<Array<Bool>>(repeating: Array<Bool>(repeating: false, count: C), count: R)
        
        func dfs2(_ r: Int, _ c: Int, _ positions: inout [Int])  {
            grid2Visited[r][c] = true
            positions.append(r << 16 | c)
            for (dr,dc) in directions {
                let newR = r + dr
                guard newR >= 0 && newR < R else {
                    continue
                }
                let newC = c + dc
                guard newC >= 0 && newC < C else {
                    continue
                }
                guard grid2[newR][newC] == 1 && !grid2Visited[newR][newC] else {
                    continue
                }
                dfs2(newR, newC, &positions)
            }
        }
        
        func check(_ positions: [Int]) -> Bool {
            let target = grid1Copy[positions[0] >> 16][positions[0] & 0xffff]
            guard target >= 2 else {
                return false
            }
            for position in positions {
                let r = position >> 16
                let c = position & 0xffff
                guard grid1Copy[r][c] == target else {
                    return false
                }
                
            }
            return true
        }
        var ans = 0
        for r in 0..<R {
            for c in 0..<C {
                if grid2[r][c] == 1 && !grid2Visited[r][c] {
                    var islandsPositions = Array<Int>()
                    dfs2(r, c, &islandsPositions)
                    if check(islandsPositions) {
                        ans += 1
                    }
                }
            }
        }
        return ans
    }
}