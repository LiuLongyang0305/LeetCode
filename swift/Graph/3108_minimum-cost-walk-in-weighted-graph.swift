//https://leetcode.cn/problems/minimum-cost-walk-in-weighted-graph/
class UnionFind1 {
    private var fa: [Int]
    private var sz: [Int]
    private var andValue:[Int]
    private var n: Int
    private var compCnt: Int
    init(n: Int) {
        self.n = n
        self.fa = Array<Int>(0..<n)
        self.compCnt = n
        self.sz = Array<Int>(repeating: 1, count: n)
        self.andValue = Array<Int>(repeating: 0xfffffffffffffff, count: n)
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
    func union(x:Int,y: Int, weight: Int) -> Bool {
        var fx = findSet(x: x)
        var fy = findSet(x: y)
        guard fx != fy else {
            andValue[fx] = andValue[fx] & andValue[fy] & weight
            return false
        }
        if sz[x] < sz[y] {
            (fx,fy) = (fy,fx)
        }
        fa[fy] = fx
        sz[fx] += sz[fy]
        andValue[fx] = andValue[fx] & andValue[fy] & weight
        compCnt -= 1
        return true
    }
    func connected(x: Int,y: Int) -> Bool {
        return findSet(x: x) == findSet(x: y)
    }

    func getCompomentCnt() -> Int {
        return compCnt
    }

     func getAndValue(_ x: Int, _ y: Int) -> Int {

         let fx = findSet(x: x)
         let fy = findSet(x: y)
         return fx == fy ? andValue[fx] : -1
    }
}
class Solution {
    func minimumCost(_ n: Int, _ edges: [[Int]], _ query: [[Int]]) -> [Int] {
//        var graph = [[Int:Int]](repeating: [:], count: n)
        let uf = UnionFind1(n: n)
        for e in edges {
//            graph[e[0]][e[1]] = min(graph[e[0]][e[1]] ?? Int.max,e[2])
//            graph[e[1]][e[0]] = min(graph[e[1]][e[0]] ?? Int.max,e[2])
            let _ = uf.union(x: e[0], y: e[1],weight: e[2])
        }
        return query.map {uf.getAndValue($0[0], $0[1])}
    }
}

