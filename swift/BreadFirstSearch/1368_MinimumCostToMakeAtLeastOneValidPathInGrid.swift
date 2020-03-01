//https://leetcode.com/problems/minimum-cost-to-make-at-least-one-valid-path-in-a-grid/
class Solution1 {
    private typealias Direction = (dx:Int,dy:Int)
    private let inf = 1_000_000_000
    private let directions: [Direction] = [(0,1),(0,-1),(1,0),(-1,0)]
    func minCost(_ grid: [[Int]]) -> Int {
        
        let M = grid.count
        let N = grid[0].count
        
        var cost = 0
        
        var dp = Array<Array<Int>>(repeating: Array<Int>(repeating: inf, count: N), count: M)
        var queue = Array<[Int]>()
        func valid(_ x: Int,_ y: Int) -> Bool {
            return x < M && x >= 0 && y >= 0 && y < N
        }
        
        func dfs(_ r: Int, _ c: Int, _ cost: Int) {
            
            guard valid(r, c) && dp[r][c] == inf else {
                return
            }
            dp[r][c] = cost
            queue.append([r,c])
            let nextDir = grid[r][c] - 1
            dfs(r + directions[nextDir].dx ,c + directions[nextDir].dy, cost)
        }
        
        dfs(0, 0, 0)
        while !queue.isEmpty {
            cost += 1
            let length = queue.count
            for _ in 0..<length {
                let cur = queue.removeFirst()
                let r = cur[0]
                let c = cur[1]
                for i in 0..<4 {
                    dfs(r + directions[i].dx, c + directions[i].dy, cost)
                }
            }
        }
        return dp[M - 1][N - 1]
    }
 }
 
 class Solution {
    private typealias Direction = (dx:Int,dy:Int)
    private let inf = 1_000_000_000
    private let directions: [Direction] = [(0,1),(0,-1),(1,0),(-1,0)]
    
    func minCost(_ grid: [[Int]]) -> Int {
        
        let M = grid.count
        let N = grid[0].count
        
        var cost = 0
        
        var visited = [[Int]:Int]()
        var queue = Array<[Int]>()
        func valid(_ x: Int,_ y: Int) -> Bool {
            return x < M && x >= 0 && y >= 0 && y < N
        }
        
        func dfs(_ r: Int, _ c: Int, _ cost: Int) {
            
            guard valid(r, c) && nil == visited[[r,c]] else {
                return
            }
            visited[[r,c]] = cost
            queue.append([r,c])
            let nextDir = grid[r][c] - 1
            dfs(r + directions[nextDir].dx ,c + directions[nextDir].dy, cost)
        }
        
        dfs(0, 0, 0)
        while !queue.isEmpty {
            cost += 1
            let length = queue.count
            for _ in 0..<length {
                let cur = queue.removeFirst()
                let r = cur[0]
                let c = cur[1]
                for i in 0..<4 {
                    dfs(r + directions[i].dx, c + directions[i].dy, cost)
                }
            }
        }
        
        return visited[[M - 1, N - 1]]!
    }
 }
 
 Solution().minCost([[1,1,3],[3,2,2],[1,1,4]])
