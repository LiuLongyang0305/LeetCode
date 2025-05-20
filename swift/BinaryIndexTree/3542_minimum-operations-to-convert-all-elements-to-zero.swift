//https://leetcode.com/problems/minimum-operations-to-convert-all-elements-to-zero/
class SegmentTreeNode {
    var leftNode: SegmentTreeNode?
    var rightNode: SegmentTreeNode?
    var val: Int
    var l: Int
    var r: Int
    var indices: [Int]
    init(leftNode: SegmentTreeNode? = nil, rightNode: SegmentTreeNode? = nil, val: Int, l: Int, r: Int, indices: [Int] = []) {
        self.leftNode = leftNode
        self.rightNode = rightNode
        self.val = val
        self.l = l
        self.r = r
        self.indices = indices
    }
}

func buildTree(_ l: Int, _ r: Int, _ nums:[Int]) -> SegmentTreeNode {
    guard l < r  else {
        return SegmentTreeNode(leftNode: nil, rightNode: nil, val: nums[l], l: l, r: r,indices: [l])
    }
    let root = SegmentTreeNode(val: Int.max, l: l, r: r)
    root.leftNode = buildTree(l, (l + r) / 2, nums)
    root.rightNode = buildTree((l + r) / 2 + 1, r, nums)
    let lmin = root.leftNode?.val ?? Int.max
    let rMin = root.rightNode?.val ?? Int.max
    root.val = min(lmin,rMin)
    if root.val == lmin {
        root.indices += root.leftNode?.indices ?? []
    }
    if root.val == rMin {
        root.indices += root.rightNode?.indices ?? []
    }
    return root
}

func query(_ l: Int, _ r: Int,_ node: SegmentTreeNode?) -> (Int, [Int]) {
    guard let node = node else {return (Int.max,[])}
    if node.l == l && node.r == r {
        return (node.val,node.indices)
    }

    let mid = (node.l + node.r) / 2
    if r <= mid {
        return query(l, r, node.leftNode)
    } else if l >= mid + 1 {
        return query(l, r, node.rightNode)
    } else {
        let (lmin,indices1) = query(l, mid, node.leftNode)
        let (rmin,indices2) =  query(mid + 1, r, node.rightNode)
        let minVal = min(lmin,rmin)
        var indices:[Int] = []
        if lmin == minVal {
            indices += indices1
        }
        if rmin == minVal {
            indices += indices2
        }
        return (minVal,indices)
    }
}


class Solution {
    func minOperations(_ nums: [Int]) -> Int {

        let N = nums.count
        let SegmentTree = buildTree(0, N - 1, nums)
        func dfs(_ l: Int,_ r: Int) -> Int {
            guard r > l else {
                return nums[r] == 0 ? 0 : 1
            }
            let (miVal,indices) = query(l, r, SegmentTree)
            var ans = miVal == 0 ? 0 : 1
            if l < indices[0] {
                ans += dfs(l, indices[0] - 1)
            }
            if r > indices.last! {
                ans += dfs(indices.last! + 1, r)
            }
            if indices.count > 1 {
                for j in 1..<indices.count {
                    let (nl,nr) = (indices[j - 1] + 1, indices[j] - 1)
                    if nl <= nr {
                        ans += dfs(nl, nr)
                    }
                }
            }
            return ans
        }


        return dfs(0,  N - 1)

    }


}