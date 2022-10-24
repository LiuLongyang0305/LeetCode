// https://leetcode.cn/problems/longest-subsequence-with-limited-sum/
class Solution {
    func answerQueries(_ nums: [Int], _ queries: [Int]) -> [Int] {
        let soetedNums = nums.sorted()
        var preffix = [0]
        soetedNums.forEach {preffix.append(preffix.last! + $0)}
        let N = soetedNums.count
        return queries.map { taret in
            return preffix.lastIndex(where: { $0 <= taret})!
        }
    }
}