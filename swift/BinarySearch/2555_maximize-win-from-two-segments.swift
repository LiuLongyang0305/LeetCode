//https://leetcode.com/problems/maximize-win-from-two-segments/
class Solution {
    func maximizeWin(_ prizePositions: [Int], _ k: Int) -> Int {

        return max(calIfOverlap(prizePositions, k),calIfNotOverlap(prizePositions, k))
    }

    //如果两个线段有重叠，则相当于找一段长度小于等于2K的线段覆盖的最大奖品数
    private func calIfOverlap(_ pps: [Int], _ k : Int) -> Int {

        var ans = 0
        let M = pps.count

        for i in 0..<M {
            let target = pps[i] + 2 * k
            ans = max(ans, binarySearch(in: pps, for: target) - i + 1)
        }
        return ans
    }
    //如果两个线段无重叠，枚举第一个线段，再维护一个右侧长度为K的线段可能覆盖的奖品数的优先队列，取队列的最大值
    private func calIfNotOverlap(_ pps: [Int], _ k: Int) -> Int {

        struct Node: Comparable {
            static func < (lhs: Node, rhs: Node) -> Bool {
                return lhs.val < rhs.val
            }
            
            var startPos: Int
            var val: Int
        }
        let N = pps.count
        var firstHalfAns = [Int](repeating: 0, count: N)
        var heap = Heap<Node>()
        var ans = 0
        for i in 0..<N {
            let target = pps[i] + k
            let idx = binarySearch(in: pps, for: target)
            firstHalfAns[i] = idx - i + 1
            heap.insert(Node(startPos: pps[i], val: idx - i + 1))

        }
        for i in 0..<N {
            while let maxNode = heap.max, maxNode.startPos <= pps[i] + k {
                let _ = heap.popMax()
            }
            ans = max(ans,firstHalfAns[i] + (heap.max?.val ?? 0))
        }
        return ans
    }

    //二分查找，最后一个小于等于target的下标
    private func binarySearch(in arr:[Int], for target: Int) -> Int {
        var l = 0
        var r = arr.count - 1
        while l < r {
            let mid = (l + r + 1) >> 1
            if arr[mid] <= target {
                l = mid
            } else {
                r = mid - 1
            }
        }
        return l
    }
}
