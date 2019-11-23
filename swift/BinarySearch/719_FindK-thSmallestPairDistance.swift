//https://leetcode.com/problems/find-k-th-smallest-pair-distance/
class Solution {
    func smallestDistancePair(_ nums: [Int], _ k: Int) -> Int {
        let sortedNums = nums.sorted()
        var low = 0
        var high = sortedNums.last! - sortedNums[0]
        while low < high {
            let middle = low + (high - low) >> 1
            var count = 0
            var left = 0
            for right in 0..<nums.count {
                while sortedNums[right] -  sortedNums[left] > middle {
                    left += 1
                }
                count += right - left
            }
            if count >= k {
                high = middle
            } else {
                low = middle + 1
            }
        }
        return low
    }
}
