// https://leetcode.com/problems/path-sum-iv/
class Solution {
    private class Node {
        
        public var val: Int
        public var left: Node?
        public var right: Node?
        public var pos: Int
        public var level: Int
        
        public init(_ val: Int, _ pos: Int,_ level: Int) {
            self.val = val
            self.left = nil
            self.right = nil
            self.pos = pos
            self.level = level
        }
        
    }
    func pathSum(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else {
            return 0
        }
        guard nums.count > 1 else {
            return nums[0] % 10
        }
        let tree: Node? = Node(nums[0] % 10, nums[0] / 10 % 10, nums[0] / 100)
        
        
        
        func createTree() {
            func insertNode(_ node: Node,_ root: Node?) -> Bool {
                guard nil != root else {
                    return false
                }
                if root!.level == node.level - 1 {
                    if let p = root?.pos {
                        if node.pos == p * 2 {
                            root?.right = node
                            return true
                        } else if node.pos == p * 2 - 1 {
                            root?.left = node
                            return true
                        }
                    }
                }
                if insertNode(node, root?.left){
                    return true
                }
                return insertNode(node, root?.right)
            }
            for i in 1..<nums.count {
                let node = Node(nums[i] % 10, nums[i] / 10 % 10, nums[i] / 100)
                insertNode(node, tree)
            }
        }
        createTree()
        var ans = 0
        func dfs(_ root: Node?, _ pathSum:  Int) {
            guard let r = root else {
                return
            }
            
            if nil == r.left && nil == r.right {
                ans += pathSum + r.val
            } else {
                dfs(r.left, pathSum + r.val)
                dfs(r.right, pathSum + r.val)
            }
        }
        dfs(tree, 0)
        return ans
    }
}
