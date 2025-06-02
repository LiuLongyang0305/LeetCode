//https://leetcode.cn/problems/minimum-moves-to-clean-the-classroom/
class Solution {
    private typealias Direction = (dx:Int,dy:Int)
    private let dirs:[Direction] = [(0,1),(0,-1),(1,0),(-1,0)]
    private struct Node: Hashable {
        var pos: Position
        var e: Int
        var mask: Int
    }
    private struct Position: Hashable {
        var x: Int
        var y: Int
    }
    func minMoves(_ classroom: [String], _ energy: Int) -> Int {
        let grid = classroom.map { [Character]($0)}
        let M = grid.count
        let N = grid[0].count
        var _gabages = [Position]()
        var s = Node(pos: Position(x:-1,y:-1), e: energy, mask: 0)
        for i in 0..<M {
            for j in 0..<N {
                if grid[i][j] == "S" {
                    s.pos = Position(x: i, y: j)
                } else if grid[i][j] == "L" {
                    _gabages.append(Position(x: i, y: j))
            }
        }


        let gabageCnt = _gabages.count
        let maxMask = (1 << gabageCnt) - 1
        var gabageToIndex = [Position:Int]()
        for i in 0..<gabageCnt {
            gabageToIndex[_gabages[i]] = i
        }

        var steps = 0
        var queue = [Node]()
        queue.append(s)
        var visited = Set<Node>()
        visited.insert(s)

        while !queue.isEmpty {
            steps += 1
            var newQueue = [Node]()
            for curNode  in  queue {
                let (x,y,e,m) = (curNode.pos.x,curNode.pos.y,curNode.e,curNode.mask)
                if m == maxMask {return steps - 1}
                if e == 0 {continue}
                for (dx,dy) in dirs {
                    let nx = dx + x
                    let ny = dy + y
                    guard nx >= 0 && nx < M && ny >= 0 && ny < N else {continue}
                    let p = Position(x: nx, y: ny)
                    if grid[nx][ny] == "X" {
                        continue
                    }
                    let newMask = grid[nx][ny] == "L" ? (m | (1 << gabageToIndex[p]!)) : m
                    let newqEnergy = grid[nx][ny] == "R" ? energy : (e - 1)
                    let newNode = Node(pos: p, e: newqEnergy, mask: newMask)
                    if !visited.contains(newNode) {
                        visited.insert(newNode)
                        newQueue.append(newNode)
                    }

                }
            }
            queue = newQueue
        }
        return -1
    }
}
