//https://leetcode.com/problems/number-of-islands/

//Union Find
class Solution {
    class UnionFind {
        var parents: [Int]
        init(size: Int) {
            parents = Array<Int>(repeating: -1, count: size)
        }
        
        public func union(x: Int,y: Int)  {
            let rootX = find(node: x)
            let rootY = find(node: y)
            parents[rootX] = rootY
        }
        public func find(node : Int) -> Int {
            var currentRoot = node
            var temp = node
            while parents[currentRoot] != currentRoot {
                currentRoot = parents[currentRoot]
            }
            
            while  temp != parents[temp]{
                let nextRoot = parents[temp]
                parents[temp] = currentRoot
                temp = nextRoot
            }
            return temp
        }
        public func connected(x: Int, y: Int) -> Bool {
            let xRoot = find(node: x)
            return xRoot != -1 && xRoot == find(node: y)
        }
    }

    typealias Direction = (dx: Int, dy: Int)

    func numIslands(_ grid: [[Character]]) -> Int {
        guard !grid.isEmpty else {
            return 0
        }

        let rowSize = grid.count
        let columnSize = grid[0].count
        let unionFind = UnionFind(size: rowSize * columnSize)
        let directions: [Direction] = [(0,1),(0,-1),(1,0),(-1,0)]
        var numOfIslands = 0
        for i in 0..<rowSize {
            for j in 0..<columnSize {
                if grid[i][j] == "1" {
                    let index = i * columnSize + j
                    unionFind.parents[index] = index
                }
            }
        }
        
        for i in 0..<rowSize {
            for j in 0..<columnSize {
                if grid[i][j] == "1" {
                    let index = i * columnSize + j
                    for direction in directions {
                        let newX = i + direction.dx
                        let newY = j + direction.dy
                        if newX >= 0 && newY >= 0 && newX < rowSize && newY < columnSize && grid[newX][newY] == "1" {
                            let newIndex = newX * columnSize + newY
                            if !unionFind.connected(x: index, y: newIndex){
                                unionFind.union(x: index, y: newIndex)
                            }
                        }
                        
                    }
                }
            }
        }

        for i in 0..<unionFind.parents.count {
            if unionFind.parents[i] == i {
                numOfIslands += 1
            }
        }
        return numOfIslands
    }
}

// Map Coloring Problem
class Solution2 {

    struct Position: Hashable {
        var x: Int
        var y: Int
    }

    typealias Direction = (dx: Int, dy: Int)
    func numIslands(_ grid: [[Character]]) -> Int {
        guard !grid.isEmpty else {
            return 0
        }
        let rowSize = grid.count
        let columnSize = grid[0].count
        let directions: [Direction] = [(0,1),(0,-1),(1,0),(-1,0)]
        var numOfIslands = 0
        var gridCopy = grid
        var visited = Set<Position>()
        func dfs(x: Int, y: Int) {
            gridCopy[x][y] = "0"
            for direction in directions {
                let newX = x + direction.dx
                let newY = y + direction.dy
                
                if newX >= 0 && newY >= 0 && newX < rowSize && newY < columnSize  {
                    let currentPosition = Position(x: newX, y: newY)
                    if  !visited.contains(currentPosition) {
                        visited.insert(currentPosition)
                        if grid[newX][newY] == "1" {
                            dfs(x: newX, y: newY)
                        }
                    }
                }
            }
        }
        
        for i in 0..<rowSize {
            for j in 0..<columnSize {
                if gridCopy[i][j] == "1" {
                    numOfIslands += 1
                    dfs(x: i, y: j)
                }
            }
        }
        return numOfIslands
    }
}
