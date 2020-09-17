// https://leetcode.com/problems/the-maze/
class Solution {
    private  struct RollEnd {
        var up: Int
        var down: Int
        var left: Int
        var right: Int
    }
    
    private var maze = [[Int]]()
    private var positionToRollEnd = [Int:RollEnd]()
    private var M = 0
    private var N = 0
    private var start = 0
    private var destination = 0
    var ans = false
    func hasPath(_ maze: [[Int]], _ start: [Int], _ destination: [Int]) -> Bool {
        self.maze = maze
        self.positionToRollEnd = [:]
        self.M = maze.count
        self.N = maze[0].count
        self.start = start[0] << 8 | start[1]
        self.destination = destination[0] << 8 | destination[1]
        self.ans = false
        
        getRollEnds()
        BFS()
        return ans
    }
    private func getRollEnds() {
        
        func getRollEnd(_ position: Int) {
            let r = position >> 8
            let c = position & 0xff
            var end = RollEnd(up: position, down: position, left: position, right: position)
            //up
            var curRow = r
            while curRow >= 0 && maze[curRow][c] == 0 {
                curRow -= 1
            }
            end.up = (curRow + 1) << 8 | c
            //down
            curRow = r
            while curRow < M && maze[curRow][c] == 0 {
                curRow += 1
            }
            end.down = (curRow - 1) << 8 | c
            // left
            var curCol = c
            while curCol >= 0 && maze[r][curCol] == 0 {
                curCol -= 1
            }
            end.left = r << 8 | (curCol + 1)
            // right
            curCol = c
            while curCol < N && maze[r][curCol] == 0 {
                curCol += 1
            }
            end.right = r << 8 | (curCol - 1)
            positionToRollEnd[position] = end
        }
        
        for r in 0..<M {
            for c in 0..<N {
                if maze[r][c] == 0 {
                    getRollEnd(r << 8 | c)
                }
            }
        }
    }
    
    private func BFS() {
        
        var visited = Set<Int>()
        var queue = [start]
        visited.insert(start)
        var nextLevel = [Int]()

        func check(_ position: Int) -> Bool {
            if !visited.contains(position) {
                guard position != destination else {
                    return true
                }
                visited.insert(position)
                nextLevel.append(position)
            }
            return false
        }
        while !queue.isEmpty {
            nextLevel = []
            for curP in queue {
                guard let nextPositions = positionToRollEnd[curP] else {
                    continue
                }
                guard !(check(nextPositions.up) || check(nextPositions.down) || check(nextPositions.left) || check(nextPositions.right)) else {
                    ans = true
                    return
                }
            }
            queue = nextLevel
        }
    }
}
