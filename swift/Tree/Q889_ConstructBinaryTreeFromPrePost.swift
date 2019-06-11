//https://leetcode.com/problems/construct-binary-tree-from-preorder-and-postorder-traversal/
class TreeNode {
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
    func constructFromPrePost(_ pre: [Int], _ post: [Int]) -> TreeNode? {
        guard pre.count == post.count else {
            return nil
        }
        guard !pre.isEmpty else {
            return nil
        }
        let root = TreeNode(pre[0])
        let count = pre.count
        if count == 1 {
            return root
        } else if count == 2 {
            root.left = TreeNode(pre[1])
            return root
        } else {
            if pre[1] == post[count - 2] {
                root.left = constructFromPrePost(Array<Int>(pre[1...]),Array<Int>(post[0...(count - 2)]) )
            } else {
                let rightIndex = pre.lastIndex(of: post[count - 2] )!
                let leftIndex = post.firstIndex(of: pre[1])!
                root.left = constructFromPrePost(Array<Int>(pre[1..<rightIndex]),Array<Int>(post[0...leftIndex]) )
                root.right = constructFromPrePost(Array<Int>(pre[rightIndex...]), Array<Int>(post[(leftIndex + 1)...(count - 1)]))
            }
            return root
        }
    }
}

