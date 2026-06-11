    //https://leetcode.cn/problems/maximum-total-subarray-value-ii/
typealias MaxAndMin = (maxV:Int,minV:Int)
class SegmentTreeByArray2 {
    private var tree: [MaxAndMin]
    private let n: Int

    init(_ nums: [Int]) {
        self.n = nums.count
        self.tree = [MaxAndMin](repeating: (Int.min,Int.max), count: n * 4)
        if n > 0 {
            build(1, 0, n - 1, nums)
        }
    }

        // 构建线段树
    private func build(_ node: Int, _ l: Int, _ r: Int, _ nums: [Int]) {
        if l == r {
            tree[node] = (nums[l],nums[l])
            return
        }
        let mid = (l + r) >> 1
        build(node << 1, l, mid, nums)
        build(node << 1 | 1, mid + 1, r, nums)
            //        tree[node] = tree[node << 1] + tree[node << 1 | 1]
        tree[node] = (max(tree[node << 1].maxV,tree[node << 1 | 1].maxV),min(tree[node << 1].minV,tree[node << 1 | 1].minV))
    }
    func query(_ left: Int, _ right: Int) -> MaxAndMin {
        return query(1, 0, n - 1, left, right)
    }

    private func query(_ node: Int, _ l: Int, _ r: Int, _ ql: Int, _ qr: Int) -> MaxAndMin {
        if ql <= l && r <= qr {
            return tree[node]
        }
        let mid = (l + r) >> 1
        var res:MaxAndMin = (Int.min,Int.max)
        if ql <= mid {
            let t = query(node << 1, l, mid, ql, qr)
            res.maxV = max(res.maxV, t.maxV)
            res.minV = min(res.minV,t.minV)
        }
        if qr > mid {
            let t = query(node << 1 | 1, mid + 1, r, ql, qr)
            res.maxV = max(res.maxV, t.maxV)
            res.minV = min(res.minV,t.minV)
        }
        return res
    }
}

class Solution {
    private struct RowAndBigDiff: Comparable{
        static func < (lhs: Solution.RowAndBigDiff, rhs: Solution.RowAndBigDiff) -> Bool {
            return lhs.diff < rhs.diff
        }

        var r: Int
        var c: Int
        var diff: Int
    }
    func maxTotalValue(_ nums: [Int], _ k: Int) -> Int {
        let st = SegmentTreeByArray2(nums)
        let N = nums.count
        var maxHeap = Heap<RowAndBigDiff>()
        for l in 0..<N {
            let (mx,mn) = st.query(l, N - 1)
            maxHeap.insert(RowAndBigDiff(r: l,c:N - 1, diff: mx - mn))
        }
        var sb = 0
        for _ in 0..<k {
            if let t = maxHeap.popMax() {
                if t.diff == 0 {break}
                sb += t.diff
                if t.c >= 1 {
                    let (mx,mn) = st.query(t.r,t.c - 1)
                    maxHeap.insert(RowAndBigDiff(r: t.r,c: t.c - 1,diff: mx - mn))
                }
            }
        }
        return sb
    }
}
