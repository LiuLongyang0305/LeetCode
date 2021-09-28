// https://leetcode.com/problems/rank-transform-of-a-matrix/
class DSU {
    var parent = [Int:Int]()
    func add(_ x: Int) {
        if nil == parent[x] {
            parent[x] = x
        }
    }
    func find(_ x: Int) -> Int {
        if x != parent[x]! {
            parent[x] = find(parent[x]!)
        }
        return parent[x]!
    }
    func unite(_ x: Int, _ y: Int) {
        let fx = find(x)
        let fy = find(y)
        parent[fy] = fx
    }
    
    func getGroups() -> [Int:[Int]] {
        var ans = [Int:[Int]]()
        for (x,_) in parent {
            ans[find(x), default: []].append(x)
        }
        return ans
    }
}

class Solution {
    func matrixRankTransform(_ matrix: [[Int]]) -> [[Int]] {
        
        let M = matrix.count
        let N = matrix[0].count
        
        var ans = Array<Array<Int>>(repeating: Array<Int>(repeating: 1, count: N), count: M)
        var positions = [Int:Array<Int>]()
        var nums = Set<Int>()
        for i in 0..<M {
            for j in 0..<N {
                positions[matrix[i][j],default: []].append((i << 12) | j)
                nums.insert(matrix[i][j])
            }
        }
        var rank = [Int](repeating: 0, count: M + N)
        let sortedNumbers = nums.sorted()
        let dsu = DSU()
        
        for num in sortedNumbers {
            guard let ps = positions[num] else {continue}
            guard ps.count > 1 else {
                let r = ps[0] >> 12
                let c = ps[0] & 0xfff
                ans[r][c] = max(rank[r], rank[M + c]) + 1
                rank[r] = ans[r][c];
                rank[M + c] = ans[r][c];
                continue
            }
            dsu.parent = [:]
            for p in ps {
                dsu.add(p >> 12)
                dsu.add((p & 0xfff) + M)
                dsu.unite(p >> 12, (p & 0xfff) + M)
            }
            
            for (_,nodes) in dsu.getGroups() {
                var maxRank = 0
                for p in nodes {
                    maxRank = max(maxRank, rank[p])
                }
                for p in nodes {
                    rank[p] = maxRank + 1
                }
            }
            for p in ps {
                ans[p >> 12][p & 0xfff] = rank[p >> 12]
            }
        }
        return ans
    }
}


