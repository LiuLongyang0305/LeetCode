//https://leetcode.cn/problems/maximum-distinct-path-sum-in-a-binary-tree/
extension TreeNode: Hashable {
    public static func == (lhs: TreeNode, rhs: TreeNode) -> Bool {
        return lhs === rhs
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }

}
class Solution {
    var fathers = [TreeNode:TreeNode]()
    var maxSum = Int.min
    var visited = Set<Int>()
    func maxSum(_ root: TreeNode?) -> Int {
        guard let r = root else {return 0}
        findFather(r, nil)
        findPaths(r, nil, 0)
        for (node,_) in fathers {
            visited = []
            findPaths(node, nil, 0)
        }
        return maxSum
    }


    private func findPaths(_ cur: TreeNode, _ pre: TreeNode?, _ sum: Int) {
        guard !visited.contains(cur.val) else {
            return
        }
        visited.insert(cur.val)
        let newSum = sum + cur.val
        maxSum = max(maxSum,newSum)
        let fa = fathers[cur]
        if let l = cur.left, l !== pre {
            findPaths(l, cur, newSum)
        }
        if let r = cur.right, r !== pre {
            findPaths(r, cur, newSum)
        }
        if let f = fa, fa !== pre {
            findPaths(f, cur, newSum)
        }
        visited.remove(cur.val)
    }

    private func findFather(_ curNode: TreeNode, _ pa: TreeNode?) {
        fathers[curNode] = pa
        if let l = curNode.left {
            findFather(l, curNode)
        }
        if let r = curNode.right {
            findFather(r, curNode)
        }
    }

}
