//https://leetcode.com/problems/count-beautiful-splits-in-an-array/
class Solution {

    func beautifulSplits(_ nums: [Int]) -> Int {

        let N = nums.count
        guard N >= 3 else {return 0}
        var lcp = [[Int]](repeating: [Int](repeating: 0, count: N + 1), count: N + 1)
        for i in stride(from: N - 1, through: 0, by: -1) {
            for j in stride(from: N - 1, through: i, by: -1) {
                if nums[i] == nums[j] {
                    lcp[i][j] = lcp[i + 1][j + 1] + 1
                }
            }
        }
        var ans = 0
        for i in 1..<(N - 1) {
            for j in (i + 1)..<N{
                if (i <= j - i && lcp[0][i] >= i) || lcp[i][j] >= j - i {
                    ans += 1
                }
            }
        }
        return ans
    }
}
