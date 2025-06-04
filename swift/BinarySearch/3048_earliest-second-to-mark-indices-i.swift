//https://leetcode.cn/problems/earliest-second-to-mark-indices-i/
class Solution {
    func earliestSecondToMarkIndices(_ nums: [Int], _ changeIndices: [Int]) -> Int {
        let N = nums.count
        let M = changeIndices.count

        guard N <= M else {return -1}

        func check(_ timeLimit: Int) -> Bool {

            var idxToMaxTime = [Int:Int]()
            for i in 0..<timeLimit {
                idxToMaxTime[changeIndices[i] - 1, default: -1] = i + 1
            }
            guard idxToMaxTime.count == N else {
                return false
            }
            let sortedIdxToMaxTime = idxToMaxTime.sorted { $0.value < $1.value}
            var used = 0
            var marked = [Bool](repeating: false, count: nums.count)

            for (idx,time) in sortedIdxToMaxTime {

                used += nums[idx]
                guard used < time else {
                    return false
                }
                if !marked[idx] {
                    used += 1
                    marked[idx] = true
                }
            }
            return !marked.contains(false)
        }


        guard check(M) else {
            return -1
        }

        var l = 1
        var r = changeIndices.count

        while l < r {
            let mid = (l + r) >> 1
            if check(mid) {
                r = mid
            } else {
                l = mid + 1
            }
        }

        return l
    }
}
