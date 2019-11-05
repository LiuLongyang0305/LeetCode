class Solution {
    typealias Direction = (dx: Int, dy: Int)
    typealias Position = (x: Int, y: Int)
    let directions: [Direction] = [(0,1),(0,-1),(1,0),(-1,0)]
    var length = -1
    func maxDistance(_ grid: [[Int]]) -> Int {
        length = grid.count
        var visited = Set<[Int]>()
        var positions = [Position]()
        var depth = 0
        for i in 0..<length {
            for j in 0..<length {
                if grid[i][j] == 1 {
                    positions.append((i,j))
                    visited.insert([i,j])
                }
            }
        }
        guard !(positions.isEmpty || positions.count == length *  length) else {
            return -1
        }
        while !positions.isEmpty {
            let count = positions.count
            depth += 1
            for _ in 0..<count {
                let p = positions.removeFirst()
                for dir in directions {
                    let nextX = p.x + dir.dx
                    let nextY = p.y + dir.dy
                    if valid(nextX, nextY) && !visited.contains([nextX,nextY]) {
                        visited.insert([nextX,nextY])
                        positions.append((nextX,nextY))
                    }
                }
            }
        }
        return depth - 1
    }
    private func valid(_ x: Int, _ y: Int) -> Bool {
        return x >= 0 && x < length && y >= 0 && y < length
    }
}