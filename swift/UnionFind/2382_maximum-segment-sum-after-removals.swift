// https://leetcode.com/problems/maximum-segment-sum-after-removals/
class Solution {

    func maximumSegmentSum(_ nums: [Int], _ removeQueries: [Int]) -> [Int] {
        let N = nums.count

        var fa = [Int](0...N)
        var sum = [Int](repeating: 0, count: N + 1 )
        func  find(_ x: Int) -> Int {
            if x != fa[x] {
                fa[x] = find(fa[x])
            }
            return fa[x]
        }

        var ans = [Int](repeating: 0, count: removeQueries.count)
        for i in stride(from: removeQueries.count - 1, to: 0, by: -1) {
            let x = removeQueries[i]
            let to = find(x + 1)
            fa[x] = to
            sum[to] += sum[x] + nums[x]
            ans[i - 1] = max(ans[i], sum[to])
        }
        return ans

    }
}
