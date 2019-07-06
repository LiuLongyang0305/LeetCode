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
class Q671_Solution {
    func findSecondMinimumValue(_ root: TreeNode?) -> Int {
        typealias SecondMin = (min : Int,secondMin: Int)
        var result : SecondMin = (-1,-1)
        func inorder(_ root : TreeNode?) {
            if nil == root {
                return
            }
            inorder(root?.left)
            let value = (root?.val)!
            if result.min == -1 {
                result.min = value
            } else {
                if result.secondMin == -1 {
                    if result.min > value {
                        result.secondMin = result.min
                        result.min = value
                    }
                    if result.min < value {
                        result.secondMin = value
                    }
                } else {
                    if result.min > value {
                        result.secondMin = result.min
                        result.min = value
                    } else if result.secondMin > value && result.min != value {
                        result.secondMin = value
                    }
                }
            }
            inorder(root?.right)
        }
        inorder(root)
        return result.secondMin
    }
}