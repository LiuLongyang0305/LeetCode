// https://leetcode.com/problems/binary-tree-vertical-order-traversal/
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
    private typealias LevalAndValue = (level: Int,value: Int)
    func verticalOrder(_ root: TreeNode?) -> [[Int]] {
        var map = [Int:[LevalAndValue]]()
        var ans = [[Int]]()
        func dfs(_ node: TreeNode?, _ x: Int, _ y: Int) {
            guard let r = node else {
                return
            }
            if nil == map[x] {
                map[x] = []
            }
            map[x]?.append((y,r.val))
            dfs(r.left, x - 1, y + 1)
            dfs(r.right, x + 1, y + 1)
        }
        dfs(root, 0,0)
        let sortedMap = map.sorted { (dic1, dic2) -> Bool in
            dic1.key < dic2.key
        }
        for (_,values) in sortedMap {
            let sortedValues = values.sorted { (v1, v2) -> Bool in
                v1.level < v2.level
            }
            ans.append(sortedValues.map({$0.value}))
        }
        return ans
    }
}
