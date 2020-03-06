// https://leetcode.com/problems/range-sum-query-mutable/
 class NumArray2 {
    
    private var numbers: [Int]
    private var prefix = [Int]()
    private var needUpdatePrefix = false
    init(_ nums: [Int]) {
        numbers = nums
        prefix = Array<Int>(repeating: 0, count: nums.count + 1)
        for i in 0..<nums.count {
            prefix[i + 1] = prefix[i] + nums[i]
        }
    }
    
    func update(_ i: Int, _ val: Int) {
        numbers[i] = val
        needUpdatePrefix = true
    }
    
    func sumRange(_ i: Int, _ j: Int) -> Int {
        if needUpdatePrefix {
            for j in 0..<numbers.count {
                prefix[j + 1] = prefix[j] + numbers[j]
            }
            needUpdatePrefix = false
        }
        return prefix[j + 1] - prefix[i]
    }
 }
 class SegmentTree {
    private var head: SegmentTreeNode?
    class SegmentTreeNode {
        public var start: Int
        public var end: Int
        public var left: SegmentTreeNode?
        public var right: SegmentTreeNode?
        public var val: Int
        init(_ start: Int, _ end: Int, _  val: Int) {
            self.start = start
            self.end = end
            self.val = val
            self.left = nil
            self.right = nil
        }
    }
    init(_ arr: [Int]) {
        self.head = build(arr)
    }
    public func build(_ arr: [Int]) -> SegmentTreeNode? {
        return buildHelper(0, arr.count - 1, arr)
    }
    private func buildHelper(_ left: Int, _ right: Int, _ arr: [Int]) -> SegmentTreeNode? {
        guard left <= right else {
            return nil
        }
        let root = SegmentTreeNode(left, right, arr[left])
        guard left != right else {
            return root
        }
        let mid = left + (right - left) >> 1
        root.left = buildHelper(left, mid, arr)
        root.right = buildHelper(mid + 1, right, arr)
        //更新数据
        root.val = (root.left?.val ?? 0) + (root.right?.val ?? 0)
        return root
    }
    
    private func update(_ root: SegmentTreeNode?, _ index: Int, _ val: Int) {
        
        guard let root = root else {return}
        if root.start == root.end && root.start == index {
            root.val = val
            return
        }
        let mid = (root.start + root.end) >> 1
        if index <= mid {
            update(root.left, index, val)
        } else {
            update(root.right, index, val)
        }
        root.val = (root.left?.val ?? 0) + (root.right?.val ?? 0)
        return
    }
    
    private func query(_ root: SegmentTreeNode?, _ start: Int, _ end: Int) -> Int {
        guard let root = root else {
            return -1
        }
        if root.start == start && root.end == end {
            return root.val
        }
        let mid = (root.start + root.end) >> 1
        if mid >= end {
            return query(root.left, start, end)
        }
        if mid < start {
            return query(root.right, start, end)
        }
        var ans = 0
        ans += query(root.left, start, mid)
        ans += query(root.right, mid + 1, end)
        return ans
    }
    public func update(_ index: Int, _ val: Int) {
        update(head, index, val)
    }
    public func query(_ start: Int, _ end: Int) -> Int {
        return query(head, start, end)
    }
 }
 
 
 
 class NumArray1 {
    var segmentTree: SegmentTree
    init(_ nums: [Int]) {
        segmentTree = SegmentTree(nums)
    }
    
    func update(_ i: Int, _ val: Int) {
        segmentTree.update(i, val)
    }
    
    func sumRange(_ i: Int, _ j: Int) -> Int {
        return segmentTree.query(i, j)
    }
 }
 
 class NumArray {
    private var tree: [Int]
    private let N: Int
    init(_ nums: [Int]) {
        N = nums.count
        tree = Array<Int>(repeating: 0, count: N )
        tree.append(contentsOf: nums)
        if N > 1 {
            for i in (1..<N).reversed() {
                tree[i] = tree[i << 1] + tree[i << 1 + 1]
            }
        }
    }
    
    func update(_ i: Int, _ val: Int) {
        var p = i + N
        tree[p] = val
        while p > 0 {
            tree[p >> 1] = tree[p] + tree[p + (p % 2 == 0 ? 1 : -1) ]
            p >>= 1
        }
    }
    
    func sumRange(_ i: Int, _ j: Int) -> Int {
        
        var left = i + N
        var right = j + N
        var sum = 0
        
        while left <= right {
            if left % 2 == 1 {
                sum += tree[left]
                left += 1
            }
            if right % 2 == 0 {
                sum += tree[right]
                right -= 1
            }
            left >>= 1
            right >>= 1
        }
        return sum
    }
 }
