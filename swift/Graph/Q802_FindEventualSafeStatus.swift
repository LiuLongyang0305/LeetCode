//https://leetcode.com/problems/find-eventual-safe-states/
class Solution {
    enum NodeState: Int {
        case unknown = 0
        case unsafe = 1
        case safe = 2
    }
    var graph = [[Int]]()
    var colour = [NodeState]()
    func eventualSafeNodes(_ graph: [[Int]]) -> [Int] {
        let size = graph.count
        self.graph = graph
        self.colour = Array<NodeState>(repeating: .unknown, count: size)
        
        var result = [Int]()
        for i in 0..<size {
            if traverse(index: i) {
                result.append(i)
            }
        }
        return result
    }
    
    private func traverse(index: Int) -> Bool {
        if colour[index] != .unknown {
            return colour[index] == .safe
        }
        
        colour[index] = .unsafe
        
        for i in 0..<graph[index].count {
            if !(colour[graph[index][i]] == .safe) {
                if colour[graph[index][i]]  == .unsafe || !traverse(index: graph[index][i]) {
                    return false
                }
            }
        }
        colour[index] = .safe
        return true
    }
}


//Topologocal Sorting
class Solution2 {
    func eventualSafeNodes(_ graph: [[Int]]) -> [Int] {
        
        var result = [Int]()
        let size = graph.count
        var outDgrees = Array<Int>(repeating: 0, count: size)
        var queue = Array<Int>()
        var graphCopy = Array<Array<Int>>(repeating: Array<Int>(), count: size)
        for i in 0..<size {
            outDgrees[i] = graph[i].count
            if outDgrees[i] == 0 {
                queue.append(i)
            }
            for j in 0..<graph[i].count {
                graphCopy[graph[i][j]].append(i)
            }
        }
        while !queue.isEmpty {
            let noNext = queue.removeFirst()
            result.append(noNext)
            for j in 0..<graphCopy[noNext].count {
                let k = graphCopy[noNext][j]
                outDgrees[k] -= 1
                if outDgrees[k] == 0 {
                    queue.append(k)
                }
            }
        }
        result.sort()
        return result
    }
}