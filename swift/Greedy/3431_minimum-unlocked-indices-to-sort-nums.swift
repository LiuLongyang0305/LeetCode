    // https://leetcode.cn/problems/minimum-unlocked-indices-to-sort-nums/
    class Solution {
        func minUnlockedIndices(_ nums: [Int], _ locked: [Int]) -> Int {
            let N = nums.count
            let firstIdxOf3 = nums.firstIndex(of: 3) ?? N
            let lastIdxOf1 = nums.lastIndex(of: 1) ?? -1
            guard lastIdxOf1 <= firstIdxOf3 else {return -1}
            let firstIdxOf2 = nums.firstIndex(of: 2) ?? N
            let lastIdxOf2 = nums.lastIndex(of: 2) ?? -1
            var ans = 0
            if firstIdxOf3 < lastIdxOf2 {
                ans += locked[firstIdxOf3..<lastIdxOf2].reduce(0, {$0 + $1 })
            }
            if firstIdxOf2 < lastIdxOf1 {
                ans += locked[firstIdxOf2..<lastIdxOf1].reduce(0, {$0 + $1 })
            }
            return ans
        }
    }
