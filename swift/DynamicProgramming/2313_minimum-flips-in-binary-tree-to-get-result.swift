//  https://leetcode.com/problems/minimum-flips-in-binary-tree-to-get-result/
/**
 1. 由于可以反转，任何子树的计算结果都可以是`true` 或者`false`
 2. 用`Pair`表示当前子树得到结果为`true`的最小翻转次数`tc`,为`false`的最小翻转次数`fc`
 2. 根据逻辑运算的规则进行计算即可
 */
class Solution {
    private typealias Pair = (tc: Int,fc:Int)
    private let FALSE = 0
    private let TRUE = 1
    private let OR = 2
    private let AND = 3
    private let XOR = 4
    private let NOT = 5
    private let INF = 1_000_000_000

    func minimumFlips(_ root: TreeNode?, _ result: Bool) -> Int {


        func dfs(_ root: TreeNode?) -> Pair {

            guard let r = root else {return (INF,INF)}
            var ans: Pair = (INF,INF)
            if FALSE == r.val {
                ans.fc = 0
                ans.tc = 1
            } else if TRUE == r.val {
                ans.tc = 0
                ans.fc = 1
            } else if NOT == r.val {
                let pair = dfs(r.left ?? r.right)
                ans.fc = pair.tc
                ans.tc = pair.fc
            } else {
                let leftAns = dfs(r.left)
                let rightAns = dfs(r.right)
                if OR == r.val {
                    ans.fc = leftAns.fc + rightAns.fc
                    ans.tc = min(leftAns.tc + rightAns.tc,leftAns.tc + rightAns.fc,leftAns.fc + rightAns.tc)
                } else if XOR == r.val {
                    ans.tc = min(leftAns.fc + rightAns.tc, leftAns.tc + rightAns.fc)
                    ans.fc = min(leftAns.tc + rightAns.tc, leftAns.fc + rightAns.fc)
                } else if AND == r.val {
                    ans.tc = leftAns.tc + rightAns.tc
                    ans.fc = min(leftAns.fc + rightAns.fc,leftAns.tc + rightAns.fc,leftAns.fc + rightAns.tc)
                }
            }
            return ans
        }

        let pair = dfs(root)
        return result ? pair.tc : pair.fc
    }
}
