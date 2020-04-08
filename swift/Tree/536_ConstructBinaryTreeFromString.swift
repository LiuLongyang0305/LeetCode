// https://leetcode.com/problems/construct-binary-tree-from-string/
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}
class Solution {
    func str2tree(_ s: String) -> TreeNode? {
        
        guard !s.isEmpty else {
            return nil
        }
        if let num = Int(s) {
            return TreeNode(num)
        }
        
        var root: TreeNode? = nil
        var roots = [TreeNode?]()
        var val = ""
        
        for ch in s {
            if "()".contains(ch) {
                if let num = Int(val) {
                    let node = TreeNode(num)
                    if nil == root {
                        root = node
                    } else {
                        if nil == roots[roots.count - 1]?.left {
                            roots[roots.count - 1]?.left = node
                        } else {
                            roots[roots.count - 1]?.right = node
                        }
                    }
                    roots.append(node)
                    val = ""
                }
                if ch == ")" {
                    roots.removeLast()
                }
            } else {
                val.append(ch)
            }
        }
        return root
    }
}
