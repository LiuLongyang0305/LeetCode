// https://leetcode.com/problems/maximum-value-at-a-given-index-in-a-bounded-array/
class Solution {
    func maxValue(_ n: Int, _ index: Int, _ maxSum: Int) -> Int {
        guard n != maxSum else {
            return 1
        }
        var low = 1
        var high = maxSum
        var ans = Int.min
        while low < high {
            let mid = low + (high - low) >> 1
            if check(n, index, maxSum, mid) {
                ans = max(ans, mid)
                low = mid + 1
            } else {
                high = mid - 1
            }
        }
        if check(n, index, maxSum, low) {
            ans = max(ans, low)
        }
        return ans
    }
    
    private func check(_ n: Int, _ index: Int,_ maxSum: Int, _ curVal: Int) -> Bool {
        var sum = 0
        if curVal < index + 1 {
            sum += (curVal + 1) * curVal / 2 + index  + 1 - curVal
        } else {
            sum += (curVal * 2 - index) * (index + 1) / 2
        }
        if curVal < n - index {
            sum += curVal * (curVal - 1) / 2 + n - index - curVal
        } else {
            sum += (curVal * 2 - n + index) * (n - 1 - index) / 2
        }
        return sum <= maxSum
    }
}

