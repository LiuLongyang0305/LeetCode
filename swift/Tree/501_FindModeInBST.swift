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
class Q501_Solution {
    func findMode(_ root: TreeNode?) -> [Int] {
        var dic = Dictionary<Int,Int>()
        func inorder(_ root : TreeNode?){
            if nil == root {
                return
            }
            inorder(root?.left)
            if nil == dic[(root?.val)!] {
                dic[(root?.val)!] = 1
            } else {
                dic[(root?.val)!] = dic[(root?.val)!]! + 1
            }
            inorder(root?.right)
        }
        var result = [Int]()
        if nil == root {
            return result
        }
        if nil == root?.left && nil == root?.right {
            result.append((root?.val)!)
            return result
        }
        inorder(root)
        var max : Int = 0
        for (key,value) in dic {
            if value > max {
                max = value
                result.removeAll()
                result.append(key)
            } else if value == max {
                result.append(key)
            }
        }
        let temp = dic.filter { $0.value == max}
        result.append(contentsOf: temp.keys)
        return result
    }
}