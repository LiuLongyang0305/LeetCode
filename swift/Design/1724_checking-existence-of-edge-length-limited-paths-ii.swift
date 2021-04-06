// https://leetcode-cn.com/problems/checking-existence-of-edge-length-limited-paths-ii/
class UnionFind {
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
    
    func findSet(x: Int) -> Int {
        guard fa[x] != x else {
            return x
        }
        fa[x] = findSet(x: fa[x])
        return fa[x]
    }
    
    func union(x:Int,y: Int) -> Bool {
        var fx = findSet(x: x)
        var fy = findSet(x: y)
        guard fx != fy else {
            return false
        }
        if sz[x] < sz[y] {
            (fx,fy) = (fy,fx)
        }
        fa[fx] = fy
        sz[x] += sz[y]
        compCnt -= 1
        return true
    }
    
    func connected(x: Int,y: Int) -> Bool {
        return findSet(x: x) == findSet(x: y)
    }
}


class DistanceLimitedPathsExist {
    let sortedEdgeList: [[Int]]
    let nodesCount: Int
    let edgesCount: Int
    init(_ n: Int, _ edgeList: [[Int]]) {
        sortedEdgeList = edgeList.sorted(by: { (e1, e2) -> Bool in
            e1[2] < e2[2]
        })
        nodesCount = n
        edgesCount = edgeList.count
    }
    
    func query(_ p: Int, _ q: Int, _ limit: Int) -> Bool {
        let  uf = UnionFind(n: nodesCount)
        for idx in 0..<edgesCount {
            guard sortedEdgeList[idx][2] < limit else {
                break
            }
            uf.union(x: sortedEdgeList[idx][0], y: sortedEdgeList[idx][1])
        }
        return uf.connected(x:p, y: q)
    }
}

/**
 * Your DistanceLimitedPathsExist object will be instantiated and called as such:
 * let obj = DistanceLimitedPathsExist(n, edgeList)
 * let ret_1: Bool = obj.query(p, q, limit)
 */