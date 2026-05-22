//https://leetcode.com/problems/reschedule-meetings-for-maximum-free-time-ii/
import Collections
class Solution {
    struct SpaceInfo: Comparable {
        static func < (lhs: Solution.SpaceInfo, rhs: Solution.SpaceInfo) -> Bool {
            if lhs.val == rhs.val {
                return lhs.firstIdx < rhs.firstIdx
            }
            return lhs.val < rhs.val
        }

        var firstIdx: Int
        var val: Int
    }
    func maxFreeTime(_ eventTime: Int, _ startTime: [Int], _ endTime: [Int]) -> Int {
        let newStartTime = [0] + startTime + [eventTime]
        let newEndTime = [0] + endTime + [eventTime]
        var rightHeap = Heap<SpaceInfo>()
        let N = startTime.count
        let M = newStartTime.count

        for i in 0..<(M - 1) {
            rightHeap.insert(SpaceInfo(firstIdx: i, val: newStartTime[i + 1] - newEndTime[i]))
        }
        var ans = rightHeap.max?.val ?? -1
        var leftHeap = Heap<SpaceInfo>()
        //移动当前会议：最好别的地方可以容纳，否则向左移或者向右移
        for i in 1..<(M - 1) {
            while let maxNode = rightHeap.max, maxNode.firstIdx < i + 1 {
                let _ = rightHeap.popMax()
            }
            if i - 2 >= 0 {
                leftHeap.insert(SpaceInfo(firstIdx: i - 2, val: newStartTime[i - 1] - newEndTime[i - 2]))
            }

            let needSpace = newEndTime[i] - newStartTime[i]
            let maxSpace = max(leftHeap.max?.val ?? 0, rightHeap.max?.val ?? 0)
            if maxSpace >= needSpace {
                ans = max(ans,newStartTime[i + 1] - newEndTime[i - 1])
            } else {
                ans = max(newStartTime[i + 1] - newEndTime[i - 1] - needSpace,ans)
            }
        }

        return ans
    }
}
