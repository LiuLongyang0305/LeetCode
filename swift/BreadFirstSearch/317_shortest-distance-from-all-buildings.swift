// https://leetcode.com/problems/shortest-distance-from-all-buildings/
class Solution {
    private typealias DistanceAndArriveBuilddingCount = (dis:Int,cnt:Int)
    func shortestDistance(_ grid: [[Int]]) -> Int {
        let M = grid.count
        guard M > 0 else {
            return -1
        }
        let N = grid[0].count
        guard N > 0 else {
            return -1
        }
        var infos = Array<Array<DistanceAndArriveBuilddingCount>>(repeating: Array<DistanceAndArriveBuilddingCount>(repeating: (0,0), count: N), count: M)
        
        func bfs(_ r: Int,_ c: Int) {
            var queue: [[Int]] = [[r,c]]
            var visited = Array<Array<Bool>>(repeating: Array<Bool>(repeating: false, count: N), count: M)
            visited[r][c] = true
            var depth = 0
            while !queue.isEmpty {
                var nextLevel = [[Int]]()
                depth += 1
                for pos in queue {
                    let x = pos[0]
                    let y = pos[1]
                    for (dx,dy) in [(0,1),(0,-1),(-1,0),(1,0)] {
                        let newX = x + dx
                        let newY = y + dy
                        guard newX >= 0 && newX < M && newY >= 0 && newY < N  && grid[newX][newY] == 0 && !visited[newX][newY] else {
                            continue
                        }
                        visited[newX][newY] = true
                        infos[newX][newY] = (infos[newX][newY].dis + depth,infos[newX][newY].cnt + 1)
                        nextLevel.append([newX,newY])
                    }
                }
                queue = nextLevel
            }
        }
        var builddingCnt = 0
        for r in 0..<M {
            for c in 0..<N {
                if grid[r][c] == 1 {
                    bfs(r, c)
                    builddingCnt += 1
                }
            }
        }
//        print("infos = \(infos)")
//        print("builddingCnt = \(builddingCnt)")
        var ans: DistanceAndArriveBuilddingCount? = nil
        for r in 0..<M {
            for c in 0..<N {
                if infos[r][c].cnt == builddingCnt {
                    if let a = ans {
                        if a.dis > infos[r][c].dis {
                            ans = infos[r][c]
                        }
                    } else {
                        ans = infos[r][c]
                    }
                }
            }
        }
        return ans?.dis ?? -1
    }
}