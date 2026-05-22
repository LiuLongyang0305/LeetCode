// https://leetcode.com/problems/minimum-sum-of-values-by-dividing-array/

class Solution {
    private let INF = 1_000_000_007
    private struct KeyNode: Hashable {
        var curIdx: Int
        var groupIdx: Int
        var andValue: Int
    }
    func minimumValueSum(_ nums: [Int], _ andValues: [Int]) -> Int {

        let N = nums.count
        let M = andValues.count

        var memo = [KeyNode:Int]()

        func dfs(_ curIdx: Int, _ groupIdx: Int, _ andValuesNow: Int) -> Int {
            if N - curIdx < M - groupIdx {
                return INF
            }
            if groupIdx == M {
                return curIdx == N ? 0 : INF
            }
            let newAndValue = andValuesNow & nums[curIdx]
            let key = KeyNode(curIdx: curIdx, groupIdx: groupIdx, andValue: newAndValue)
            if let v = memo[key] {
                return v
            }
            var sb = dfs(curIdx + 1, groupIdx, newAndValue)
            if newAndValue == andValues[groupIdx] {
                sb = min(sb,dfs(curIdx + 1, groupIdx + 1, -1) + nums[curIdx])
            }


            memo[key] = sb
            return sb
        }

        let sb = dfs(0, 0,-1)

        return sb == INF ? -1 : sb
    }
}
