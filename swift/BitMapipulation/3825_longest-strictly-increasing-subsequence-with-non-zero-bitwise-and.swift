// https://leetcode.cn/problems/longest-strictly-increasing-subsequence-with-non-zero-bitwise-and/
    class Solution {
        func longestSubsequence(_ nums: [Int]) -> Int {
            guard nums.max()! > 0 else {return 0}
            var numbersGroup = [[Int]](repeating: [], count:30)
            for  num in nums {
                for i in 0..<29 {
                    if num & (1 << i) != 0 {
                        numbersGroup[i].append(num)
                    }
                }
            }

            var sb = 1
            for group in numbersGroup {
                if group.count > sb {
                    sb = max(sb,LengthOfLongestIncreaseSequence(group))
                }
            }
            return sb
        }
    }
    func LengthOfLongestIncreaseSequence(_ nums:[Int]) -> Int {
    var tails = [Int](repeating: 0, count: nums.count)
    var size = 0
    for x in nums {
        var left = 0
        var right = size
        while left < right {
            let mid = left + (right - left) / 2
            if tails[mid] < x {
                left = mid + 1
            } else {
                right = mid
            }
        }
        tails[left] = x
        if left == size {
            size += 1
        }
    }
    return size
}

