//https://leetcode.com/problems/shortest-path-visiting-all-nodes/
class Solution {
    private struct State: Hashable {
        var visited: UInt16
        var node: Int
    }
    private let one: UInt16 = 1
    func shortestPathLength(_ graph: [[Int]]) -> Int {
        let allNodes: UInt16 = one << graph.count - 1
        
        var queue = Array<State>()
        var visited = Set<State>()
        for node in 0..<graph.count {
            let startState = State(visited: one << node, node: node)
            queue.append(startState)
            visited.insert(startState)
        }

        var depth = 0
        while !queue.isEmpty {
            depth += 1
            var nextLevel = [State]()
            for state in queue {
                for node in graph[state.node] {
                    let v = state.visited | (one << node)
                    guard v != allNodes else {
                        return depth
                    }
                    let next = State(visited: v, node: node)
                    if !visited.contains(next) {
                        visited.insert(next)
                        nextLevel.append(next)
                    }
                }
            }
            queue = nextLevel
        }
        return 0
    }
 }