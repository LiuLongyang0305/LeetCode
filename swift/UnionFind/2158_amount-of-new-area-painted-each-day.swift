//  https://leetcode-cn.com/problems/amount-of-new-area-painted-each-day/
class Solution {
    class UnionFindArray {
        var n: Int
        var count: Int
        var parent: [Int]
        var rank: [Int]
        
        init(_ _n: Int) {
            self.n = _n
            self.count = _n
            self.parent = Array<Int>(0..._n)
            self.rank = [Int](repeating: 1, count: _n)
        }
        
        func find(_ x: Int) -> Int {
            if x != self.parent[x] {
                self.parent[x] = self.find(self.parent[x])
            }
            return self.parent[x]
        }
        
        func isConnected(_ x: Int, _ y: Int) -> Bool {
            return self.find(x) == self.find(y)
        }
        
        func union(_ x: Int, _ y: Int) -> Bool {
            let rootX = find(x)
            let rootY = find(y)
            guard rootX != rootY else {return false}
            let newRootY = max(rootX, rootY)
            let newRootX = min(rootX, rootY)
            self.parent[newRootY] = newRootX
            self.rank[newRootX] += self.rank[newRootY]
            self.count -= 1
            return true
        }
    }
    func amountPainted(_ paint: [[Int]]) -> [Int] {
        let uf = UnionFindArray.init(50010)
        var ans = [Int]()
        for p in paint {
            let (start,end) = (p[0],p[1])
            let startRoot = uf.find(start)
            var endRoot = uf.find(end)
            var cur = 0
            while endRoot != startRoot {
                cur += 1
                let _ = uf.union(endRoot, endRoot - 1)
                endRoot = uf.find(endRoot)
            }
            ans.append(cur)
        }
        
        return ans
    }
}
