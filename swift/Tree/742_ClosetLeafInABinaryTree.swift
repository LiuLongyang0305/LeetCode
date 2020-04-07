//https://leetcode-cn.com/problems/closest-leaf-in-a-binary-tree/
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
    
    func findClosestLeaf(_ root: TreeNode?, _ k: Int) -> Int {
        
        var paths = [[Int]]()
        var targetPath = [Int]()
        var targetNode: TreeNode? = nil
        
        func dfs(_ root: TreeNode?, _ currentPath: inout [Int]) {
            guard let r = root else {
                return
            }
            currentPath.append(r.val)
            //当前节点时目标节点
            if r.val == k {
                targetPath = currentPath
                targetNode = r
            }
            //当前节点是叶子节点，保存完整路径
            if nil == r.left && nil == r.right {
                paths.append(currentPath)
            } else {
                dfs(r.left, &currentPath)
                dfs(r.right, &currentPath)
            }
            currentPath.removeLast()
        }
        
        
        var currentPath = [Int]()
        dfs(root, &currentPath)
        //目标节点就是叶子节点
        guard nil != targetNode?.left || nil != targetNode?.right else {
            return k
        }
        
        var minDis = Int.max
        var ans = 0
        /**
         分别计算叶子节点到目标节点距离，分两种情况：
         (1) 叶子节点是目标节点的后代
         (2) 叶子节点不是目标节点的后代，这种情况需要限向上追溯他们的公共祖先，再计算二者距离
         */
        
        for path in paths {
            
            if let index = path.firstIndex(of: k) {
                let dis = path.count - 1 - index
                if dis < minDis {
                    (minDis,ans) = (dis,path.last!)
                }
            } else {
                var j = 0
                while path[j] == targetPath[j] {
                    j += 1
                }
                let dis = min(minDis,path.count - j + targetPath.count - j)
                if dis < minDis {
                    (minDis,ans) = (dis,path.last!)
                }
            }
            
        }
        return ans
    }
}
