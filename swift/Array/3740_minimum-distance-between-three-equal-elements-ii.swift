//https://leetcode.cn/problems/minimum-distance-between-three-equal-elements-ii/
class Solution {
    func minimumDistance(_ nums: [Int]) -> Int {
        var numToIndices = [Int:[Int]]()
        for i in 0..<nums.count {
            numToIndices[nums[i],default: []].append(i)
        }
        var sb = Int.max / 2
        for (_,indices) in numToIndices {
            guard indices.count >= 3 else {
                continue
            }
            for j in 0..<(indices.count - 2) {
                sb = min(sb,2 * (indices[j + 2] - indices[j]))
            }
        }
	return sb == Int.max / 2 ? -1 : sb
    }
}
