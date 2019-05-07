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
class Q971_Solution {
    func flipMatchVoyage(_ root: TreeNode?, _ voyage: [Int]) -> [Int] {
        var result = [Int]()
        var index : Int = 0
        var currentVoyage = voyage
        var isMatched = true
        
        func dfs(_ root : TreeNode?){
            if isMatched{
                guard nil != root else {
                    return
                }
                if (root?.val) != currentVoyage[index]{
                    result.removeAll()
                    result.append(-1)
                    isMatched = false
                }
                index += 1
                if index < currentVoyage.count && nil != root?.left && (root?.left?.val)! != currentVoyage[index]{
                    result.append((root?.val)!)
                    dfs(root?.right)
                    dfs(root?.left)
                } else {
                    dfs(root?.left)
                    dfs(root?.right)
                }
            }
        }
        dfs(root)
        if !result.isEmpty && -1 == result[0] {
            result.removeAll()
            result.append(-1)
        }
        return result
    }
}