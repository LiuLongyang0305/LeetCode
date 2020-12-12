// https://leetcode.com/problems/find-critical-and-pseudo-critical-edges-in-minimum-spanning-tree/
class UnionFind {
    private var parent = Array<Int>(0...110)
    func find(_ x : Int) -> Int {
        return x == parent[x] ? x : find(parent[x])
    }
    func union(_ first: Int, _ second: Int) -> Bool {
        let f1 = find(first)
        let f2 = find(second)
        guard f1 != f2 else {
            return false
        }
        parent[f1] = f2
        return true
    }
}

class Solution {
    private struct Edge {
        var from: Int
        var to: Int
        var weight: Int
        var id: Int
        static func < (lhs: Edge, rhs: Edge) -> Bool {
            return lhs.weight < rhs.weight
        }
    }
    private enum OperationType {
        case included
        case excluded
        case noOperation
    }
    private var edges = Array<Edge>()
    private var numberOfVertex: Int = -1
    private var numberOfEdges: Int = -1
    func findCriticalAndPseudoCriticalEdges(_ n: Int, _ edges: [[Int]]) -> [[Int]] {
        self.numberOfVertex = n
        self.numberOfEdges = edges.count
        self.edges = []
        var criticalEdges = Array<Int>()
        var pseudoCriticalEdges = Array<Int>()
        (0..<numberOfEdges).forEach {self.edges.append(Edge(from: edges[$0][0], to: edges[$0][1], weight: edges[$0][2], id: $0))}
        self.edges.sort { (e1, e2) -> Bool in
            e1 < e2
        }
        let minCost = MST(.noOperation)
        for idx in 0..<numberOfEdges {
            let costOnEdgeIncluded = MST(.included, idx, minCost)
            let costOnEdgeExcluded = MST(.excluded, idx,minCost)
            if costOnEdgeExcluded > minCost {
                criticalEdges.append(self.edges[idx].id)
            }
            if costOnEdgeExcluded == minCost && minCost == costOnEdgeIncluded {
                pseudoCriticalEdges.append(self.edges[idx].id)
            }
        }
        return [criticalEdges,pseudoCriticalEdges]
    }
    private func MST(_ op: OperationType, _ idx: Int = -1, _ minCost: Int = Int.max) -> Int {
        let uf = UnionFind()
        var numbersOfConnections = 0
        var cost = 0
        if op == OperationType.included && idx != -1 {
            cost += edges[idx].weight
            numbersOfConnections = 1
            uf.union(edges[idx].from, edges[idx].to)
        }
        for edgeIndex in 0..<numberOfEdges {
            guard edgeIndex != idx else {
                continue
            }
            if  uf.union(edges[edgeIndex].from, edges[edgeIndex].to) {
                numbersOfConnections += 1
                cost += edges[edgeIndex].weight
            }
            guard cost <= minCost else {
                return Int.max
            }
        }
        return numbersOfConnections < numberOfVertex - 1 ? Int.max : cost
    }
}

