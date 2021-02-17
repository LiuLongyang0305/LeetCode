// https://leetcode.com/problems/minimum-limit-of-balls-in-a-bag/
class Solution {
    func minimumSize(_ nums: [Int], _ maxOperations: Int) -> Int {

        let sortedNums = nums.sorted()
        let N = sortedNums.count

        
        func check(_ maxCost: Int) -> Bool {
            guard maxCost > 0 else {
                return false
            }
            var remainOperationsCnt = maxOperations
            for idx in stride(from: N - 1, through: 0, by:-1) {
                guard sortedNums[idx] > maxCost else { break}
                remainOperationsCnt -= sortedNums[idx] / maxCost
                if sortedNums[idx] % maxCost == 0 {
                    remainOperationsCnt += 1
                }
                guard remainOperationsCnt >= 0 else {
                    return false
                }
            }
            return true 
        }

        //Binary Search
        var l = 0
        var r = nums.max()!
        var ans = Int.max
        while l < r {
            let mid = l + (r - l) >> 1
            if check(mid) {
                ans = min(ans, mid)
                r = mid - 1
            } else {
                l = mid + 1
            }
        }
        return check(l) ? min(l, ans) : ans
    }
}