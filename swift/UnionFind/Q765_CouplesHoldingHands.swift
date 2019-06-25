//https://leetcode.com/problems/couples-holding-hands/
class Solution {
    var couplesCount = 0
    class UnionFind {
        var parents: [Int]
        var count: Int
        init(size: Int) {
            parents = Array<Int>(0..<size)
            count = size
        }
        private func find(node: Int) -> Int {
            if parents[node] == node {
                return node
            }
            var curretRoot = node
            while curretRoot != parents[curretRoot] {
                curretRoot = parents[curretRoot]
            }
            return curretRoot
        }
        func union(first: Int, second: Int)  {
            let rootFirst = find(node: first)
            let rootSecond = find(node: second)
            if rootFirst != rootSecond {
                parents[rootFirst] = rootSecond
                self.count -= 1
            }
        }
    }
    func minSwapsCouples(_ row: [Int]) -> Int {
        let size = row.count / 2
        let uf = UnionFind(size: size)
        for i in 0..<size {
            let a = row[2 * i]
            let b = row[2 * i + 1]
            uf.union(first: a/2, second: b/2)
        }
        return size - uf.count
    }
}