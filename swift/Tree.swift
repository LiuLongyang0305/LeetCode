// Definition for a binary tree node.
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
class Solution {
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if nil == p && nil == q {
            return true
        } else if nil == p || nil == q {
            return false
        } else {
            if p?.val != q?.val{
                return false
            }
            return isSameTree(p?.left,q?.left) && isSameTree(p?.right,q?.right)
        }
    }
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        func inorder(_ root : TreeNode?){
            if root == nil {
                return
            }
            inorder(root?.left)
            result.append((root?.val)!)
            inorder(root?.right)
        }
        inorder(root)
        return result
    }
    
    func inorderTraversal2(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        var nodeStack = Array<TreeNode?>()
        var temp = root
        while nil != temp || !nodeStack.isEmpty {
            if nil != temp {
                nodeStack.append(temp)
                temp = temp?.left
            } else {
                temp = nodeStack.popLast()!!
                result.append((temp?.val)!)
                temp = temp?.right
            }
        }
        return result
    }
    
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        func preorder(_ currentRoot : TreeNode?) {
            if nil == currentRoot {
                return
            }
            result.append((currentRoot?.val)!)
            preorder(currentRoot?.left)
            preorder(currentRoot?.right)
        }
        preorder(root)
        return result
    }
    
    func preorderTraversal2(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        if nil != root {
            var nodesStack = Array<TreeNode?>()
            nodesStack.append(root)
            while !nodesStack.isEmpty {
                let temp : TreeNode = nodesStack.popLast()!!
                result.append(temp.val)
                if nil != temp.right {
                    nodesStack.append(temp.right)
                }
                if nil != temp.left {
                    nodesStack.append(temp.left)
                }
            }
        }
        return result
    }
    
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        func postotder(currentRoot : TreeNode?) {
            if nil == currentRoot {
                return
            }
            postotder(currentRoot: currentRoot?.left)
            postotder(currentRoot: currentRoot?.right)
            result.append((currentRoot?.val)!)
        }
        postotder(currentRoot: root)
        return result
    }
    
    func postorderTraversal2(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        if nil != root {
            var nodesStack1 = Array<TreeNode?>()
            var nodesStack2 = Array<TreeNode?>()
            nodesStack1.append(root)
            while !nodesStack1.isEmpty {
                let temp = nodesStack1.popLast()!!
                nodesStack2.append(temp)
                if nil != temp.left {
                    nodesStack1.append(temp.left)
                }
                if nil != temp.right {
                    nodesStack1.append(temp.right)
                }
            }
            while !nodesStack2.isEmpty {
                result.append(nodesStack2.popLast()!!.val)
            }
        }
        return result
    }
    func maxDepth(_ root: TreeNode?) -> Int {
        if nil == root {
            return 0
        }
        if nil == root?.left && nil == root?.right {
            return 1
        }
        
        return 1 + max(maxDepth(root?.left), maxDepth(root?.right))
    }
    
    func minDepth(_ root: TreeNode?) -> Int {
        if nil == root {
            return 0
        }
        
        if nil == root?.left || nil == root?.right {
            return 1
        }
        let leftDepth = minDepth(root?.left)
        let rightDepth = minDepth(root?.right)
        return 1 + ((0 == leftDepth || 0 == rightDepth ) ? (leftDepth + rightDepth) : min(leftDepth, rightDepth))
    }
    func levelOrderBFS(_ root: TreeNode?) -> [[Int]] {
        var result = [[Int]]()
        if nil == root {
            return result
        }
        var queue = Array<TreeNode?>()
        queue.append(root)
        while !queue.isEmpty {
            var currentLevel = [Int]()
            let levelSize = queue.count
            for _ in 0..<levelSize {
                let node : TreeNode? = queue.removeFirst()
                currentLevel.append((node?.val)!)
                if nil != node?.left {
                    queue.append(node?.left)
                }
                if nil != node?.right {
                    queue.append(node?.right)
                }
            }
            result.append(currentLevel)
        }
        return result
    }
    func levelOrderDFS(_ root: TreeNode?) -> [[Int]] {
        
        var result = [[Int]]()
        if nil == root {
            return result
        }
        func _dfs(node: TreeNode?,level : Int){
            if nil == node {
                return
            }
            if result.count < level + 1 {
                result.append([Int]())
            }
            result[level].append((node?.val)!)
            _dfs(node: node?.left, level: level + 1)
            _dfs(node: root?.right, level: level + 1)
        }
        _dfs(node: root, level: 0)
        return result
    }
   
    func isSymmetric2(_ root: TreeNode?) -> Bool {
        func isMirror(_ s: TreeNode? , _ t : TreeNode?) -> Bool{
            let falg1 = nil != s
            let falg2 = nil != t
            return falg1 && falg2 ? (s?.val == t?.val && isMirror(s?.left, t?.right) && isMirror(s?.right, t?.left)) : (!falg2 &&  !falg1)
        }
        
        return nil != root ? isMirror(root?.left, root?.right) : true
    }

    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        if nums.isEmpty {
            return nil
        } else {
            let mid = nums.count / 2
            let val = nums[nums.count / 2]
            let node = TreeNode(val)
            node.left = sortedArrayToBST(Array<Int>(nums[0..<mid]))
            node.right = sortedArrayToBST(Array<Int>(nums[(mid + 1)..<nums.count]))
            return node
        }
    }
    func isBalanced(_ root: TreeNode?) -> Bool {
        func depth(_ root : TreeNode?) -> Int {
            if nil == root {
                return 0
            } else {
                return 1 + max(depth(root?.left), depth(root?.right))
            }
        }
        if nil == root {
            return true
        } else {
            let leftDepth = depth(root?.left)
            let rightDepth = depth(root?.right)
            let delta = leftDepth > rightDepth ? (leftDepth - rightDepth ) : (rightDepth - leftDepth)
            return  delta <= 1 && isBalanced(root?.left) &&  isBalanced(root?.right)
        }
    }
    
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        if nil == root {
            return nil
        } else {
            let temp = root?.left
            root?.left = invertTree(root?.right)
            root?.right = invertTree(temp)
            return root
        }
    }
    
    func hasPathSum(_ root: TreeNode?, _ sum: Int) -> Bool {
        if nil == root {
            return false
        } else if nil == root?.left && nil == root?.right {
            return root?.val == sum
        } else {
            let target : Int = sum - (root?.val)!
            return hasPathSum(root?.left,target) || hasPathSum(root?.right,target)
        }
    }
    
    func binaryTreePaths(_ root: TreeNode?) -> [String] {
        if nil == root {
            return [String]()
        } else if nil == root?.left && nil == root?.right {
            return ["\((root?.val)!)"]
        } else {
            var left = binaryTreePaths(root?.left)
            let right = binaryTreePaths(root?.right)
            left.append(contentsOf: right)
            for i in 0..<left.count {
                left[i] = "\((root?.val)!)->" + left[i]
            }
            return left
        }
    }
    
    func sumOfLeftLeaves(_ root: TreeNode?) -> Int {
        if nil == root {
            return 0
        } else {
            let left =  root?.left
            let right =  root?.right
            if nil == left {
                return sumOfLeftLeaves(right)
            } else {
                if nil == left?.left && nil == left?.right {
                    return (left?.val)! + sumOfLeftLeaves(right)
                } else {
                    return sumOfLeftLeaves(left) + sumOfLeftLeaves(right)
                }
            }
        }
    }

    func findTilt(_ root: TreeNode?) -> Int {
        var title : Int = 0
        func getSum(_ root : TreeNode?) -> Int {
            if nil == root {
                return 0
            } else {
                let leftSum = getSum(root?.left)
                let rightSum =  getSum(root?.right)
                title += abs(leftSum - rightSum)
                return (root?.val)! + leftSum + rightSum
            }
        }
        
        
        getSum(root)
        return title
    }
    
    func tree2str(_ t: TreeNode?) -> String {
        if nil == t {
            return ""
        } else {
            let left = t?.left
            let right = t?.right
            if nil == left && nil == right {
                return String((t?.val)!)
            } else {
                let rightResult = tree2str(t?.right)
                return String((t?.val)!) + "(\(tree2str(left)))" + (rightResult.isEmpty ? "" : "(\(rightResult))")
            }
        }
    }
    
    func mergeTrees(_ t1: TreeNode?, _ t2: TreeNode?) -> TreeNode? {
        if nil == t1 || nil == t2 {
            return nil == t1 ? t2 : t1
        } else {
            t1?.val = (t1?.val)! + (t2?.val)!
            t1?.left = mergeTrees(t1?.left, t2?.left)
            t1?.right = mergeTrees(t1?.right, t2?.right)
            return t1
        }
    }
    
    func averageOfLevels(_ root: TreeNode?) -> [Double] {
        var result = [Double]()
        if nil == root {
            return result
        }
        var queue = Array<TreeNode?>()
        queue.append(root)
        while !queue.isEmpty {
            let length = queue.count
            var sum : Int = 0
            for _ in 0..<length {
                let node : TreeNode? = queue.removeFirst()
                sum += (node?.val)!
                if nil != node?.left {
                    queue.append(node?.left)
                }
                if nil != node?.right {
                    queue.append(node?.right)
                }
            }
            result.append(Double(sum) / Double(length))
        }
        return result
    }
    
    func findTarget(_ root: TreeNode?, _ k: Int) -> Bool {
        var visitedSet = Set<Int>()
        var flag = false
        func inorder(_ root : TreeNode?) {
            if flag {
                return
            }
            if nil == root {
                return
            }
            inorder(root?.left)
            if visitedSet.contains(k - (root?.val)!){
                flag = true
                return
            } else {
                visitedSet.insert((root?.val)!)
            }
            inorder(root?.right)
        }
        inorder(root)
        return flag
    }
    
    func findSecondMinimumValue(_ root: TreeNode?) -> Int {
        typealias SecondMin = (min : Int,secondMin: Int)
        var result : SecondMin = (-1,-1)
        func inorder(_ root : TreeNode?) {
            if nil == root {
                return
            }
            inorder(root?.left)
            let value = (root?.val)!
            if result.min == -1 {
                result.min = value
            } else {
                if result.secondMin == -1 {
                    if result.min > value {
                        result.secondMin = result.min
                        result.min = value
                    }
                    if result.min < value {
                        result.secondMin = value
                    }
                } else {
                    if result.min > value {
                        result.secondMin = result.min
                        result.min = value
                    } else if result.secondMin > value && result.min != value {
                        result.secondMin = value
                    }
                }
            }
            inorder(root?.right)
        }
        inorder(root)
        return result.secondMin
    }
    
    func searchBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        if nil == root {
            return nil
        } else{
            let value = (root?.val)!
            if value == val {
                return root
            } else if value < val {
                return searchBST(root?.right, val)
            } else {
                return searchBST(root?.left, val)
            }
        }
    }
    
    func leafSimilar(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
        func inorder1(_ root : TreeNode?,_ leaves: inout [Int]) {
            if nil == root {
                return
            }
            inorder1(root?.left,&leaves)
            if nil == root?.left && nil == root?.right {
                leaves.append((root?.val)!)
            }
            inorder1(root?.right,&leaves)
        }
        
        var tree1Leaves = [Int]()
        var tree2Leaves = [Int]()
        inorder1(root1, &tree1Leaves)
        inorder1(root2, &tree2Leaves)
        
        return tree1Leaves == tree2Leaves
    }
    
    func increasingBST(_ root: TreeNode?) -> TreeNode? {
        if nil == root {
            return nil
        } else {
            let left = root?.left
            let right = root?.right
            
            if nil == left && nil == right {
                return root
            } else {
                let leftResult = increasingBST(left)
                let rightResult = increasingBST(right)
                if nil == left {
                    root?.right = rightResult
                    rightResult?.left = nil
                    root?.left = nil
                    return root
                } else {
                    root?.right = rightResult
                    if nil == left?.right {
                        left?.right = root
                    } else {
                        var temp : TreeNode? = left
                        while nil != temp?.right {
                            temp = temp?.right
                        }
                        temp?.right = root
                    }
                    
                    
                    root?.left = nil
                    leftResult?.left = nil
                    rightResult?.left = nil
                    return leftResult
                }
            }
        }
    }
    
    func isUnivalTree(_ root: TreeNode?) -> Bool {
        if nil == root {
            return true
        }
        if nil == root?.left && nil == root?.right {
            return true
        }
        let left = root?.left
        let right = root?.right
        
        let leftResult = isUnivalTree(root?.left)
        let rightResult = isUnivalTree(root?.right)
        
        if nil == left {
            return rightResult && root?.val == right?.val
        } else if nil == right {
            return leftResult && root?.val == left?.val
        } else {
            return leftResult && root?.val == left?.val && root?.val == right?.val && rightResult
        }
    }
    
    func isCousins(_ root: TreeNode?, _ x: Int, _ y: Int) -> Bool {
        var xParent : TreeNode? = nil
        var yParent : TreeNode? = nil
        if nil == root {
            return false
        }
        
        var nodes = Array<TreeNode?>()
        var parent = Array<TreeNode?>()
        
        parent.append(nil)
        nodes.append(root)
        
        while !nodes.isEmpty {
            let length = nodes.count
            for _ in 0..<length {
                
                let node = nodes.removeFirst()
                let nodeParent = parent.removeFirst()
                
                if x == (node?.val)!{
                    xParent = nodeParent
                }
                if y == (node?.val){
                    yParent = nodeParent
                }
                if nil != node?.left {
                    nodes.append(node?.left)
                    parent.append(node)
                }
                if nil != node?.right {
                    nodes.append(node?.right)
                    parent.append(node)
                }
            }
            if nil != xParent || nil != yParent {
                return nil != xParent && nil != yParent && xParent !== yParent
            }
        }
        return false
    }
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        var result = [[Int]]()
        if nil == root {
            return result
        }
        var nodeQueue = Array<TreeNode?>()
        nodeQueue.append(root)
        var rightDiection = true
        while !nodeQueue.isEmpty {
            let length = nodeQueue.count
            var currentLevel = [Int]()
            for i in 0..<length {
                let node = nodeQueue[length - 1 - i]
                currentLevel.append((node?.val)!)
                if rightDiection {
                    if nil != node?.left {
                        nodeQueue.append(node?.left)
                    }
                    if nil != node?.right {
                        nodeQueue.append(node?.right)
                    }
                } else {
                    if nil != node?.right {
                        nodeQueue.append(node?.right)
                    }
                    if nil != node?.left {
                        nodeQueue.append(node?.left)
                    }
                }
            }
            nodeQueue.replaceSubrange(0..<length, with: [])
            result.append(currentLevel)
            rightDiection = !rightDiection
        }
        return result
    }
    
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        if preorder.isEmpty || inorder.isEmpty {
            return nil
        }
        print("\(preorder)    \(inorder )")
        let rootValue = preorder[0]
        let root : TreeNode? = TreeNode(rootValue)
        if preorder.count != 1 {
            let index = inorder.firstIndex(of: rootValue)!
            let arrs = inorder.split(separator: rootValue)
            
            if 1 == arrs.count {
                let currentPreorder = preorder.suffix(from: 1)
                if index == 0 {
                    //no left tree
                    root?.right = buildTree(Array<Int>(currentPreorder), Array<Int>(arrs[0]))
                } else  {
                    //no right tree
                    root?.left = buildTree(Array<Int>(currentPreorder), Array<Int>(arrs[0]))
                }
            } else {
                let rightPreorder = preorder.suffix(from: index + 1)
                let leftPreorder = preorder[1...(index)]
                root?.left = buildTree(Array<Int>(leftPreorder), Array<Int>(arrs[0]))
                root?.right = buildTree(Array<Int>(rightPreorder), Array<Int>(arrs[1]))
            }
        }
        return root
    }
    
    func buildTree2(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        if postorder.isEmpty || inorder.isEmpty {
            return nil
        }
        let rootValue = postorder.last!
        let root : TreeNode? = TreeNode(rootValue)
        print("\(inorder) \(postorder)")
        if postorder.count != 1 {
            let index = inorder.firstIndex(of: rootValue)!
            let arrs = inorder.split(separator: rootValue)
            
            if 1 == arrs.count {
                let currentPosorder = postorder.prefix(upTo: postorder.count - 1)
                if index == 0 {
                    //no left tree
                    root?.right = buildTree( Array<Int>(arrs[0]),Array<Int>(currentPosorder))
                } else  {
                    //no right tree
                    root?.left = buildTree( Array<Int>(arrs[0]),Array<Int>(currentPosorder))
                }
            } else {
                let rightPosorder = postorder[(index + 1)...(postorder.count - 2)]
                let leftPosorder = postorder.prefix(upTo: index)
                root?.left = buildTree( Array<Int>(arrs[0]),Array<Int>(leftPosorder))
                root?.right = buildTree(Array<Int>(arrs[1]),Array<Int>(rightPosorder))
            }
        }
        return root
    }
}




