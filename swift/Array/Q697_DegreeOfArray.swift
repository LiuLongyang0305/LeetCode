//https://leetcode.com/problems/degree-of-an-array/
class Solution {
    func findShortestSubArray(_ nums: [Int]) -> Int {
        let length = nums.count
        guard nums.count > 2 else {
            if 1 == length {
                return 1
            }
            return nums[0] == nums[1] ? 2 : 1
        }
        var valueToIndex = Dictionary<Int,[Int]>()
        for i in 0..<length {
            if valueToIndex[nums[i]] == nil {
                valueToIndex[nums[i]] = [Int]()
            }
            valueToIndex[nums[i]]?.append(i)
        }
        var targetKey = [Int]()
        var maxCount = 0
        for (value,indices) in valueToIndex {
            let indicesCount = indices.count
            if indicesCount == maxCount {
                targetKey.append(value)
            } else if indicesCount > maxCount {
                targetKey = [value]
                maxCount = indicesCount
            }
        }
        if maxCount == 1 {
            return 1
        }
        var potential = [Int]()
        for key in targetKey {
            let indices = valueToIndex[key]!
            potential.append(indices.max()! - indices.min()! + 1)
        }
        return potential.min()!
    }
}