//https://leetcode.cn/problems/sum-of-distances/
class Solution {
    func distance(_ nums: [Int]) -> [Int] {
        let N = nums.count
        var ans = [Int](repeating: 0, count: N)
        var numToIndices = [Int:[Int]]()
        for i in 0..<nums.count {
            numToIndices[nums[i],default: []].append(i)
        }
        for (_, indices) in numToIndices {
            guard indices.count > 1 else {
                continue
            }
            let N = indices.count
            let total = indices.reduce(0) { $0 + $1}

            ans[indices[0]] = total - N * indices[0]
            ans[indices[N - 1]] = N * indices[N - 1] - total
            guard indices.count > 2 else {continue}
            var preSum = indices[0]
            for j in 1..<(N - 1) {
                ans[indices[j]] = total - 2 * preSum + (j * 2 - N) * indices[j]
                preSum += indices[j]
            }
        }
        return ans
    }
}
