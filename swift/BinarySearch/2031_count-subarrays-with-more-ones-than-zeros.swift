// https://leetcode.com/problems/count-subarrays-with-more-ones-than-zeros/
class Solution {
    private let MOD = 1_000_000_007
    func subarraysWithMoreZerosThanOnes(_ nums: [Int]) -> Int {
        var ans = 0
        var preffix = [Int.min,0,Int.max]
        
        
        func binarySearch(_ target: Int) -> Int {
            var left = 0
            var right = preffix.count - 1
            while left < right {
                let mid = (left + right + 1) >> 1
                if preffix[mid] >= target {
                    right = mid - 1
                } else {
                    left = mid
                }
            }
            return left
        }
    
        
        
        
        var cnt = 0
        for num in nums {
            cnt += (num == 0 ? -1 : 1)
            let idx = binarySearch(cnt)
            ans += idx
            preffix.insert(cnt, at: idx + 1)
        }
        return ans % MOD
    }
}