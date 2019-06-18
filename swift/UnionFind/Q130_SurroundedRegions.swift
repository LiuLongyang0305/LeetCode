//https://leetcode.com/problems/surrounded-regions/
class Solution {
    
    struct Position:  Hashable {
        var x: Int
        var y: Int
        
        static func ==(left: Position, right: Position ) -> Bool {
            return left.x == right.x && left.y == right.y
        }
    }
    
    class UnionFind {
        var parents = Dictionary<Position,Position>()
        
        func find(node: Position) -> Position {
            guard parents[node] != nil else {
                parents[node] = node
                return node
            }
            var currentRoot = node
            while parents[currentRoot] != currentRoot {
                currentRoot = parents[currentRoot]!
            }
            var tempNode = node
            while parents[tempNode] != tempNode {
                let next = parents[tempNode]!
                parents[tempNode] = currentRoot
                tempNode = next
            }
            return currentRoot
        }
        
        func connected(first: Position, second: Position) -> Bool {
            return find(node: first) == find(node: second)
        }
        
        func union(first: Position, second: Position)  {
            let rootX = find(node: first)
            let rootY = find(node: second)
            parents[rootX] = rootY
            
        }
    }
    typealias Direction = (dx: Int, dy: Int)
    func solve(_ board: inout [[Character]]) {
        guard !board.isEmpty else {
            return
        }
        let rowSize = board.count
        let columnSize = board[0].count
        let unionFind = UnionFind()
        let directions: [Direction] = [(0,1),(0,-1),(1,0),(-1,0)]
        
        for i in 0..<rowSize {
            for j in 0..<columnSize {
                if board[i][j] == "O" {
                    let first = Position(x: i, y: j)
                    unionFind.find(node: first)
                    for direction in directions {
                        let newX = i + direction.dx
                        let newY = j + direction.dy
                        if newX >= 0 && newY >= 0 && newX < rowSize && newY < columnSize && board[newX][newY] == "O" {
                            let second = Position(x: newX, y: newY)
                            if !unionFind.connected(first: first, second: second) {
                                unionFind.union(first: first, second: second)
                            }
                        }
                    }
                    
                    
                }
            }
        }
        
        func isValid(node: Position) -> Bool {
            return !(node.x == 0 || node.x == rowSize - 1 || node.y == 0 || node.y == columnSize - 1)
            
        }
        
        var rootToNodes = Dictionary<Position,[Position]>()
        let roots = unionFind.parents.filter { (key,val) -> Bool in
            key == unionFind.find(node: key) && isValid(node: key)
        }
        for root in roots {
            rootToNodes[root.key] = [Position]()
        }
        
        for (key,val) in unionFind.parents {
            if isValid(node: key) {
                rootToNodes[val]?.append(key)
            } else {
                rootToNodes.removeValue(forKey: val)
            }
        }
        for (_,val) in rootToNodes {
            for node in val {
                board[node.x][node.y] = "X"
            }
            
        }
    }
}