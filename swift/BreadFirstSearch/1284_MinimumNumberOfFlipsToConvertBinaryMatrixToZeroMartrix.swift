// https://leetcode.com/problems/minimum-number-of-flips-to-convert-binary-matrix-to-zero-matrix/
class Solution {
    typealias Direction = (dx:Int,dy:Int)
    private let directions: [Direction] = [(0,1),(0,-1),(-1,0),(1,0)]
    func minFlips(_ mat: [[Int]]) -> Int {
        let row = mat.count
        let col = mat[0].count
        let orinalState = mat.map { $0.map { $0 == 1}}
        let endState =  Array<Array<Bool>>(repeating: Array<Bool>(repeating: false, count: col), count: row)
        guard orinalState != endState else {
            return 0
        }
        guard row != 1 || col != 1 else {
            return 1
        }
        func valid(_ x: Int, _ y: Int) -> Bool {
            return x >= 0 && x < row &&  y >= 0 && y < col
        }
        var queue = Array<[[Bool]]>()
        queue.append(orinalState)
        var visited =  Set<[[Bool]]>()
        visited.insert(orinalState)
        var depth = 0
        while !queue.isEmpty {
            depth += 1
            var nextLevel = [[[Bool]]]()
            for status in queue {
                for r in 0..<row {
                    for c in 0..<col {
                        
                        var temp = status
                        temp[r][c] = !temp[r][c]
                        for dir in directions {
                            let nextX = r + dir.dx
                            let nextY = c + dir.dy
                            if valid(nextX, nextY) {
                                temp[nextX][nextY] = !temp[nextX][nextY]
                            }
                        }
                        if temp  == endState {
                            return depth
                        }
                        if !visited.contains(temp) {
                            visited.insert(temp)
                            nextLevel.append(temp)
                        }
                        
                    }
                }
            }
            queue = nextLevel
        }
        return -1
    }
 }