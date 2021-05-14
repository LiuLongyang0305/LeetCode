// https://leetcode.com/problems/paint-house-ii/
class Solution {
    private typealias IndexPair = (first:Int,second: Int)
    func minCostII(_ costs: [[Int]]) -> Int {
        let M = costs.count
        guard M > 1 else {
            return costs[0].min()!
        }
        let N = costs[0].count
        guard N > 1 else {
            return costs[0][0]
        }
        var last = costs[0]
        for r in 1..<M {
            var new = costs[r]
            let smallestTwoIndices = getIndicesOfSmallestTwo(of: last)
            for c in 0..<N {
                if c == smallestTwoIndices.first {
                    new[c] += last[smallestTwoIndices.second]
                } else {
                    new[c] += last[smallestTwoIndices.first]
                }
            }
            last = new
        }
        return last.min()!
    }
    
    private func getIndicesOfSmallestTwo(of nums: [Int]) -> IndexPair {
        var ans: IndexPair = (-1,-1)
        if nums[0] < nums[1] {
            ans = (0,1)
        } else {
            ans = (1,0)
        }
        guard nums.count > 2 else {
            return ans
        }
        for idx in 2..<nums.count {
            guard nums[idx] <= nums[ans.second] else {
                continue
            }
            if nums[idx] >= nums[ans.first] {
                ans.second = idx
            } else {
                ans.second = ans.first
                ans.first = idx
            }
        }
        return ans
    }
}
