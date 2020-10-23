// https://leetcode.com/problems/kth-ancestor-of-a-tree-node/
// LCA
class TreeAncestor {
    private var fa: [[Int]]
    private var N: Int
    init(_ n: Int, _ parent: [Int]) {
        N = Int(log2(Double(n))) + 2
        fa = Array<Array<Int>>(repeating: Array<Int>(repeating: -1, count: N), count: n)
        for node in 0..<n {
            fa[node][0] = parent[node]
        }
        for i in 1...N {
            for node in 0..<n {
                if fa[node][i - 1] != -1 {
                    fa[node][i] = fa[fa[node][i - 1]][i - 1]
                }
            }
        }
    }
    
    func getKthAncestor(_ node: Int, _ k: Int) -> Int {
        var ans = node
        for i in 0..<N {
            if k >> i & 1 != 0 {
                ans = fa[ans][i]
                guard ans != -1 else {
                    return -1
                }
            }
        }
        return ans
    }
}

/**
 * Your TreeAncestor object will be instantiated and called as such:
 * let obj = TreeAncestor(n, parent)
 * let ret_1: Int = obj.getKthAncestor(node, k)
 */