//https://leetcode.com/problems/pacific-atlantic-water-flow/
class Solution {
    typealias Position = (x: Int,y: Int)
    func pacificAtlantic(_ matrix: [[Int]]) -> [[Int]] {
        guard !matrix.isEmpty else {
            return []
        }
        let row = matrix.count
        let col = matrix[0].count
        var canFlowToPacific = Set<[Int]>()
        var canFlowToAtlantic = Set<[Int]>()
        var visited = Set<[Int]>()
        let dx = [0,0,1,-1]
        let dy = [1,-1,0,0]
        func bfs(_ x: Int,_ y: Int, _ isToPacific: Bool) {
            var nodes = [[Int]]()
            nodes.append([x,y])
            while !nodes.isEmpty {
                let length = nodes.count
                for _ in 0..<length {
                    let node = nodes.removeFirst()
                    for i in 0..<4 {
                        let nextX = node[0] + dx[i]
                        let nextY = node[1] + dy[i]
                        if nextX >= 0 && nextX < row  &&  nextY >= 0  && nextY < col && !visited.contains([nextX,nextY]) {
                            if matrix[nextX][nextY] >= matrix[node[0]][node[1]] {
                                if isToPacific {
                                    canFlowToPacific.insert([nextX,nextY])
                                } else {
                                    canFlowToAtlantic.insert([nextX,nextY])
                                }
                                visited.insert([nextX,nextY])
                                nodes.append([nextX,nextY])
                            }
                        }
                    }
                }
            }
        }
        for i in 0..<col {
            if  !visited.contains([0,i]) {
                visited.insert([0,i])
                canFlowToPacific.insert([0,i])
                bfs(0,i,true)
            }
        }
        for i in 0..<row {
            if !visited.contains([i,0]) {
                canFlowToPacific.insert([i,0])
                visited.insert([i,0])
                bfs(i, 0,true)
            }
        }
        visited = []
        for i in 0..<col {
            if  !visited.contains([row - 1,col - 1 - i]) {
                visited.insert([row  - 1,col - 1 - i])
                canFlowToAtlantic.insert([row - 1,col - 1 - i])
               bfs(row - 1, col - 1 - i, false)
            }
        }
        for i in 0..<row {
            if !visited.contains([row  - 1 - i,col - 1]) {
                canFlowToAtlantic.insert([row  - 1 - i,col - 1])
                visited.insert([row  - 1 - i,col - 1])
                bfs(row  - 1 - i, col - 1, false)
            }
        }
        return [[Int]](canFlowToAtlantic.intersection(canFlowToPacific))
    }
}