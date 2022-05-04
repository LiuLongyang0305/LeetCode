// https://leetcode.com/problems/count-unguarded-cells-in-the-grid/
class Solution {

    private typealias Direction = (dx:Int,dy:Int)
    private let directions:[Direction] = [(0,1),(0,-1),(-1,0),(1,0)]
    private typealias Position = (x:Int,y:Int)

    func countUnguarded(_ m: Int, _ n: Int, _ guards: [[Int]], _ walls: [[Int]]) -> Int {


        let oriQueue:[Position] = guards.map { ($0[0],$0[1])}
        var visited = [[Int]](repeating: [Int](repeating: 0, count: n), count: m)
        let allVisited = (1 << 4) - 1
        for g in guards {
            visited[g[0]][g[1]] = allVisited
        }
        for wall in walls {
            visited[wall[0]][wall[1]] = allVisited
        }



        func BFS(_ dirIdx:Int) {
            var queue = oriQueue
            while !queue.isEmpty {
                var newQueue = [Position]()
                for (x,y) in queue  {
                    let nx = x + directions[dirIdx].dx
                    let ny = y + directions[dirIdx].dy
                    guard nx >= 0 && nx < m && ny >= 0 && ny < n && visited[nx][ny] & (1 << dirIdx) == 0 else {continue}
                    visited[nx][ny] |= (1 << dirIdx)
                    newQueue.append((nx,ny))

                }
                queue = newQueue
            }

        }


        for i in 0..<4 {
            BFS(i)
        }

        var ans = 0
        for i in 0..<m {
            for j in 0..<n {
                if visited[i][j] == 0 {
                    ans += 1
                }
            }
        }
        
        return ans
    }
}