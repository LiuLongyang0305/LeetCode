// https://leetcode.com/problems/making-a-large-island/
 class Solution {
    private let dx = [0,0,1,-1]
    private let dy = [1,-1,0,0]
    func largestIsland(_ grid: [[Int]]) -> Int {
        
        let M = grid.count
        let N = grid[0].count
        
        var visited = Array<Array<Bool>>(repeating: Array<Bool>(repeating: false, count: N), count: M)
        var islands = [Int:Int]()
        var belongTo = Array<Array<Int>>(repeating: Array<Int>(repeating: -1, count: N), count: M)
        
        func valid(_ x: Int, _ y: Int) -> Bool {
            return x >= 0 && x < M && y >= 0 && y < N
        }
        func dfs(position: Int, head: Int) {
            for index in 0..<4 {
                let nextX = position >> 8 + dx[index]
                let nextY = position & 0xff + dy[index]
                if valid(nextX, nextY) {
                    if grid[nextX][nextY] == 1 && !visited[nextX][nextY] {
                        let nextP = nextX << 8 | nextY
                        visited[nextX][nextY] = true
                        islands.updateValue(islands[head]! + 1, forKey: head)
                        belongTo[nextX][nextY] = head
                        dfs(position: nextP, head: head)
                    }
                }
            }
        }
        
        for r in 0..<M {
            for c in 0..<N where grid[r][c] == 1 && !visited[r][c]{
                let head = r << 8 | c
                islands.updateValue(1, forKey: head)
                visited[r][c] = true
                belongTo[r][c] = head
                dfs(position: head, head: head)
            }
        }
        guard islands.count > 1 else {
            return islands.isEmpty ? 1 : min(M * N, islands.values.max()! + 1)
        }
        print(islands)
        var ans = Int.min
        for r in 0..<M {
            for c in 0..<N where grid[r][c] == 0 {
                var heads = Set<Int>()
                for index in 0..<4 {
                    let nextX = r + dx[index]
                    let nextY = c + dy[index]
                    if valid(nextX, nextY) && grid[nextX][nextY] == 1 {
                        heads.insert(belongTo[nextX][nextY])
                    }
                    ans = max(ans,heads.reduce(0) {$0 + islands[$1]!} + 1)
                }
            }
        }
        return ans
    }
 }