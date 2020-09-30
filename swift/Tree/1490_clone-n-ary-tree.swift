// https://leetcode.com/problems/clone-n-ary-tree/
/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var children: [Node]
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.children = []
 *     }
 * }
 */

class Solution {
    func cloneTree(_ root: Node?) -> Node? {
        guard let r = root else {
            return nil
        }
        let ans = Node(r.val)
        for child in r.children {
            ans.children.append(cloneTree(child)!)
        }
        return ans
    }
}
