 //https://leetcode.cn/problems/find-missing-elements/
    class Solution {
        func findMissingElements(_ nums: [Int]) -> [Int] {
            let left = nums.min()!, right = nums.max()!
            let existedNum = Set<Int>(nums)
            var sb = [Int]()
            if left + 1 < right {
                for i in (left + 1)..<right {
                    if !existedNum.contains(i) {
                        sb.append(i)
                    }
                }
            }
            return sb
        }
    }
