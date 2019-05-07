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
class Q988_Solution {
    func smallestFromLeaf(_ root: TreeNode?) -> String {
        let chars = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
        func travelersal(_ root : TreeNode?) -> String {
            if nil == root {
                return ""
            }
            let left = root?.left
            let right = root?.right
            let rootStr = chars[(root?.val)!]
            if nil == left && nil == right {
                return rootStr
            } else  {
                var leftResult = ""
                var rightResult = ""
                if nil == left || nil == right{
                    let target = nil == left ? right : left
                    leftResult  = travelersal(target?.left)
                    rightResult = travelersal(target?.right)
                    if leftResult == "" || rightResult == "" {
                        return (leftResult == "" ? rightResult : leftResult ) + chars[(target?.val)!] + rootStr
                    } else {
                        leftResult += chars[(target?.val)!] + rootStr
                        rightResult += chars[(target?.val)!] + rootStr
                        return leftResult < rightResult ? leftResult : rightResult
                    }
                    
                } else {
                    leftResult = travelersal(left) + rootStr
                    rightResult = travelersal(right) + rootStr
                }
                return leftResult < rightResult ? leftResult : rightResult
            }
        }
        return travelersal(root)
    }
}