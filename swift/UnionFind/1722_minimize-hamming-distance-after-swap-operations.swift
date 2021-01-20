// https://leetcode.com/problems/minimize-hamming-distance-after-swap-operations/
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

class Solution {
    func minimumHammingDistance(_ source: [Int], _ target: [Int], _ allowedSwaps: [[Int]]) -> Int {
        let N = source.count
        var visited = Array<Bool>(repeating: false, count: N)
        let uf = UnionFind(n: N)
        for allowSwap in allowedSwaps {
            if !visited[allowSwap[0]] {
                visited[allowSwap[0]] = true
            }
            if !visited[allowSwap[1]] {
                visited[allowSwap[1]] = true
            }
            uf.union(x: allowSwap[0], y: allowSwap[1])
        }
        var cnt = 0
        var map = [Int:[Int]]()
        for idx in 0..<N {
            if visited[idx] {
                map[uf.findSet(x: idx),default: []].append(idx)
            } else {
                if source[idx] != target[idx] {
                    cnt += 1
                }
            }
        }
        
        for (_,indices) in map {
            var counter = [Int:Int]()
            for idx in indices {
                counter[source[idx], default: 0] += 1
                counter[target[idx], default: 0] -= 1
            }
            var t = 0
            for (_,c) in counter {
                t += abs(c)
            }
            cnt += (t >> 1)
        }
        return cnt
    }
}


