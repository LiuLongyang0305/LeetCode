//https://leetcode.com/problems/matrix-cells-in-distance-order/
class Solution1 {
    private let directions = [[0,1],[0,-1],[-1,0],[1,0]]
    func allCellsDistOrder(_ R: Int, _ C: Int, _ r0: Int, _ c0: Int) -> [[Int]] {
        var ans = [[Int]]()
        var  visited = Set<[Int]>()
        func valid(_ position: [Int]) -> Bool {
            return position[0] >= 0 && position[0] < R && position[1] >= 0 && position[1] < C  && !visited.contains(position)
        }
        var nodes = [[Int]]()
        nodes.append([r0,c0])
        visited.insert([r0,c0])
        var lastLevelEndIndex = -1
        while !nodes.isEmpty && lastLevelEndIndex != nodes.count - 1 {
            let endIndex = nodes.count - 1
            for index in (lastLevelEndIndex + 1)...endIndex {
                let currentPosition  = nodes[index]
                for dir in directions {
                    let next = [currentPosition[0] + dir[0], currentPosition[1] + dir[1]]
                    if  valid(next) {
                        visited.insert(next)
                        nodes.append(next)
                    }
                }
                lastLevelEndIndex = endIndex
            }
        }
        return nodes
    }
 }
 class Solution {
    func allCellsDistOrder(_ R: Int, _ C: Int, _ r0: Int, _ c0: Int) -> [[Int]] {
        var ans = [[Int]]()
        for row in 0..<R {
            for col in 0..<C {
                ans.append([row,col])
            }
        }
        ans.sort { (p1, p2) -> Bool in
            abs(p1[0] - r0) + abs(p1[1] - c0) < abs(p2[0] - r0) + abs(p2[1] - c0)
        }
        return ans
    }
 }