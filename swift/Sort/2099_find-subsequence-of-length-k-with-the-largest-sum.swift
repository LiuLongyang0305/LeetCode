// https://leetcode.com/problems/find-subsequence-of-length-k-with-the-largest-sum/
class Solution {
    func maxSubsequence(_ nums: [Int], _ k: Int) -> [Int] {
        let N = nums.count
        var sortedIndex = (0..<N).sorted { nums[$0] > nums[$1]}
        sortedIndex.removeLast(N - k)
        sortedIndex.sort { $0 < $1}
        return sortedIndex.map { nums[$0]}
    }
}