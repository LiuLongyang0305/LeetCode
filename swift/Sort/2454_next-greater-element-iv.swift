// https://leetcode.com/problems/next-greater-element-iv/
class Solution {

    func secondGreaterElement(_ nums: [Int]) -> [Int] {
        let N = nums.count
        let sortedIndices = (0..<N).sorted { nums[$0] > nums[$1]}
        var largerIndices = [-1,N,N + 1]


        func binarySearch(_ taregt: Int) -> Int {
            var left = 0
            var right = largerIndices.count - 1
            while left < right {
                let mid = (left + right) >> 1
                if largerIndices[mid] > taregt {
                    right = mid
                } else {
                    left = mid + 1
                }
            }
            return left
        }

        var ans = [Int](repeating: -1, count: N)

        var i = 0
        while i < N {
            let firseLargerIndex = binarySearch(sortedIndices[i])
            let secondLargerIndex = largerIndices[ firseLargerIndex + 1]
            if secondLargerIndex < N {
                ans[sortedIndices[i]] = nums[secondLargerIndex]
            }
            largerIndices.insert(sortedIndices[i], at: firseLargerIndex)
            i += 1
        }
        return ans
    }

}
