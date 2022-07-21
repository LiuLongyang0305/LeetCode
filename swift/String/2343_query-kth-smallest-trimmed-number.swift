// https://leetcode.com/problems/query-kth-smallest-trimmed-number/
class Solution {
    func smallestTrimmedNumbers(_ nums: [String], _ queries: [[Int]]) -> [Int] {

        let N = nums.count
        let M = nums[0].count
        var ans = [Int]()
        for query in queries {
            let k = query[0]
            let trim = query[1]
            let curStrs = nums.map { $0.dropFirst(M - trim)}
            let sortedIndices = (0..<N).sorted { curStrs[$0] < curStrs[$1]}
            ans.append(sortedIndices[k - 1])
        }
        return ans
    }
}