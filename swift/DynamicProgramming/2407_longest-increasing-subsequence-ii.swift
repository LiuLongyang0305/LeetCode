// https://leetcode.com/problems/longest-increasing-subsequence-ii/
class SegmentTreeNode {

    var leftBound: Int
    var rightBound: Int
    var maxLength: Int
    
    var leftChild: SegmentTreeNode?
    var rightChild: SegmentTreeNode?

    init(_ l: Int, _ r: Int) {
        self.leftBound = l
        self.rightBound = r
        self.maxLength = 0
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
        self.maxLength = max((leftChild?.maxLength ?? 0),(rightChild?.maxLength ?? 0))
    }


    func update(_ l: Int, _ r: Int, _ val: Int) {
        if leftBound == l && rightBound == r {
            maxLength = max(maxLength, val)
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
            return maxLength
        }
        let mid = (leftBound + rightBound) >> 1
        if r <= mid {
            return leftChild?.query(l, r) ?? 0
        } else if l > mid {
            return rightChild?.query(l, r) ?? 0
        } else {
            return max(leftChild?.query(l, mid) ?? 0, rightChild?.query(mid + 1, r) ?? 0)
        }

    }
}
class Solution {
    func lengthOfLIS(_ nums: [Int], _ k: Int) -> Int {
        guard nums.count > 1 else {
            return nums.count
        }
        let minEle = nums.min()!
        let maxEle = nums.max()!
        guard minEle != maxEle else {return 1}

        var ans = 1
        let segmentTree = SegmentTreeNode(minEle, maxEle)

        for num in nums {
            let lb = max(minEle, num - k)
            let rb = num - 1
            let ml = segmentTree.query(lb, rb) + 1
            ans = max(ans, ml)
            segmentTree.update(num,num , ml)
        }
        return ans
    }
}