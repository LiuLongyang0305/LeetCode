  // https://leetcode.com/problems/maximum-score-after-binary-swaps/
    class Solution {
        func maximumScore(_ nums: [Int], _ s: String) -> Int {
            var sb = 0
            let chars = [Character](s)
            let M = nums.count
            var heap = Heap<Int>()
            for i in 0..<M {
                heap.insert(nums[i])
                if chars[i] == "1" {
                    sb += heap.popMax() ?? 0
                }
            }
            return sb
        }
    }
