//  https://leetcode.com/problems/elements-in-array-after-removing-and-replacing-elements/
class Solution {
    func elementInNums(_ nums: [Int], _ queries: [[Int]]) -> [Int] {
        var ans = [Int]()
        let N = nums.count
        for query in queries {
            let t = query[0] % (2 * N)
            if t < N {
                let remian = N - t
                ans.append(query[1] >= remian ? -1 : nums[query[1] + t])
            }  else {
                let remain = t - N
                ans.append(query[1] >= remain ? -1 : nums[query[1]])
            }
        }
        return ans
    }
}