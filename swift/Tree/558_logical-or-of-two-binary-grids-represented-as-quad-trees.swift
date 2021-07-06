// https://leetcode.com/problems/logical-or-of-two-binary-grids-represented-as-quad-trees/
/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Bool
 *     public var isLeaf: Bool
 *     public var topLeft: Node?
 *     public var topRight: Node?
 *     public var bottomLeft: Node?
 *     public var bottomRight: Node?
 *     public init(_ val: Bool, _ isLeaf: Bool) {
 *         self.val = val
 *         self.isLeaf = isLeaf
 *         self.topLeft = nil
 *         self.topRight = nil
 *         self.bottomLeft = nil
 *         self.bottomRight = nil
 *     }
 * }
 */
class Solution {
    func intersect(_ quadTree1: Node?, _ quadTree2: Node?) -> Node? {
        guard let qt1 = quadTree1, let qt2 = quadTree2 else {
            return nil
        }
        
        if qt1.isLeaf {
            return qt1.val ? qt1 : qt2
        }
        if qt2.isLeaf {
            return qt2.val ? qt2 : qt1
        }
        let ans = Node(false, false)
        ans.topLeft = intersect(qt1.topLeft, qt2.topLeft )
        ans.topRight = intersect(qt1.topRight , qt2.topRight)
        ans.bottomLeft = intersect(qt1.bottomLeft, qt2.bottomLeft)
        ans.bottomRight = intersect(qt1.bottomRight, qt2.bottomRight)
        //合并:四个子树都是叶子并且数值相同，合并为一个大的叶子结点
        guard let tl = ans.topLeft?.val, let tlf = ans.topLeft?.isLeaf,tlf else {
            return ans
        }
        guard let tr = ans.topRight?.val, let trf = ans.topRight?.isLeaf,trf,tr == tl else {
            return ans
        }
        guard let bl = ans.bottomLeft?.val, let blf = ans.bottomLeft?.isLeaf,blf,bl == tr else {
            return ans
        }
        guard let br = ans.bottomRight?.val, let brf = ans.bottomRight?.isLeaf,brf ,br == bl else {
            return ans
        }
        return Node(tl, true)
    }
}

