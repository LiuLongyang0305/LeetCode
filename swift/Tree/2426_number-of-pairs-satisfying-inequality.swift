 // https://leetcode.com/problems/number-of-pairs-satisfying-inequality/
class SegmentTreeNode {

    var leftBound: Int
    var rightBound: Int
    var totalCnt: Int
    
    var leftChild: SegmentTreeNode?
    var rightChild: SegmentTreeNode?

    init(_ l: Int, _ r: Int) {
        self.leftBound = l
        self.rightBound = r
        self.totalCnt = 0
    }

    func pushDown() {
        let mid = (leftBound + rightBound) / 2
        if nil == leftChild {
            leftChild = SegmentTreeNode(leftBound, mid)
        }
        if nil == rightChild {
            rightChild = SegmentTreeNode(mid + 1, rightBound)
        }
    }


    func  pushUp() {
        self.totalCnt = (leftChild?.totalCnt ?? 0) + (rightChild?.totalCnt ?? 0)
    }


    func update(_ l: Int, _ r: Int, _ val: Int) {
        if leftBound == l && rightBound == r {
            totalCnt += 1
            return
        }
        pushDown()
        let mid = (leftBound + rightBound) >> 1
        if r <= mid {
            leftChild?.update(l, r, val)
        } else if l > mid {
            rightChild?.update(l, r, val)
        } else {
            leftChild?.update(l, mid, val)
            rightChild?.update(mid + 1, r, val)
        }
        pushUp()
    }



    func query(_ l: Int, _ r: Int) -> Int {
        if l == leftBound && r == rightBound {
            return totalCnt
        }
        let mid = (leftBound + rightBound) >> 1
        if r <= mid {
            return leftChild?.query(l, r) ?? 0
        } else if l > mid {
            return rightChild?.query(l, r) ?? 0
        } else {
            return (leftChild?.query(l, mid) ?? 0) +  (rightChild?.query(mid + 1, r) ?? 0)
        }

    }
}
class Solution {
    private let INF = 100000
    func numberOfPairs(_ nums1: [Int], _ nums2: [Int], _ diff: Int) -> Int {
        let N = nums1.count
        let diffs = (0..<N).map { nums1[$0] - nums2[$0] + INF}
        // print(diffs)
        let rightBound = diffs.max()!
        let leftBound = diffs.min()!
        let st = SegmentTreeNode(leftBound, rightBound)
        var ans = 0
        for idx in stride(from: N - 1, through: 0, by: -1) {
            let lb = diffs[idx] - diff
            if lb <= rightBound {
                ans += st.query(max(leftBound,lb), rightBound)
            }
            st.update(diffs[idx], diffs[idx], 1)
        }
        return ans
    }
}
