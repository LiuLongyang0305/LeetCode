//https://leetcode.com/problems/power-grid-maintenance/
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
    func processQueries(_ c: Int, _ connections: [[Int]], _ queries: [[Int]]) -> [Int] {
        let uf = UnionFind1(n: c + 1)
        for c in connections {
            uf.union(x: c[0], y: c[1])
        }

        var map = [Int:Heap<Int>]()
        var fa = [Int](repeating: -1, count: c + 1)
        for i in 1...c {
            let f = uf.findSet(x: i)
            map[f,default: Heap<Int>()].insert(i)
            fa[i] = f
        }

        var offline = Set<Int>()
        var ans = [Int]()
        for q in queries {
            if q[0] == 2 {
                offline.insert(q[1])
            } else {
                if offline.contains(q[1]) {
                    while let min = map[fa[q[1]]]?.min, offline.contains(min) {
                        map[fa[q[1]]]?.popMin()
                    }
                    ans.append(map[fa[q[1]]]?.min ?? -1)
                } else {
                    ans.append(q[1])
                }
            }
        }
        return ans
    }
}
