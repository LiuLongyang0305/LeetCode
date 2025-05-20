
// https://leetcode.cn/problems/grid-teleportation-traversal/
class Solution {
    private typealias Position = (x:Int,y:Int)
    private typealias Direction = (dx:Int,dy:Int)
    private let dirs: [Direction] = [(0,1),(0,-1),(1,0),(-1,0)]
    private struct BFSNode:Comparable {
        static func < (lhs: Solution.BFSNode, rhs: Solution.BFSNode) -> Bool {
            return lhs.steps < rhs.steps
        }

        var x: Int
        var y: Int
        var steps: Int
    }

    func minMoves(_ matrix: [String]) -> Int {

        let M = matrix.count
        let N = matrix[0].count
        if  M == 1 && N == 1 {return 0}

        //处理数据
        let newMatrix = matrix.map { str in
            str.map {$0.isLetter ? $0.lowercased().first! : $0}
        }
        var  transDoors = [Character:[Position]]()
        for i in 0..<M {
            for j in 0..<N {
                if newMatrix[i][j].isLetter {
                    transDoors[newMatrix[i][j],default: []].append((i,j))
                }
            }
        }

        //记录数据用于剪枝
        var memo = [[Int]](repeating: [Int](repeating: Int.max / 2, count: N), count: M)
        memo[0][0] = 0
        var heap = Heap<BFSNode>()
        heap.insert(BFSNode(x: 0, y: 0, steps: 0))
        var ans = Int.max / 2
        if newMatrix[0][0].isLetter {
            if let ps = transDoors[newMatrix[0][0]] {
                for p in ps {
                    heap.insert(BFSNode(x: p.x, y: p.y, steps: 0))
                }
            }
        }


        while !heap.isEmpty {
            let last = heap.popMin()!
            for  (dx,dy) in dirs {
                let nx = last.x + dx
                let ny = last.y + dy
                guard nx >= 0 && nx < M && ny >= 0 && ny < N else {
                    continue
                }
                guard last.steps < ans else {continue}
                guard newMatrix[nx][ny] != "#" else {continue}
                //普通走法
                if last.steps + 1 < memo[nx][ny] {
                    memo[nx][ny] = last.steps + 1
                    heap.insert(BFSNode(x: nx, y: ny, steps: last.steps + 1))
                    if nx == M - 1 && ny == N - 1 {
                        ans = min(ans,last.steps + 1)
                    }
                }

            }

            //传送门
            if newMatrix[last.x][last.y].isLetter {
                let steps = last.steps
                if steps < ans {
                    if let ps = transDoors[newMatrix[last.x][last.y]] {
                        for p in ps {
                            if steps < memo[p.x][p.y] {
                                memo[p.x][p.y] = steps
                                heap.insert(BFSNode(x: p.x, y: p.y,steps: steps))
                                if p.x == M - 1 && p.y == N - 1 {
                                    ans = min(ans,last.steps)
                                }
                            }
                        }
                    }
                }

            }
        }
        return  ans == Int.max / 2 ? -1 : ans
    }
}