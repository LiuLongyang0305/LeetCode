//https://leetcode.com/problems/flood-fill/
class Solution {
    struct Position: Hashable {
        var x: Int
        var y: Int
    }
    typealias Direction = (dx: Int, dy: Int)
    let directions: [Direction] = [(0,1),(0,-1),(1,0),(-1,0)]
    func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ newColor: Int) -> [[Int]] {
        let row =  image.count
        let col = image[0].count
        var ans = image
        let  targetColor = image[sr][sc]
        

        
        var visited = Set<Position>()
        visited.insert(Position(x: sr, y: sc))
        var positions = [Position]()
        positions.append(Position(x: sr, y: sc))
        ans[sr][sc] = newColor
        func  valid(_ p: Position) -> Bool {
            return p.x < row && p.x >= 0  && p.y >= 0 && p.y < col && image[p.x][p.y] == targetColor && !visited.contains(p)
        }
        
        while !positions.isEmpty {
            let length  = positions.count
            for _ in 0..<length {
                let p = positions.removeFirst()
                for dir in directions {
                    let newP = Position(x: p.x + dir.dx, y: p.y + dir.dy)
                    if valid(newP) {
                        visited.insert(newP)
                        positions.append(newP)
                        ans[newP.x][newP.y] = newColor
                    }
                }
            }
        }
        return ans
    }
}
class Solution1 {
    struct Position: Hashable {
        var x: Int
        var y: Int
    }
    typealias Direction = (dx: Int, dy: Int)
    let directions: [Direction] = [(0,1),(0,-1),(1,0),(-1,0)]
    func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ newColor: Int) -> [[Int]] {
        let row =  image.count
        let col = image[0].count
        var ans = image
        let  targetColor = image[sr][sc]
        var visited = Set<Position>()

        func  valid(_ p: Position) -> Bool {
            return p.x < row && p.x >= 0  && p.y >= 0 && p.y < col && image[p.x][p.y] == targetColor && !visited.contains(p)
        }
        
        func dfs(_ p: Position)  {
            for dir in directions {
                let newP = Position(x: p.x + dir.dx, y: p.y + dir.dy)
                if valid(newP) {
                    ans[newP.x][newP.y] = newColor
                    visited.insert(newP)
                    dfs(newP)
                }
            }
        }
        
        visited.insert(Position(x: sr, y: sc))
        ans[sr][sc] = newColor
        dfs(Position(x: sr, y: sc))
        return ans
    }
}