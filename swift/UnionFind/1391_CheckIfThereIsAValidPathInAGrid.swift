// https://leetcode.com/problems/check-if-there-is-a-valid-path-in-a-grid/
class Solution_DFS {
    // up  down  left right
    private let currentCellPossibleValues: [Set<Int>] = [[2,5,6],[2,4,3],[1,5,3],[1,6,4]]
    private let nextCellPossibleValues: [Set<Int>] = [[2,3,4],[2,5,6],[1,6,4],[1,3,5]]
    private typealias Direction = (dx:Int,dy:Int)
    private let directions: [Direction] = [(-1,0),(1,0),(0,-1),(0,1)]
    
    func hasValidPath(_ grid: [[Int]]) -> Bool {
        let M = grid.count
        let N = grid[0].count
        
        var visited = Array<Array<Bool>>(repeating: Array<Bool>(repeating: false, count: N), count: M)
        
        func getNextPositions(_ curretPosition: Int) -> [Int] {
            var ans = [Int]()
            let r = curretPosition >> 16
            let c = curretPosition & 0xffff
            for i in 0...3 {
                let nextX = r + directions[i].dx
                let nextY = c + directions[i].dy
                if nextX >= 0 && nextX < M && nextY >= 0 && nextY < N {
                    if currentCellPossibleValues[i].contains(grid[r][c]) && nextCellPossibleValues[i].contains(grid[nextX][nextY]) && !visited[nextX][nextY] {
                        visited[nextX][nextY] = true
                        ans.append(nextX << 16 | nextY)
                    }
                }
            }
            return ans
        }
        
        let target = (M - 1) << 16 | (N - 1)
        var canReach = false
        
        func dfs(_ root: Int) {
            guard !canReach else {
                return
            }
            guard root != target else {
                canReach = true
                return
            }
            let nextPositions = getNextPositions(root)
            for p in nextPositions {
                dfs(p)
            }
        }
        
        visited[0][0] = true
        dfs(0)
        
        return canReach
    }
}

class Solution_UF {
    private class UnionFind {
        var parent = [Int: Int]()
        func find(_ node: Int) -> Int {
            guard nil != parent[node] else {
                parent[node] = node
                return node
            }
            var currentParent = node
            while currentParent != parent[currentParent]! {
                currentParent = parent[currentParent]!
            }
            return currentParent
        }
        
        func join(_ node1: Int, _ node2: Int)  {
            
            let first = find(node1)
            let second = find(node2)
            guard first != second else {
                return
            }
            parent[second] = first
        }
    }
    
    // up  down  left right
    private let currentCellPossibleValues: [Set<Int>] = [[2,5,6],[2,4,3],[1,5,3],[1,6,4]]
    private let nextCellPossibleValues: [Set<Int>] = [[2,3,4],[2,5,6],[1,6,4],[1,3,5]]
    private typealias Direction = (dx:Int,dy:Int)
    private let directions: [Direction] = [(-1,0),(1,0),(0,-1),(0,1)]
    
    func hasValidPath(_ grid: [[Int]]) -> Bool {
        let M = grid.count
        let N = grid[0].count
        let uf = UnionFind()
        for r in 0..<M {
            for c in 0..<N {
                let p = r << 16 | c
                for i in 0...3 {
                    let nextX = r + directions[i].dx
                    let nextY = c + directions[i].dy
                    if nextX >= 0 && nextX < M && nextY >= 0 && nextY < N {
                        if currentCellPossibleValues[i].contains(grid[r][c]) && nextCellPossibleValues[i].contains(grid[nextX][nextY]) {
                            uf.join(p, nextX << 16 | nextY)
                        }
                    }
                }
            }
        }
        return uf.find(0) == uf.find((M - 1) << 16 | (N - 1))
    }
}

class Solution_BFS {
    // up  down  left right
    private let currentCellPossibleValues: [Set<Int>] = [[2,5,6],[2,4,3],[1,5,3],[1,6,4]]
    private let nextCellPossibleValues: [Set<Int>] = [[2,3,4],[2,5,6],[1,6,4],[1,3,5]]
    private typealias Direction = (dx:Int,dy:Int)
    private let directions: [Direction] = [(-1,0),(1,0),(0,-1),(0,1)]
    
    func hasValidPath(_ grid: [[Int]]) -> Bool {
        let M = grid.count
        let N = grid[0].count
        guard M * N > 1 else {
            return true
        }
        
        func getNextPositions(_ curretPosition: Int) -> [Int] {
            var ans = [Int]()
            let r = curretPosition >> 16
            let c = curretPosition & 0xffff
            for i in 0...3 {
                let nextX = r + directions[i].dx
                let nextY = c + directions[i].dy
                if nextX >= 0 && nextX < M && nextY >= 0 && nextY < N {
                    if currentCellPossibleValues[i].contains(grid[r][c]) && nextCellPossibleValues[i].contains(grid[nextX][nextY]) {
                        ans.append(nextX << 16 | nextY)
                    }
                }
            }
            return ans
        }
        
        let target = (M - 1) << 16 | (N - 1)
        var visited: Set<Int> = [0]
        var queue:[Int] = [0]
        
        while !queue.isEmpty {
            var nextLevel = [Int]()
            for cur in queue {
                
                for next in getNextPositions(cur) {
                    guard next != target else {
                        return true
                    }
                    if !visited.contains(next) {
                        visited.insert(next)
                        nextLevel.append(next)
                    }
                }
                
                
            }
            queue = nextLevel
        }
        return false
    }
}

