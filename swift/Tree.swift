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

//Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

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

func flatten(_ root: TreeNode?) {
    if nil == root || (nil == root?.left && nil == root?.right){
        return
    }
    let left = root?.left
    let right = root?.right
    if nil == left || nil == right {
        if nil == left {
            flatten(right)
        } else {
            flatten(left)
            root?.right = left
            root?.left = nil
        }
    } else {
        flatten(left)
        flatten(right)
        root?.right = left
        root?.left = nil
        var temp : TreeNode? = left
        while nil != temp?.right {
            temp = temp?.right
        }
        temp?.right = right
        temp?.left = nil
    }
}

func rightSideView(_ root: TreeNode?) -> [Int] {
    var result = Array<Int>()
    if nil != root {
        var nodes = Array<TreeNode?>()
        nodes.append(root)
        while !nodes.isEmpty {
            result.append(nodes.last!!.val)
            let length = nodes.count
            for _ in 0..<length {
                let temp : TreeNode = nodes.remove(at: 0)!
                if nil != temp.left{
                    nodes.append(temp.left)
                }
                if nil != temp.right {
                    nodes.append(temp.right)
                }
            }
        }
    }
    return result
}

func countNodes(_ root: TreeNode?) -> Int {
    func getTreeHeight(_ root : TreeNode?,_ isLeftTree : Bool) -> Int {
        if nil == root {
            return 0
        }
        var temp : TreeNode? = root
        var count : Int = 0
        while nil != temp {
            count += 1
            temp = isLeftTree ? temp?.left : temp?.right
        }
        return count
    }
    return 0
}

func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
    var nodeValues = [Int]()
    var nodeStack = Array<TreeNode?>()
    var temp = root
    while nil != temp || !nodeStack.isEmpty && nodeValues.count < k{
        if nil != temp {
            nodeStack.append(temp)
            temp = temp?.left
        } else {
            temp = nodeStack.popLast()!!
            nodeValues.append((temp?.val)!)
            temp = temp?.right
        }
    }
    return nodeValues.last!
}

func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
    func increasingBST2(_ root: TreeNode?) -> TreeNode? {
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
    
    if nil == root {
        return nil
    }
    if (root?.val)! == key {
        let left = root?.left
        let right = root?.right
        if nil == left && nil == right {
            return nil
        } else {
            if nil == left {
                return right
            } else if nil == right {
                return left
            } else {
                let node = increasingBST2(right)
                node?.left = left
                return node
            }
        }
    } else {
        if key < (root?.val)!{
            root?.left = deleteNode(root?.left, key)
        } else {
            root?.right = deleteNode(root?.right, key)
        }
        return root
    }
}

func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
    if nil == root {
        return 0
    }
    var maxLength = 0;
    func getDepth(_ root : TreeNode?) -> Int{
        if root == nil {
            return 0
        } else {
            let left = getDepth(root?.left)
            let right = getDepth(root?.right)
            let len = 1 + left + right
            if len > maxLength {
                maxLength = len
            }
            return 1 + max(left, right)
        }
    }
    getDepth(root)
    return maxLength - 1
}

func addOneRow(_ root: TreeNode?, _ v: Int, _ d: Int) -> TreeNode? {
    var queue = Array<TreeNode?>()
    guard nil != root else {
        return root
    }
    //add row in front of the root
    guard 1 != d else {
        let node : TreeNode? = TreeNode(v)
        node?.left = root
        return node
    }
    queue.append(root)
    var index = 1
    while !queue.isEmpty && index < d - 1 {
        let length = queue.count
        for _ in 0..<length {
            let temp = queue.removeFirst()
            
            if nil != temp?.left{
                queue.append(temp?.left)
            }
            if nil != temp?.right {
                queue.append(temp?.right)
            }
        }
        index += 1
    }
    for node in queue{
        //            var node = queue.removeFirst()
        let left = node?.left
        let right = node?.right
        node?.left = TreeNode(v)
        node?.left?.left = left
        node?.right = TreeNode(v)
        node?.right?.right = right
    }
    return root
}


func constructMaximumBinaryTree(_ nums: [Int]) -> TreeNode? {
    guard 0 != nums.count   else {
        return nil
    }
    guard 1 != nums.count else {
        return TreeNode(nums[0])
    }
    var root : TreeNode? = nil
    let maxValue : Int = nums.max()!
    root = TreeNode(maxValue)
    let subTreeNums = nums.split(separator: maxValue)
    guard 1 != subTreeNums.count else {
        let subNums = Array<Int>(subTreeNums[0])
        if nums[0] == maxValue {
            root?.right = constructMaximumBinaryTree(subNums)
        } else {
            root?.left = constructMaximumBinaryTree(subNums)
        }
        return root
    }
    root?.left = constructMaximumBinaryTree(Array<Int>(subTreeNums[0]))
    root?.right = constructMaximumBinaryTree(Array<Int>(subTreeNums[1]))
    return root
}
func widthOfBinaryTree(_ root: TreeNode?) -> Int {
    class AnnotatedNode {
        var node : TreeNode?
        var depth : Int
        var pos : Int
        init(_ node : TreeNode?, _ depth : Int,_ pos: Int) {
            self.node = node
            self.depth = depth
            self.pos = pos
        }
    }
    if nil == root {
        return 0
    }
    var ans : Int = 0
    var nodesQueue = Array<AnnotatedNode>()
    nodesQueue.append(AnnotatedNode(root,0,0))
    var curDepth : Int  = 0
    var left : Int  = 0
    while !nodesQueue.isEmpty {
        let annotatedNode = nodesQueue.removeFirst()
        if nil != annotatedNode.node{
            nodesQueue.append(AnnotatedNode(annotatedNode.node?.left,annotatedNode.depth + 1,annotatedNode.pos * 2 + 1))
            nodesQueue.append(AnnotatedNode(annotatedNode.node?.right,annotatedNode.depth + 1,annotatedNode.pos * 2 + 1))
            if curDepth != annotatedNode.depth {
                curDepth = annotatedNode.depth
                left = annotatedNode.pos
            }
            ans = max(ans, annotatedNode.pos - left + 1)
        }
    }
    return ans
}

func insertIntoBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
    if nil == root {
        return TreeNode(val)
    }
    var temp : TreeNode? = root
    while nil != temp {
        let isLeft = (temp?.val)! > val
        if isLeft {
            if nil == temp?.left {
                temp?.left = TreeNode(val)
                temp = nil
            } else {
                temp = temp?.left
            }
        } else {
            if nil == temp?.right {
                temp?.right = TreeNode(val)
                temp = nil
            } else {
                temp = temp?.right
            }
        }
    }
    return root
}

func pruneTree(_ root: TreeNode?) -> TreeNode? {
    func getSubTreeSum(_ root : TreeNode?) -> Int {
        if nil == root?.left && nil == root?.right {
            return (root?.val)!
        }
        let left : TreeNode? = root?.left
        let right : TreeNode? = root?.right
        var leftSubTreeSum = 0
        var rightSubTreeSum = 0
        if nil != left{
            leftSubTreeSum = getSubTreeSum(left)
            if 0 == leftSubTreeSum {
                root?.left = nil
            }
        }
        if nil != right{
            rightSubTreeSum = getSubTreeSum(right)
            if 0 == rightSubTreeSum {
                root?.right = nil
            }
        }
        return (root?.val)! + leftSubTreeSum + rightSubTreeSum
    }
    if nil == root {
        return nil
    }
    if nil == root?.left && nil == root?.right && 0 == (root?.val)!{
        return nil
    }
    getSubTreeSum(root)
    return root
}
func pruneTree2(_ root: TreeNode?) -> TreeNode? {
    func containsNodesOne(_ root : TreeNode?) -> Bool {
        if nil == root {
            return false
        }
        let left = containsNodesOne(root?.left)
        let right = containsNodesOne(root?.right)
        if !left {
            root?.left = nil
        }
        if !right {
            root?.right = nil
        }
        return 1 == (root?.val)! || left || right
    }
    return containsNodesOne(root) ? root : nil
}

func flipEquiv(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
    if nil == root1 && nil == root2 {
        return true
    }
    if nil == root1 || nil == root2 || root2?.val != root1?.val {
        return false
    }
    
    return (flipEquiv(root1?.left,root2?.left) && flipEquiv(root1?.right,root2?.right)) || (flipEquiv(root1?.left,root2?.right) && flipEquiv(root1?.right,root2?.left))
}

func isCompleteTree(_ root: TreeNode?) -> Bool {
    if nil == root {
        return true
    }
    class AnnonatedNode{
        var node : TreeNode?
        var position : Int
        init(_ node : TreeNode?,_ position : Int) {
            self.node = node
            self.position = position
        }
    }
    var nodes = Array<AnnonatedNode?>()
    nodes.append(AnnonatedNode(root,1))
    var i : Int = 0
    while i < nodes.count {
        let node = nodes[i]
        i = i + 1
        if nil != node?.node {
            nodes.append(AnnonatedNode(node?.node?.left,2 * (node?.position)!))
            nodes.append(AnnonatedNode(node?.node?.right,2 * (node?.position)! + 1))
        }
    }
    return nodes[i - 1]?.position == nodes.count
}

func isCompleteTree2(_ root: TreeNode?) -> Bool {
    if nil == root {
        return true
    }
    var nodes = Array<TreeNode?>()
    nodes.append(root)
    var result = true
    var existNilNode = false
    while !nodes.isEmpty && result {
        let length = nodes.count
        for _ in 0..<length{
            let node = nodes.removeFirst()
            if nil != node {
                nodes.append(node?.left)
                nodes.append(node?.right)
            } else {
                existNilNode = true
            }
        }
        let firstNilIndex = nodes.firstIndex {nil == $0}
        let lastNodeindex = nodes.lastIndex { nil != $0}
        result = existNilNode ? (nil == lastNodeindex)  : (nil == firstNilIndex || nil == lastNodeindex || firstNilIndex! > lastNodeindex!)
    }
    return result
}
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
func smallestFromLeaf(_ root: TreeNode?) -> String {
    let chars = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
    func travelersal(_ root : TreeNode?) -> String {
        if nil == root {
            return ""
        }
        let left = root?.left
        let right = root?.right
        let rootStr = chars[(root?.val)!]
        if nil == left && nil == right {
            return rootStr
        } else  {
            var leftResult = ""
            var rightResult = ""
            if nil == left || nil == right{
                let target = nil == left ? right : left
                leftResult  = travelersal(target?.left)
                rightResult = travelersal(target?.right)
                if leftResult == "" || rightResult == "" {
                    return (leftResult == "" ? rightResult : leftResult ) + chars[(target?.val)!] + rootStr
                } else {
                    leftResult += chars[(target?.val)!] + rootStr
                    rightResult += chars[(target?.val)!] + rootStr
                    return leftResult < rightResult ? leftResult : rightResult
                }
                
            } else {
                leftResult = travelersal(left) + rootStr
                rightResult = travelersal(right) + rootStr
            }
            return leftResult < rightResult ? leftResult : rightResult
        }
    }
    return travelersal(root)
}

func sortedListToBST(_ head: ListNode?) -> TreeNode? {
    if nil == head {
        return nil
    }
    if nil == head?.next {
        return TreeNode((head?.val)!)
    }
    var fast : ListNode? = head
    var slow : ListNode? = head
    var pre : ListNode? = nil
    while nil != fast && nil != fast?.next{
        pre = nil == pre ? head : slow
        slow = slow?.next
        fast = fast?.next?.next
    }
    let root : TreeNode? = TreeNode((slow?.val)!)
    pre?.next = nil
    root?.left = sortedListToBST(head)
    root?.right = sortedListToBST(slow?.next)
    return root
}

func findMode(_ root: TreeNode?) -> [Int] {
    var dic = Dictionary<Int,Int>()
    func inorder(_ root : TreeNode?){
        if nil == root {
            return
        }
        inorder(root?.left)
        if nil == dic[(root?.val)!] {
            dic[(root?.val)!] = 1
        } else {
            dic[(root?.val)!] = dic[(root?.val)!]! + 1
        }
        inorder(root?.right)
    }
    var result = [Int]()
    if nil == root {
        return result
    }
    if nil == root?.left && nil == root?.right {
        result.append((root?.val)!)
        return result
    }
    inorder(root)
    var max : Int = 0
    for (key,value) in dic {
        if value > max {
            max = value
            result.removeAll()
            result.append(key)
        } else if value == max {
            result.append(key)
        }
    }
    let temp = dic.filter { $0.value == max}
    result.append(contentsOf: temp.keys)
    return result
}

func isValidBST(_ root: TreeNode?) -> Bool {
    if nil == root{
        return true
    }
    func isBSTHelper(_ root : TreeNode?,_ lowerLimit:Int?,_ upperLimit : Int?) -> Bool {
        if nil != lowerLimit && (root?.val)! <= lowerLimit!{
            return false
        }
        if nil != upperLimit && (root?.val)! >= upperLimit! {
            return false
        }
        let left = nil != root?.left ? isBSTHelper(root?.left, lowerLimit, root?.val) : true
        if left {
            let right = nil != root?.right ? isBSTHelper(root?.right, root?.val, upperLimit) : true
            return right
        } else {
            return false
        }
    }
    return isBSTHelper(root, nil, nil)
}

func isValidBST2(_ root: TreeNode?) -> Bool {
    var result = true
    var preValue : Int? = nil
    func inorder(_ root : TreeNode?) {
        if result {
            if nil == root {
                return
            }
            inorder(root?.left)
            if nil != preValue {
                if (root?.val)! <= preValue! {
                    result  = false
                }
            }
            preValue = root?.val
            inorder(root?.right)
        }
    }
    inorder(root)
    return result
}

class BSTIterator {
    var stack : Array<TreeNode?> = []
    init(_ root: TreeNode?) {
        addElements(root)
    }
    
    /** @return the next smallest number */
    func next() -> Int {
        let node = stack.popLast()!
        addElements(node?.right)
        return (node?.val)!
    }
    
    /** @return whether we have a next smallest number */
    func hasNext() -> Bool {
        return !stack.isEmpty
    }
    func addElements(_ root : TreeNode?)  {
        if nil != root {
            var temp : TreeNode? = root
            while nil != temp {
                stack.append(temp)
                temp = temp?.left
            }
        }
    }
    
}
func recoverTree(_ root: TreeNode?) {
    var pre : TreeNode? = nil
    var disorderNodes = Array<(TreeNode,TreeNode)>()
    func inorder(_ root : TreeNode?){
        guard let node = root else {
            return
        }
        inorder(node.left)
        if let preNode = pre, preNode.val > node.val {
            disorderNodes.append((preNode,node))
        }
        pre = node
        inorder(node.right)
    }
    inorder(root)
    let wrondNode1 = disorderNodes.first!.0
    let wrondNode2 = disorderNodes.last!.1
    (wrondNode1.val,wrondNode2.val) = (wrondNode2.val,wrondNode1.val)
}

class CBTInserter {
    var root : TreeNode?
    var unCompleteNodes = Array<TreeNode?>()
    init(_ root: TreeNode?) {
        self.root = root
        travelVerse(root)
    }
    
    func insert(_ v: Int) -> Int {
        let parent : TreeNode? = unCompleteNodes.first!
        let node = TreeNode(v)
        if nil == parent?.left {
            parent?.left = node
        } else {
            parent?.right = node
            unCompleteNodes.removeFirst()
        }
        unCompleteNodes.append(node)
        return (parent?.val)!
    }
    
    func get_root() -> TreeNode? {
        return root
    }
    
    func travelVerse(_ root: TreeNode?)  {
        if nil == root {
            return
        }
        var nodesQueue = Array<TreeNode?>()
        nodesQueue.append(root)
        while !nodesQueue.isEmpty {
            let length = nodesQueue.count
            for _ in 0..<length {
                let temp = nodesQueue.removeFirst()
                if nil == temp?.left || nil == temp?.right{
                    unCompleteNodes.append(temp)
                }
                if nil != temp?.left{
                    nodesQueue.append(temp?.left)
                }
                if nil != temp?.right{
                    nodesQueue.append(temp?.right)
                }
            }
        }
    }
}
func convertBSTRecursion(_ root: TreeNode?) -> TreeNode? {
    var sum : Int = 0
    func convertBSTInternal(_ root : TreeNode?) -> TreeNode?{
        guard let node = root else {
            return nil
        }
        convertBSTInternal(node.right)
        sum += node.val
        node.val = sum
        convertBSTInternal(node.left)
        return root
    }
    return convertBSTInternal(root)
}

func convertBSTIteration(_ root : TreeNode?)-> TreeNode? {
    if nil != root {
        var temp : TreeNode? = root
        var sum : Int = 0
        var stack = Array<TreeNode?>()
        while !stack.isEmpty || nil != temp {
            while nil != temp {
                stack.append(temp)
                temp = temp?.right
            }
            temp = stack.removeLast()
            sum += (temp?.val)!
            temp?.val = sum
            temp = temp?.left
        }
    }
    return root
}

    func pathSumRecursionQ113(_ root: TreeNode?, _ sum: Int) -> [[Int]] {
        guard let root = root else{
            return []
        }
        let remaining = sum - root.val
        if nil == root.left && nil == root.right {
            return remaining == 0 ? [[root.val]] : []
        } else {
            let children = pathSumRecursionQ113(root.left, remaining) + pathSumRecursionQ113(root.right, remaining)
            return children.map{[root.val] + $0}
        }
    }
    
    func pathSumIterationQ113(_ root: TreeNode?, _ sum: Int) -> [[Int]] {
        var result = [[Int]]()
        var currentpath = [Int]()
        func dfs(_ root: TreeNode?,_ sum:  Int ) {
            if nil == root{
                return
            }
            let remaining = sum - (root?.val)!
            currentpath.append((root?.val)!)
            if nil == root?.left && nil == root?.right{
                if 0 == remaining {
                    result.append(currentpath)
                }
            }
            
            if nil != root?.left{
                dfs(root?.left, remaining)
            }
            
            if nil != root?.right {
                dfs(root?.right, remaining)
            }
            currentpath.removeLast()
        }
        dfs(root,sum)
        return result
    }

func sumNumbers(_ root: TreeNode?) -> Int {
    var sum = 0
    var currentPathSum = 0
    func dfs(_ root : TreeNode?) {
        if nil == root {
            return
        }
        currentPathSum = 10 * currentPathSum + (root?.val)!
        if nil == root?.left && nil == root?.right {
            sum += currentPathSum
        }
        if nil != root?.left {
            dfs(root?.left)
        }
        if nil != root?.right {
            dfs(root?.right)
        }
        currentPathSum = (currentPathSum - (root?.val)!) / 10
    }
    dfs(root)
    return sum
}

