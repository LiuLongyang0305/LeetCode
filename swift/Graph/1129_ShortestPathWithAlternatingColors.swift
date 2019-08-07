//https://leetcode.com/problems/shortest-path-with-alternating-colors/
class Solution {
    struct ColouredNode: Hashable {
        var node: Int
        var colour: Int
    }
    func shortestAlternatingPaths(_ n: Int, _ red_edges: [[Int]], _ blue_edges: [[Int]]) -> [Int] {
        var distanceTo = Array<Int>(repeating: Int.max, count: n)
        distanceTo[0] = 0
        let graph = builgGraph(vertexNumber: n, redEdges: red_edges, blueEdges: blue_edges)
        var queue = Array<ColouredNode>()
        queue.append(ColouredNode(node: 0, colour: 1))
        queue.append(ColouredNode(node: 0, colour: -1))
        var pathLength = 0
        var visited = Set<ColouredNode>()
        while !queue.isEmpty {
            let size = queue.count
            pathLength += 1
            for _ in 0..<size {
                let colouredNode = queue.removeFirst()
                let node = colouredNode.node
                let color = colouredNode.colour
                let oppositeColor  = -color
                for j in 1..<n {
                    if graph[node][j] == oppositeColor || graph[node][j] == 0 {
                        let nextColouredNode = ColouredNode(node: j, colour: oppositeColor)
                        if  !visited.contains(nextColouredNode) {
                            queue.append(nextColouredNode)
                            distanceTo[j] = min(distanceTo[j], pathLength)
                            visited.insert(nextColouredNode)
                        }
                    }
                }
            }
        }
        for i in 1..<n {
            if distanceTo[i] == Int.max {
                distanceTo[i] = -1
            }
        }
        return distanceTo
    }
    
    private func builgGraph(vertexNumber: Int, redEdges: [[Int]], blueEdges: [[Int]]) ->  [[Int]] {
        var graph = Array<Array<Int>>(repeating: Array<Int>(repeating: Int.min, count: vertexNumber), count: vertexNumber)
        for redEdge in redEdges {
            graph[redEdge[0]][redEdge[1]] = 1
        }
        for blueEdge in blueEdges {
            let from = blueEdge[0]
            let to = blueEdge[1]
            graph[from][to] = graph[from][to] == 1 ? 0 : -1
        }
        return graph
    }
}