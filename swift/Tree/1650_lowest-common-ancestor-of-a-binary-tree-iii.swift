// https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-tree-iii/
/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var left: Node?
 *     public var right: Node?
 *     public var parent: Node?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *         self.parent = nil
 *     }
 * }
 */

class Solution {
    func lowestCommonAncestor(_ p: Node?,_ q: Node?) -> Node? {
        let pLevel = getLevel(of: p)
        let qLevel = getLevel(of: q)
        let targetLevel = min(pLevel, qLevel)
        var newP = getSameLevelParent(of: p, pLevel, targetLevel)
        var newQ = getSameLevelParent(of: q, qLevel, targetLevel)
        while newP!.val != newQ!.val {
            newP = newP?.parent
            newQ = newQ?.parent
        }
        return newQ
    }
    private func getLevel(of node: Node?) -> Int {
        var lelel = 0
        var n = node
        while let p = n?.parent {
            lelel += 1
            n = p
        }
        return lelel
    }
    private func getSameLevelParent(of node: Node?, _ level: Int, _ targetLevel: Int) -> Node? {
        guard level > targetLevel else {
            return node
        }
        return getSameLevelParent(of: node?.parent, level - 1, targetLevel)
    }
}
