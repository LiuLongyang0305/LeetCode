class SegmentTree {
    class SegmentTreeNode {
        var leftIdx: Int
        var rightIdx: Int
        var maxVal: Int
        var minVal: Int
        var left: SegmentTreeNode?
        var right: SegmentTreeNode?
        var description: String {
            get {
                return "l = \(leftIdx) r = \(rightIdx) max = \(maxVal)  min = \(minVal)"
            }
        }
        init(_ leftIdx: Int, _ rightIdx: Int,_ maxVal: Int = Int.min, _ minVal: Int = Int.max) {
            self.leftIdx = leftIdx
            self.rightIdx = rightIdx
            self.maxVal = maxVal
            self.minVal = minVal
        }
    }
    
    var root: SegmentTreeNode? = nil
    private var data: [Int] = []
    private var queryResults: [[Int]:QueryResult] = [:]

    init(_ arr: [Int]) {
        self.data = arr
        self.root = buildTree(0, arr.count - 1)
        //        show(root)
    }
    private func buildTree(_ l: Int,_ r: Int) -> SegmentTreeNode? {
        guard l <= r else {
            return nil
        }
        let node = SegmentTreeNode(l, r)
        guard l < r else {
            node.maxVal = data[l]
            node.minVal = data[l]
            queryResults[[l,r]] = (data[l],data[l])
            return node
        }
        let mid = l + (r - l) >> 1
        node.left = buildTree(l, mid)
        node.right = buildTree(mid + 1, r)
        node.maxVal = max(node.left?.maxVal ?? Int.min, node.right?.maxVal ?? Int.min)
        node.minVal = min(node.left?.minVal ?? Int.max, node.right?.minVal ?? Int.max)
        queryResults[[l,r]] = (node.maxVal,node.minVal)
        return node
    }
    
    private func show(_ root: SegmentTreeNode?) {
        guard let r = root else {
            return
        }
        print(r.description)
        show(r.left)
        show(r.right)
    }
    
    func query(_ l: Int,_ r: Int, _ rootNode: SegmentTreeNode?) -> QueryResult? {
        guard let root = rootNode else {
            return nil
        }
        if let ans = queryResults[[l,r]] {
            return ans
        }
        guard l != root.leftIdx || r != root.rightIdx else {
            return (root.maxVal,root.minVal)
        }
        let mid = root.leftIdx + (root.rightIdx - root.leftIdx) >> 1
//        print("l = \(l) r = \(r)  mid = \(mid) node = \(root.description)")
        
        if r <= mid {
            return query(l, r, root.left)
        }
        if l > mid {
            return query(l, r, root.right)
        }
        if let leftRes = query(l, mid, root.left), let rightRes = query(mid + 1, r, root.right) {
            let result = (max(rightRes.maxVal, leftRes.maxVal),min(rightRes.minVal, leftRes.minVal))
            queryResults[[l,r]] = result
            return result
        }
        return nil
    }
}
