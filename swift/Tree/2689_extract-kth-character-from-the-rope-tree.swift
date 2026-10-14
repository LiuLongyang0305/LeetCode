//https://leetcode.cn/problems/extract-kth-character-from-the-rope-tree/
public class RopeTreeNode {
    var len: Int
    var val: String
    var left: RopeTreeNode?
    var right: RopeTreeNode?
    init(len: Int = 0, val: String = "", left: RopeTreeNode? = nil, right: RopeTreeNode? = nil) {
        self.len = len
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution {
    func getKthCharacter(_ root: RopeTreeNode?, _ k: Int) -> Character {


        func dfs(_ node: RopeTreeNode?) {
            guard let n = node else {return}
            if nil == n.left && nil == n.right {
                n.len = n.val.count
                return
            }
            if let ln = n.left {
                dfs(ln)
            }
            if let rn = n.right {
                dfs(rn)
            }
        }

        dfs(root)


        var sb: Character? = nil

        func dfs(_ node: RopeTreeNode?, _ kth: Int) {
            guard nil == sb else {return}
            guard let n = node else {return}
            if nil == n.left && nil == n.right {
                sb = n.val[n.val.index(n.val.startIndex, offsetBy:  kth - 1)]
                return
            }

            if let ln = n.left, ln.len >= kth {
                dfs(ln, kth)
                return
            }
            dfs(n.right, kth - (n.left?.len ?? 0))
        }
        dfs(root, k)
        return sb ?? " "
    }

}


class Solution {
    func getKthCharacter(_ root: RopeTreeNode?, _ k: Int) -> Character {

        func dfs(_ node: RopeTreeNode?) -> String {
            guard let n = node else {return ""}
            return dfs(n.left) + n.val + dfs(n.right)
        }
        let s = dfs(root)

        return s[s.index(s.startIndex, offsetBy: k - 1)]
    }
}
