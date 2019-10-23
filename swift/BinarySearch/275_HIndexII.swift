//https://leetcode.com/problems/h-index-ii/
class Solution {
    func hIndex(_ citations: [Int]) -> Int {
        var left = 0
        let length = citations.count
        var right = length
        while left < right {
            let mid = left + (right - left + 1) >> 1
            if citations[length - mid ] >= mid {
                left = mid
            } else {
                right = mid - 1
            }
        }
        return left
    }
}

