 // https://leetcode.com/problems/minimum-number-of-operations-to-sort-a-binary-tree-by-level/
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
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

    func getCompoment() -> Int {
        return compCnt
    }
}

class Solution {
    func minimumOperations(_ root: TreeNode?) -> Int {
        return levelOrder(root).reduce(0) { $0 + getReverseTimes($1)}
    }

    func levelOrder(_ root: TreeNode?) -> [[Int]] {

        var result = [[Int]]()
        if nil == root {
            return result
        }
        func _dfs(node: TreeNode?,level : Int){
            if nil == node {
                return
            }
            if result.count < level + 1 {
                result.append([Int]())
            }
            result[level].append((node?.val)!)
            _dfs(node: node?.left, level: level + 1)
            _dfs(node: node?.right, level: level + 1)
        }
        _dfs(node: root, level: 0)
        return result
    }

    func getReverseTimes(_ nums: [Int]) -> Int {
        guard nums.count > 1 else {return 0}
        let sortedIndices = (0..<nums.count).sorted { nums[$0] < nums[$1]}
        let  uf = UnionFind(n: nums.count)
        for i in 0..<nums.count {
            if sortedIndices[i] != i {
                uf.union(x: sortedIndices[i], y: i)
            }
        }
        return nums.count - uf.getCompoment()
    }
}