//https://leetcode.com/problems/number-of-subarrays-that-match-a-pattern-i/
class Solution {
    func countMatchingSubarrays(_ nums: [Int], _ pattern: [Int]) -> Int {
        var ans = 0
        for arr in nums.windows(ofCount: pattern.count + 1) {
            if check(original: [Int](arr), pattern) {
                ans += 1
            }
        }
        return ans
    }


    func check(original: [Int], _ pattern: [Int]) -> Bool {
        let M = pattern.count
        for k in 0..<M {
            if pattern[k] == 0 {
                guard original[k] == original[k + 1] else {return false}
            } else if pattern[k] == 1 {
                guard original[k] < original[k + 1] else {return false}
            } else {
                guard original[k] > original[k + 1] else {return false}
            }
        }
        return true
    }
}
