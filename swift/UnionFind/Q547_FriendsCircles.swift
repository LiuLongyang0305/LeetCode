//https://leetcode.com/problems/friend-circles/
class Solution {
    class UnionFind {
        var parents: [Int]
        init(size: Int) {
            parents = Array<Int>(repeating: 0, count: size)
            for i in 0..<size {
                parents[i] = i
            }
        }
        
        public func union(x: Int,y: Int)  {
            let rootX = find(node: x)
            let rootY = find(node: y)
            parents[rootX] = rootY
        }
        public func find(node : Int) -> Int {
            var currentRoot = node
            var temp = node
            while parents[currentRoot] != currentRoot {
                currentRoot = parents[currentRoot]
            }
            
            while  temp != parents[temp]{
                let nextRoot = parents[temp]
                parents[temp] = currentRoot
                temp = nextRoot
            }
            return temp
        }
        public func connected(x: Int, y: Int) -> Bool {
            return find(node: x) == find(node: y)
        }
    }
    func findCircleNum(_ M: [[Int]]) -> Int {
        let size = M.count
        var result = size
        let unionFind = UnionFind(size: size)
        for i in 0..<size {
            for j in (i + 1)..<size {
                if M[i][j] == 1 {
                    if !unionFind.connected(x: i, y: j) {
                        unionFind.union(x: i, y: j)
                        result -= 1
                    }
                }
            }
        }
        return result
    }
}
