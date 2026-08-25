//https://leetcode.cn/problems/count-subarrays-with-even-odd-ratio-ii/
class Solution {
    func countRatioSubarrays(_ nums: [Int], _ a: Int, _ b: Int) -> Int {
        var sortedNums = [Int.min,0,Int.max]

        func binarySearchFirstLargeThanOrEqualTo(target num: Int) -> Int {
            var l = 0
            var r = sortedNums.count - 1

            while l < r {
                let mid = (l + r) >> 1
                if sortedNums[mid] >= num {
                    r = mid
                } else {
                    l = mid + 1
                }
            }
            return l
        }

        var x = 0
        var y = 0
        var sb = 0
        for num in nums {
            if num & 1 == 0 {
                x += 1
            } else {
                y += 1
            }
            let t = b * x - a * y
            let idx = binarySearchFirstLargeThanOrEqualTo(target: t)
            // print(" x = \(x) y = \(y) t = \(t)  sn = \(sortedNums) idx = \(idx)")
            sb += sortedNums.count - 1 - idx
            sortedNums.insert(t, at: idx)
        }
        return sb

    }
}
