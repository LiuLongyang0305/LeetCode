// https://leetcode.cn/problems/maximum-team-size-with-overlapping-intervals/
class Solution {
    func maximumTeamSize(_ startTime: [Int], _ endTime: [Int]) -> Int {
        let sortedSt = startTime.sorted()
        let sortedEt = endTime.sorted()
        let M = startTime.count

        //结束时间小于枚举的开始时间
        func binarySearchForLastSmallerThan(_ target: Int) -> Int {

            if let f = sortedEt.first, f >= target {
                return 0
            }

            var l = 0
            var r = M - 1
            while l < r {
                let mid = (l + r + 1) / 2
                if sortedEt[mid] >= target {
                    r = mid - 1
                } else {
                    l = mid
                }
            }
            return l + 1
        }


        func binarySearchForFirstLargeThan(_ target: Int) -> Int {
            if let la = sortedSt.last, la <= target {
                return 0
            }
            var l = 0
            var r = M - 1
            while l < r {
                let mid = (l + r ) / 2
                if sortedSt[mid] > target {
                    r = mid
                } else {
                    l = mid + 1
                }
            }
            // print("\(target)   \(l)")
            return M - l
        }

        var ans = 1
        for i in 0..<M {
            let st = startTime[i]
            let et = endTime[i]
            ans = max(ans, M - binarySearchForLastSmallerThan(st) - binarySearchForFirstLargeThan(et))
        }


        return ans
    }
}
