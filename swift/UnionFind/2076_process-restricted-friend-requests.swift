// https://leetcode.com/problems/process-restricted-friend-requests/
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
}

class Solution {
    func friendRequests(_ n: Int, _ restrictions: [[Int]], _ requests: [[Int]]) -> [Bool] {
        var ans = [Bool]()
        let uf = UnionFind(n: n)
        
        for request in requests {

            let fx = uf.findSet(x: request[0])
            let fy = uf.findSet(x: request[1])
            
            guard fx != fy else {
                ans.append(true)
                continue
            }
            
            var valid = true
            for restriction in restrictions {
                let f1 = uf.findSet(x: restriction[0])
                let f2 = uf.findSet(x: restriction[1])
//                print("\(fx)   \(fy)   \(f1)  \(f2)")
                guard !((f1 == fx && f2 == fy) || (f1 == fy && f2 == fx)) else  {
                    valid = false
                    break
                }
            }
            ans.append(valid)
            guard valid  else { continue }
            let _ = uf.union(x: fx, y: fy)
        }
        return ans
    }
    
}