// https://leetcode.com/problems/subarray-with-elements-greater-than-varying-threshold/
class Solution {
    func validSubarraySize(_ nums: [Int], _ threshold: Int) -> Int {
        let N = nums.count
        var stack = [Int]()
        var nextSmallerIdx = [Int](repeating: -1, count: N)
        var preSmallerIdx = [Int](repeating: -1, count: N)
        for i in 0..<N {
            while let j = stack.last, nums[i] < nums[j] {
                nextSmallerIdx[j] = i
                stack.removeLast()
            }
            stack.append(i)
        }
        stack = []

        for i in stride(from: N - 1, through: 0, by: -1) {
            while let j = stack.last,nums[i] < nums[j] {
                preSmallerIdx[j] = i
                stack.removeLast()
            }
            stack.append(i)
        }

        // print(nextSmallerIdx)
        // print(preSmallerIdx)
        for i in 0..<N {
            let left = preSmallerIdx[i]
            let right = nextSmallerIdx[i] == -1 ? N : nextSmallerIdx[i]
            let len = right - left - 1
            if nums[i] * len > threshold {
                return len
            }
        }


        return -1
    }
}