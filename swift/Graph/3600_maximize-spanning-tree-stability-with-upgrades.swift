   //https://leetcode.cn/problems/maximize-spanning-tree-stability-with-upgrades/
class UnionFind1 {
    private var fa: [Int]
    private var sz: [Int]
    private var n: Int
    private var compCnt: Int
    init(n: Int) {
        self.n = n
        self.fa = Array<Int>(0..<n)
        self.compCnt = n
        self.sz = Array<Int>(repeating: 1, count: n)
    }

    func findSet1(x: Int) -> Int {
        guard fa[x] != x else {
            return x
        }
        fa[x] = findSet(x: fa[x])
        return fa[x]
    }
    func findSet(x: Int) -> Int {
        if x != fa[x] {
            fa[x] = findSet(x: fa[x])
        }
        return fa[x]
    }
    @discardableResult
    func union1(x:Int,y: Int) -> Bool {
        var fx = findSet(x: x)
        var fy = findSet(x: y)
        guard fx != fy else {
            return false
        }
        if sz[x] < sz[y] {
            (fx,fy) = (fy,fx)
        }
        fa[fy] = fx
        sz[fx] += sz[fy]
        compCnt -= 1
        return true
    }
    @discardableResult
    func union(x:Int,y: Int) -> Bool {
        let fx = findSet(x: x)
        let fy = findSet(x: y)
        guard fx != fy else {
            return false
        }
        if sz[fx] < sz[fy] {
            fa[fx] = fy
            sz[fy] += sz[fx]
        } else {
            fa[fy] = fx
            sz[fx] += sz[fy]
        }
        compCnt -= 1
        return true
    }
    func connected(x: Int,y: Int) -> Bool {
        return findSet(x: x) == findSet(x: y)
    }

    func getCompomentCnt() -> Int {
        return compCnt
    }
}
    class Solution {
        struct Edge {
            var first: Int
            var second: Int
            var weight: Int
            var haveBeenChoosed:Bool
        }
        func maxStability(_ n: Int, _ edges: [[Int]], _ k: Int) -> Int {
            let uf = UnionFind1(n: n)
            var haveBeenChoosedEdges = [Edge]()
            var candidateEdages = [Edge]()
            for e in edges {
                let edge = Edge(first: e[0], second: e[1], weight: e[2], haveBeenChoosed: e[3] == 1)
                if edge.haveBeenChoosed {
                    haveBeenChoosedEdges.append(edge)
                    guard !uf.connected(x: edge.first, y: edge.second) else {return -1}
                    let _ = uf.union(x: edge.first, y: edge.second)
                } else {
                    candidateEdages.append(edge)
                }
            }

            candidateEdages.sort {$0.weight > $1.weight}
            haveBeenChoosedEdges.sort {$0.weight > $1.weight}


            var needBeenAddEdges = [Edge]()
            for e in candidateEdages {
                guard uf.getCompomentCnt() > 1 else {break}
                guard !uf.connected(x: e.first, y: e.second) else {continue}
                let _ = uf.union(x: e.first, y: e.second)
                needBeenAddEdges.append(e)
            }
            guard uf.getCompomentCnt() == 1 else {return -1}
            if k == 0 {return min(haveBeenChoosedEdges.last?.weight ?? Int.max,needBeenAddEdges.last?.weight ?? Int.max)}
            else if k >= needBeenAddEdges.count {
                return min(haveBeenChoosedEdges.last?.weight ?? Int.max,(needBeenAddEdges.last?.weight ?? Int.max / 2) * 2)
            } else {
                return min(haveBeenChoosedEdges.last?.weight ?? Int.max,(needBeenAddEdges.last?.weight ?? Int.max / 2) * 2,needBeenAddEdges.dropLast(k).last?.weight ?? Int.max)
            }

        }
    }
