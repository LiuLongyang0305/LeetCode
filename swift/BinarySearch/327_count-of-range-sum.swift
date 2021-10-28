// https://leetcode.com/problems/count-of-range-sum/
class Solution {
    func countRangeSum(_ nums: [Int], _ lower: Int, _ upper: Int) -> Int {
        var sortedPreffixes = [Int.min,0]
        var curPreffix = 0
        var ans = 0
        for num in nums {
            curPreffix += num
            let idx1 = getLastIndex(lessThan: curPreffix - upper, in: sortedPreffixes)
            let idx2 = getLastIndex(lessThan: curPreffix - lower + 1, in: sortedPreffixes)
            ans += (idx2 - idx1)
            let idx = getLastIndex(lessThan: curPreffix, in: sortedPreffixes)
            if idx ==  sortedPreffixes.count - 1 {
                sortedPreffixes.append(curPreffix)
            } else {
                sortedPreffixes.insert(curPreffix, at: idx + 1)
            }
        }
        return ans
    }
    private func  getLastIndex(lessThan val:Int, in arr: [Int]) -> Int {
        var left = 0
        var right = arr.count - 1
        while left < right {
            let mid = (left + right + 1) >> 1
            if arr[mid] >= val {
                right = mid - 1
            } else {
                left = mid
            }
        }
        return left
    }
}