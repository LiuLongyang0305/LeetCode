// https://leetcode.com/problems/minimum-total-space-wasted-with-k-resizing-operations/
class Solution {
    func minSpaceWastedKResizing(_ nums: [Int], _ k: Int) -> Int {
        
        var preffix = [0]
        nums.forEach {preffix.append(preffix.last! + $0)}
        var memo = [Int:Int]()
        
        func helper(_ left: Int, _ right: Int, _ maxSplitTimes: Int) -> Int {
            let maxLength = right - left + 1
            let key = (left << 48) | (right << 32) | (maxSplitTimes < maxLength ? maxSplitTimes : 0)
            if let cnt = memo[key] {
                return cnt
            }
            guard maxSplitTimes < maxLength else {
                memo[key] = 0
                return 0
            }
            guard maxSplitTimes > 1 else {
                var t = -1
                for i in left...right {
                    t = max(t, nums[i])
                }
                let ans = t * maxLength - (preffix[right + 1] - preffix[left])
                memo[key] = ans
                return ans
            }
            var minWastedSpace = Int.max
            var curMaxEle = -1
            for idx in left...right  {
                curMaxEle = max(curMaxEle, nums[idx])
                let curCost = curMaxEle * (idx - left + 1) - (preffix[idx + 1] - preffix[left])
                minWastedSpace = min(minWastedSpace, (idx + 1 <= right ? helper(idx + 1, right, maxSplitTimes - 1) : 0) + curCost)
            }
            memo[key] = minWastedSpace
            return minWastedSpace
        }
        
        return helper(0, nums.count - 1, k + 1)
    }
}