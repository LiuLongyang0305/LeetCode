// https://leetcode.com/problems/replace-elements-in-an-array/
class Solution {
    func arrayChange(_ nums: [Int], _ operations: [[Int]]) -> [Int] {
        var ans = nums
        var numToIndex = [Int:[Int]]()
        let N = nums.count
        for i in 0..<N {
            numToIndex[nums[i],default: []].append(i)
        }
        for operation in operations {
            let (ori,new) = (operation[0],operation[1])
            numToIndex[new, default: []].append(contentsOf: numToIndex[ori]!)
            numToIndex.removeValue(forKey: ori)
        }
        for (v,indices) in numToIndex {
            for i in indices {
                ans[i] = v
            }
        }
        return ans
    }
}