// https://leetcode.com/problems/number-of-good-leaf-nodes-pairs/
// 给树的节点编号，默认是dfs遍历的次序
class Solution {
    //按照遍历顺序保存节点深度
    private var depths = [Int]()
    // 保存父亲节点
    private var parents = [Int:Int]()
     //保存叶子节点序号
    private var leaves = [Int]()
    private var distance: Int = -1
    func countPairs(_ root: TreeNode?, _ distance: Int) -> Int {
        // 清理上一个测试案列结果
        depths = []
        parents = [:]
        leaves = []
        self.distance = distance
        // 预处理
        dfs(root, 1, -1)
        return getGoodLeafNodePairsCount()
    }
    
    private func dfs(_ node: TreeNode?,_ depth: Int, _ parent: Int) {
        guard let n = node else {
            return
        }
        depths.append(depth)
        let index = depths.count - 1
        parents[index] = parent
        if nil == n.left && nil == n.right {
            leaves.append(index)
        }
        dfs(n.left, depth + 1, index)
        dfs(n.right, depth + 1, index)
    }
    private func check(_ leave1: Int,_ leave2: Int) -> Bool {
        var maxDepthLeave = depths[leave1] < depths[leave2] ? leave2 : leave1
        var minDepthLeave = maxDepthLeave == leave2 ? leave1 : leave2
        var deltaDepth = depths[maxDepthLeave] - depths[minDepthLeave]
        guard deltaDepth <= distance else {
            return false
        }
        while deltaDepth > 0 {
            maxDepthLeave = parents[maxDepthLeave]!
            deltaDepth -= 1
        }
        while minDepthLeave != maxDepthLeave {
            minDepthLeave = parents[minDepthLeave]!
            maxDepthLeave = parents[maxDepthLeave]!
        }
        
        return depths[leave1] + depths[leave2] - (depths[minDepthLeave] << 1) <= distance
    }
    
    private func getGoodLeafNodePairsCount() -> Int{
        let leavesCount = leaves.count
        guard leavesCount > 1 else {
            return 0
        }
        var ans = 0
        for i in 0..<(leavesCount - 1) {
            for j in (i + 1)..<leavesCount {
                if check(leaves[i], leaves[j]) {
                    ans += 1
                }
            }
        }
        return ans
    }
}


