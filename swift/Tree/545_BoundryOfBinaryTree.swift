// https://leetcode-cn.com/problems/boundary-of-binary-tree/
class Solution {
    func boundaryOfBinaryTree(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
            return []
        }
        guard nil != root.left || nil != root.right else {
            return [root.val]
        }
        
        var ans = [Int]()
        var leftBoundry = [TreeNode?]()
        leftBoundry.append(root)
        var rightBoundry = [TreeNode?]()
        rightBoundry.append(root)
        
        if nil != root.left {
            dfs(root.left, true,&leftBoundry)
        }
        if nil != root.right {
            dfs(root.right, false,&rightBoundry)
        }
        var bottom = getBottom(root)
        if !bottom.isEmpty && leftBoundry[leftBoundry.count - 1] === bottom[0] {
            
            bottom.removeFirst()
        }
        if !bottom.isEmpty && bottom[bottom.count - 1] === rightBoundry[rightBoundry.count - 1] {
            bottom.removeLast()
        }
        rightBoundry.removeFirst()
        leftBoundry.append(contentsOf: bottom)
        leftBoundry.append(contentsOf: rightBoundry.reversed())
        return leftBoundry.map { $0!.val}
    }
    private  func printNodes(_ boundry: [TreeNode?]) {
        var str = ""
        for node in boundry {
            str += "   \(node!.val)"
        }
        print(str)
    }
    private func dfs(_ root: TreeNode?, _ left: Bool,_ boundry: inout [TreeNode?]) {
        boundry.append(root)
        if left {
            if let l = root?.left {
                dfs(l, true,&boundry)
            } else if let r = root?.right {
                dfs(r, true,&boundry)
            }
        } else {
            if let r = root?.right {
                dfs(r, false,&boundry)
            } else if let l = root?.left {
                dfs(l, false,&boundry)
            }
        }
    }
    private func getBottom(_ root: TreeNode?) -> [TreeNode?] {
        var levels = [TreeNode?]()
        func dfs(_ root: TreeNode?) {
            guard let r = root else {
                return
            }
            dfs(r.left)
            if nil == r.left && nil == r.right {
                levels.append(r)
            }
            dfs(r.right)
        }
        dfs(root)
        return levels
    }
}
