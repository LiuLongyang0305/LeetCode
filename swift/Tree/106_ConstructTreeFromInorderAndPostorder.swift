// Definition for a binary tree node.
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
class Q106_Solution {
    func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        if postorder.isEmpty || inorder.isEmpty {
            return nil
        }
        let rootValue = postorder.last!
        let root : TreeNode? = TreeNode(rootValue)
        print("\(inorder) \(postorder)")
        if postorder.count != 1 {
            let index = inorder.firstIndex(of: rootValue)!
            let arrs = inorder.split(separator: rootValue)
            
            if 1 == arrs.count {
                let currentPosorder = postorder.prefix(upTo: postorder.count - 1)
                if index == 0 {
                    //no left tree
                    root?.right = buildTree( Array<Int>(arrs[0]),Array<Int>(currentPosorder))
                } else  {
                    //no right tree
                    root?.left = buildTree( Array<Int>(arrs[0]),Array<Int>(currentPosorder))
                }
            } else {
                let rightPosorder = postorder[(index + 1)...(postorder.count - 2)]
                let leftPosorder = postorder.prefix(upTo: index)
                root?.left = buildTree( Array<Int>(arrs[0]),Array<Int>(leftPosorder))
                root?.right = buildTree(Array<Int>(arrs[1]),Array<Int>(rightPosorder))
            }
        }
        return root
    }
}