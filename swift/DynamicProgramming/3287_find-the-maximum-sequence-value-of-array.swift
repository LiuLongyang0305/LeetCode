//https://leetcode.cn/problems/find-the-maximum-sequence-value-of-array
class Solution {
    func maxValue(_ nums: [Int], _ k: Int) -> Int {
        //求得nums中前i个数选j个的可能值

        let preffixChoosedKOrValue = solve(nums, k)
        let suffixChoosedKOrValue = solve([Int](nums.reversed()), k)

        var sb = 0
        for leftCnt in k...(nums.count - k) {
            //left对应下标： 0..<leftCnt
            let rightCnt = nums.count - leftCnt
            //right对应下标：0..<rightcount

            for v1 in preffixChoosedKOrValue[leftCnt - 1][k] {
                for v2 in suffixChoosedKOrValue[rightCnt - 1][k] {
                    sb = max(v1 ^ v2,sb)
                }
            }
        }

        return sb
    }

    private func solve(_ nums: [Int],_ k: Int) -> [[Set<Int>]] {
        let M = nums.count
        var memo = [[Set<Int>]](repeating: [Set<Int>](repeating: [], count: k + 1), count: M)
        memo[0][1].insert(nums[0])
        for i in 1..<M {
            memo[i] = memo[i - 1]
            memo[i][1].insert(nums[i])
            if k >= 2 {
                for k in 2...k {
                    if !memo[i - 1][k - 1].isEmpty {
                        for cur in memo[i - 1][k - 1] {
                            memo[i][k].insert(cur | nums[i])
                        }
                    }
                }
            }
        }
        return memo
    }
}
