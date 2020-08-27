// https://leetcode.com/problems/find-right-interval/
class Solution {
    func findRightInterval(_ intervals: [[Int]]) -> [Int] {
        var ans = [Int]()
        var map = [[Int]:Int]()
        var start = [Int:[Int]]()
        for i in 0..<intervals.count {
            map[intervals[i]] = i
            start[intervals[i][0]] = intervals[i]
        }
        let N = intervals.count
        let sortedStartPoints = start.keys.sorted()
        
        func binarySearchFirstLargerOrEqualTo(_ val: Int) -> Int? {
            guard val >= sortedStartPoints[0] else {
                return 0
            }
            guard val < sortedStartPoints.last! else {
                
                return val == sortedStartPoints.last! ? N - 1 : nil
            }
            var left = 0
            var right = sortedStartPoints.count
            while left < right {
                let mid = left + (right - left) >> 1
                if sortedStartPoints[mid] == val {
                    return mid
                } else if sortedStartPoints[mid] < val {
                    left = mid + 1
                } else {
                    if sortedStartPoints[mid - 1] < val {
                        return mid
                    } else {
                        right = mid - 1
                    }
                }
            }
            return left
        }
        for interval in intervals {
            if let index =  N >= 20 ? binarySearchFirstLargerOrEqualTo( interval[1]) : sortedStartPoints.firstIndex(where: { $0 >= interval[1]}) {
                if let nextInterval = start[sortedStartPoints[index]], let idx = map[nextInterval] {
                    ans.append(idx)
                }
            } else {
                ans.append(-1)
            }
        }
        return ans
    }
}
let intervals = [[3,4],[2,3],[1,2]]
Solution().findRightInterval(intervals)

