 // https://leetcode.com/problems/number-of-beautiful-partitions/
class Solution {
    private let primers:Set<Int> = [2,3,5,7]
    private let MOD = 1_000_000_007
    func beautifulPartitions(_ s: String, _ k: Int, _ minLength: Int) -> Int {
        //转成数组和数字，方便后续计算
        let nums = s.map { Int($0.asciiValue! - 48)}
        //第一个数字必须质数，最后一个数字必须合数
        guard primers.contains(nums[0]) && !primers.contains(nums.last!) else {return 0}
        let N = s.count
        //长度要求
        guard N >= k * minLength else {return 0}

        //预处理可能的分割点，并且分割点个数至少有K个
        var possibleSplitPoints = [Int]()
        possibleSplitPoints.append(0)
        for i in minLength..<N {
            if primers.contains(nums[i]) && !primers.contains(nums[i - 1]) {
                possibleSplitPoints.append(i)
            }
        }
        guard possibleSplitPoints.count >= k else {return 0}
        let M = possibleSplitPoints.count
        //记忆化搜索
        var memo = [[Int?]](repeating: [Int?](repeating: nil, count: k + 5), count: M + 5)
        func dfs(_ idx: Int,_ remainK: Int) -> Int {
            if remainK == 1 {
                return N - possibleSplitPoints[idx] >= minLength ? 1 : 0
            }
            guard N - possibleSplitPoints[idx] >= minLength * remainK else {return 0}
            if let c =  memo[idx][remainK] {
                return c
            }
            var ans = 0
            var i = idx + 1
            while i <= M + 1 - remainK {
                if possibleSplitPoints[i] - possibleSplitPoints[idx] >= minLength {
                    ans += dfs(i, remainK - 1)
                }
                i += 1
            }
            ans %= MOD
            memo[idx][remainK] = ans
            return ans
        }

        return dfs(0, k)
    }
}