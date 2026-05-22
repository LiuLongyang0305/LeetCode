//https://leetcode.com/problems/count-islands-with-total-value-divisible-by-k/
class Solution {
    private typealias Position = (x:Int,y: Int)
    func countIslands(_ grid: [[Int]], _ k: Int) -> Int {
        let M = grid.count
        let N = grid[0].count
        var visited = [[Bool]](repeating: [Bool](repeating: false, count: N), count: M)
        
        
        func cal(_ i: Int, _ j: Int) -> Bool {
            var sum = 0
            visited[i][j] = true
            var queue = [Position]()
            queue.append((i,j))
            while !queue.isEmpty {
                var newQueue = [Position]()
                for (x,y) in queue {
                    sum += grid[x][y]
                    for (dx,dy) in [(0,1),(0,-1),(1,0),(-1,0)] {
                        let nx = x + dx
                        let ny = y + dy
                        guard nx >= 0 && nx < M && ny >= 0 && ny < N else {continue}
                        if grid[nx][ny] > 0 && !visited[nx][ny] {
                            newQueue.append((nx,ny))
                            visited[nx][ny] = true
                        }
                        
                    }
                }
                queue = newQueue
            }
            return sum % k == 0
        }
        
        
        var ans = 0
        for i in 0..<M {
            for j in 0..<N {
                if grid[i][j] > 0 && !visited[i][j] {
                    if cal(i, j) {
                        ans += 1
                    }
                }
            }
        }
        return ans
    }
}
