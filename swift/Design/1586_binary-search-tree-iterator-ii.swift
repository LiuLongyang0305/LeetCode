// https://leetcode-cn.com/problems/binary-search-tree-iterator-ii/
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
class BSTIterator {
    private var nodes = [TreeNode]()
    private var cur = -1
    init(_ root: TreeNode?) {
        dfs(root)
    }
    
    func hasNext() -> Bool {
        return cur < nodes.count - 1
    }
    
    func next() -> Int {
        cur += 1
        // print("***   \(cur)   ***")
        return nodes[cur].val
    }
    
    func hasPrev() -> Bool {
        return cur > 0
    }
    
    func prev() -> Int {
        // print("&&&   \(cur - 1)   &&&")
        cur -= 1
        return nodes[cur].val
    }
    
    private func dfs(_ root: TreeNode?) {
        guard let r = root else {
            return
        }
        dfs(r.left)
        nodes.append(r)
        dfs(r.right)
    }
}

/**
 * Your BSTIterator object will be instantiated and called as such:
 * let obj = BSTIterator(root)
 * let ret_1: Bool = obj.hasNext()
 * let ret_2: Int = obj.next()
 * let ret_3: Bool = obj.hasPrev()
 * let ret_4: Int = obj.prev()
 */