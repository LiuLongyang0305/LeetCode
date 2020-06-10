// https://leetcode-cn.com/problems/er-cha-sou-suo-shu-de-hou-xu-bian-li-xu-lie-lcof/
class Solution {
    func verifyPostorder(_ postorder: [Int]) -> Bool {
        var root = Int.max
        var stack = [Int]()
        for idx in stride(from: postorder.count - 1, to: -1, by: -1) {
            if postorder[idx] > root {return false}
            //倒序遍历，跟 右 左  ，
            while !stack.isEmpty  && postorder[idx] < stack.first! {
                //开始进入左节点
                //右节点出组
                //出循环后root表示当前为左子树的根节点
                root = stack.remove(at: 0)
            }
            //右节点 根节点 入组
            stack.insert(postorder[idx], at: 0)
        }
        return true
    }
}