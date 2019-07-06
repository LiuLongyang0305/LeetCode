//https://leetcode.com/problems/most-frequent-subtree-sum/
class TreeNode {
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
    var sumCount = Dictionary<Int,Int>()
    private func getSubTreeSum(root: TreeNode?) -> Int {
        guard nil != root else {
            return 0
        }
        
        var leftSum = 0
        var rightSum = 0
        if nil != root?.left {
            leftSum = getSubTreeSum(root: root?.left)
        }
        if nil != root?.right {
            rightSum = getSubTreeSum(root: root?.right)
        }
        let totalSum = root!.val + leftSum + rightSum
        insertSubtreeSum(sum: totalSum)
        return totalSum
    }
    func insertSubtreeSum(sum: Int)  {
        if nil == sumCount[sum] {
            sumCount[sum] = 1
        } else {
            sumCount[sum] = sumCount[sum]! + 1
        }
    }
    func findFrequentTreeSum(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        guard nil != root else {
            return result
        }
        getSubTreeSum(root: root)
        let maxValue = sumCount.values.max()!
        for item in sumCount {
            if item.value == maxValue {
                result.append(item.key)
            }
        }
        return result
    }
}
