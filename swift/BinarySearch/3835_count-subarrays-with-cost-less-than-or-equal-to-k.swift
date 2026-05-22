    //https://leetcode.cn/problems/count-subarrays-with-cost-less-than-or-equal-to-k/
class Solution {
    func countSubarrays(_ nums: [Int], _ k: Int) -> Int {
        let N = nums.count
        let segmentTree = SegmentTreeByArray(nums)
        func check(_ l: Int, _ r: Int) -> Bool {
            let (maxV,minV) = segmentTree.query(l, r)
            let cost = (maxV - minV) * (r - l + 1)
            return cost <= k
        }


        func binarySearch(_ left: Int) -> Int {
            var l = left
            var r = N - 1

            while l < r {
                let mid = (l + r + 1) >> 1

                if check(left, mid) {
                    l = mid
                } else {
                    r = mid - 1
                }
            }
            return l
        }


        var sb = 0
        for l in 0..<N {
                //找到以l为左边界，最后一个满足要求的r
            sb += binarySearch(l) - l + 1
        }
        return sb
    }
}

class SegmentTreeByArray {
    private var maxTree: [Int]
    private var minTree: [Int]
    private let n: Int

    init(_ nums: [Int]) {
        n = nums.count
            // 线段树数组大小通常为 4n（足够容纳所有节点）
        maxTree = Array(repeating: Int.min, count: 4 * n)
        minTree = Array(repeating: Int.max, count: 4 * n)
        build(nums, 1, 0, n - 1) // 根节点索引为1
    }

        // 构建线段树（递归辅助函数）
    private func build(_ nums: [Int], _ idx: Int, _ left: Int, _ right: Int) {
        if left == right {
            maxTree[idx] = nums[left]
            minTree[idx] = nums[left]
            return
        }
        let mid = (left + right) / 2
        build(nums, idx * 2, left, mid)       // 左子树
        build(nums, idx * 2 + 1, mid + 1, right) // 右子树

            // 合并左右子树的结果
        maxTree[idx] = max(maxTree[idx * 2], maxTree[idx * 2 + 1])
        minTree[idx] = min(minTree[idx * 2], minTree[idx * 2 + 1])
    }

        // 查询区间 [qLeft, qRight] 的最值
    func query(_ qLeft: Int, _ qRight: Int) -> (max: Int, min: Int) {
        return query(1, 0, n - 1, qLeft, qRight)
    }

    private func query(_ idx: Int, _ left: Int, _ right: Int, _ qLeft: Int, _ qRight: Int) -> (Int, Int) {
            // 情况1：完全覆盖当前区间
        if qLeft <= left && right <= qRight {
            return (maxTree[idx], minTree[idx])
        }

        let mid = (left + right) / 2
        var maxRes = Int.min
        var minRes = Int.max

            // 情况2：查询区间与左子树有交集
        if qLeft <= mid {
            let (lmx, lmn) = query(idx * 2, left, mid, qLeft, qRight)
            maxRes = max(maxRes, lmx)
            minRes = min(minRes, lmn)
        }
            // 情况3：查询区间与右子树有交集
        if qRight > mid {
            let (rmx, rmn) = query(idx * 2 + 1, mid + 1, right, qLeft, qRight)
            maxRes = max(maxRes, rmx)
            minRes = min(minRes, rmn)
        }
        
        return (maxRes, minRes)
    }
}
