// https://leetcode.com/problems/remove-max-number-of-edges-to-keep-graph-fully-traversable/
class DSU {

    private var  fa: [Int]
    private var edgesCnt: Int
    init(_ nodeCnt: Int) {
        self.fa = [Int](0...nodeCnt)
        self.edgesCnt = 0
    }



    func findSet(x: Int) -> Int {
        if x != fa[x] {
            fa[x] = findSet(x: fa[x])
        }
        return fa[x]
    }

    func getEdgesCnt() -> Int {
        return edgesCnt
    }

    @discardableResult
    func merge(_ x: Int,_ y:Int) -> Int {
        let fx = findSet(x: x)
        let fy = findSet(x: y)
        guard fx != fy else {return 1}
        fa[fx] = fy
        edgesCnt += 1
        return 0
    }
}

class Solution {
    func maxNumEdgesToRemove(_ n: Int, _ edges: [[Int]]) -> Int {
        var ans = 0
        let aliceTree = DSU(n)
        let bobTree = DSU(n)
        for edge in edges {
            guard edge[0] == 3 else {continue}
            ans += aliceTree.merge(edge[1], edge[2])
            bobTree.merge(edge[1], edge[2])
        }
        for edge in edges {
            guard edge[0] != 3 else {continue}
            let tree = edge[0] == 1 ? aliceTree : bobTree
            ans += tree.merge(edge[1], edge[2])
        }
        return (aliceTree.getEdgesCnt() == n - 1 && bobTree.getEdgesCnt() == n - 1) ? ans : -1
    }
}