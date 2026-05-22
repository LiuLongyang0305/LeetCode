class Solution {
    func rob(_ nums: [Int], _ colors: [Int]) -> Int {
        let N = nums.count
        var memo = [Int](repeating: 0, count: N + 1)
        memo[1] = nums[0]
        for i in stride(from: 1, to: N, by: 1) {
            if colors[i] != colors[i - 1] {
                memo[i + 1] = memo[i] + nums[i]
            } else {
                memo[i + 1] = max(memo[i - 1] + nums[i],memo[i])
            }
        }
        return memo[N]
    }
}
