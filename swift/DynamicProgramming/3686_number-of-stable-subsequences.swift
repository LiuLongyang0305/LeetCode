// https://leetcode.cn/problems/number-of-stable-subsequences
class Solution {
    func countStableSubsequences(_ nums: [Int]) -> Int {
        let N = nums.count
        let MOD = 1_000_000_007
        var memo = [[[Int?]]](repeating: [[Int?]](repeating: [Int?](repeating: nil, count: 3) , count: 3), count: N + 5)
        //是奇数嘛
        //考虑当前的数字，要么不选择， 要么选择
        //考虑前两个已经选择的数字：缺失，奇数，偶数
        func dfs(_ idx: Int, _ ll: Bool?, _ l: Bool?) -> Int {
            guard idx < N else {
                return l != nil ? 1 : 0
            }
            if let sb = memo[idx][getIdx(of: ll)][getIdx(of: l)] {
                return sb
            }
            var sb = dfs(idx + 1, ll, l)
            sb %= MOD
            let curFlag = nums[idx] & 1 != 0

            if let t = ll, let m = l {
                if curFlag != t || curFlag != m {
                    sb += dfs(idx + 1, l, curFlag)
                }
            } else {
                sb += dfs(idx + 1, l, curFlag)
            }
            sb %= MOD
            memo[idx][getIdx(of: ll)][getIdx(of: l)] = sb
            return sb
        }



        return  dfs(0, nil, nil)
    }

    private func getIdx(of flag: Bool?) -> Int {
        if let f = flag {
            return f ? 1 : 2
        }
        return 0
    }
}

