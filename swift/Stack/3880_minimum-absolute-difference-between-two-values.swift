 // https://leetcode.cn/problems/minimum-absolute-difference-between-two-values/
    class Solution {
        func minAbsoluteDifference(_ nums: [Int]) -> Int {
            var sb = Int.max
            var stack = [Int]()
            for i in 0..<nums.count {
                guard nums[i] != 0 else {continue}
                if let li = stack.last {
                    if nums[li] == nums[i] {
                        stack.removeLast()
                    } else {
                        sb = min(sb,abs(li - i))
                    }
                }
                stack.append(i)
            }
            return sb == Int.max ? -1 : sb
        }
    }
