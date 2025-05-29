//https://leetcode.cn/problems/minimum-cost-to-make-arrays-identical/
class Solution {
    func minCost(_ arr: [Int], _ brr: [Int], _ k: Int) -> Int {
        let N = arr.count
        let ans = (0..<N).reduce(0) { $0 + abs(arr[$1] - brr[$1])}
        guard ans > k else { return ans}
        let sortedArr = arr.sorted()
        let sortedBrr = brr.sorted()
        return min(ans, k + (0..<N).reduce(0, { $0 + abs(sortedArr[$1] - sortedBrr[$1])}))
    }
}
