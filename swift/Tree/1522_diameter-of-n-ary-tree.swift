// https://leetcode.com/problems/diameter-of-n-ary-tree/
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
    func diameter(_ root: Node?) -> Int {
        var ans = 0
        let _ = traversal(root,&ans)
        return ans - 1
    }
    private func traversal(_ root: Node?, _ curMaxDiameter: inout Int) -> Int {
        guard let r = root else {
            return 0
        }
        var pathsLength = [Int]()
        for n in r.children {
            pathsLength.append(traversal(n,&curMaxDiameter))
        }
        //print("val = \(r.val)  pathLength = \(pathsLength)")
        guard !pathsLength.isEmpty else {
            curMaxDiameter = max(curMaxDiameter, 1)
            return 1
        }
        if pathsLength.count == 1 {
            curMaxDiameter = max(curMaxDiameter, 1 + pathsLength[0])
        } else {
            pathsLength.sort {$0 > $1}
            curMaxDiameter = max(curMaxDiameter, 1 + pathsLength[0] + pathsLength[1])
        }
        return 1 + (pathsLength.isEmpty ? 0 : pathsLength.max()!)
    }
}
