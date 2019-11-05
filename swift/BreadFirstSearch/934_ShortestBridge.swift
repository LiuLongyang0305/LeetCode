//https://leetcode.com/problems/shortest-bridge/
class Solution {
    func shortestBridge(_ A: [[Int]]) -> Int {
        
        let length = A.count
        var island = Set<[Int]>()
        var visited = Set<[Int]>()
        let dx = [0,0,-1,1]
        let dy = [1,-1,0,0]
        
        func valid(_ x: Int, _ y: Int) -> Bool {
            return x >= 0 && x < length && y >= 0  && y < length
        }
        
        func BFSToGetIsland(_ x: Int, _ y: Int) {
            var onesPositions = Array<[Int]>()
            onesPositions.append([x,y])
            while !onesPositions.isEmpty {
                let length = onesPositions.count
                for _ in 0..<length {
                    let p = onesPositions.removeFirst()
                    for i in 0...3 {
                        let nextX = p[0] + dx[i]
                        let nextY = p[1] + dy[i]
                        let nextP = [nextX,nextY]
                        if valid(nextX, nextY) && !visited.contains(nextP) && A[nextX][nextY] == 1 {
                            visited.insert(nextP)
                            island.insert(nextP)
                            onesPositions.append(nextP)
                        }
                    }
                }
            }
        }
        //找到任一一座岛屿
        for i in 0..<length {
            if !island.isEmpty {
                break
            }
            for j in 0..<length {
                if A[i][j] == 1 && island.isEmpty {
                    let p = [i,j]
                    visited.insert(p)
                    island.insert(p)
                    BFSToGetIsland(i, j)
                    break
                }
            }
        }
        
        //扩散
        visited = Set<[Int]>(island)
        func BFSToCreateShortestBridge() -> Int {
            var nodes = Array<[Int]>(island)
            var depth = 0
            while !nodes.isEmpty {
                let length = nodes.count
                depth += 1
                for _ in 0..<length {
                    let p = nodes.removeFirst()
                    for i in 0...3 {
                        let nextX = p[0] + dx[i]
                        let nextY = p[1] + dy[i]
                        let nextP = [nextX,nextY]
                        if valid(nextX, nextY) && !visited.contains(nextP) {
                            if A[nextX][nextY] == 1 {
                                return depth - 1
                            }
                            visited.insert(nextP)
                            nodes.append(nextP)
                        }
                    }
                }
            }
            return 0
        }
        return BFSToCreateShortestBridge()
    }
}