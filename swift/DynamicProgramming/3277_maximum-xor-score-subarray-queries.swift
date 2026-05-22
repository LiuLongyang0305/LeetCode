//https://leetcode.cn/problems/maximum-xor-score-subarray-queries/
class Solution {
    func maximumSubarrayXor(_ nums: [Int], _ queries: [[Int]]) -> [Int] {

        let N = nums.count

        var memoXorValue = [Int](repeating: -1, count: N * N)
        func xOrForSunRange(_ i: Int, _ j: Int) -> Int {
            if i == j {
                 memoXorValue[i * N + j] = nums[i]
                return nums[i]
            }
            if -1 != memoXorValue[i * N + j] {return memoXorValue[i * N + j]}
            memoXorValue[i * N + j] = xOrForSunRange(i + 1, j) ^ xOrForSunRange(i, j - 1)
            return memoXorValue[i * N + j]
        }


        var memoMaxXorSubrangesValue = [Int](repeating: -1, count: N * N)

        func dfs(_ i: Int, _ j: Int) -> Int {
            if i == j {
                memoMaxXorSubrangesValue[i * N + j] = nums[i]
                return nums[i]
            }
            if -1 != memoMaxXorSubrangesValue[i * N + j] {return memoMaxXorSubrangesValue[i * N + j]}
            var sb = memoXorValue[i * N + j]
            sb = max(sb,dfs(i + 1, j),dfs(i, j - 1))
            memoMaxXorSubrangesValue[i * N + j] = sb
            return sb
        }

        xOrForSunRange(0,N - 1)
        dfs(0,N - 1)
        return queries.map { memoMaxXorSubrangesValue[$0[0] * N + $0[1]]}
    }
}
