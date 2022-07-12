// https://leetcode.com/problems/stone-game-v/
class Solution {
    func stoneGameV(_ stoneValue: [Int]) -> Int {

        let N = stoneValue.count
        var preffix = [Int](repeating: 0, count: N + 1)
        for i in 0..<N {
            preffix[i + 1] = preffix[i] + stoneValue[i]
        }


        var memo = [[Int]](repeating: [Int](repeating: -1, count: N), count: N)

        func dfs(_ left: Int, _ right: Int) -> Int {
            guard right > left else {
                return 0
            }
            guard -1 == memo[left][right] else {return memo[left][right]}
            var ans = Int.min
            for rightPartStart in (left + 1)...right{
                let leftSum = preffix[rightPartStart] - preffix[left]
                let rightSum = preffix[right + 1] - preffix[rightPartStart]
                if leftSum < rightSum {
                    ans = max(ans, leftSum + dfs(left, rightPartStart - 1))
                } else if leftSum > rightSum {
                    ans = max(ans, rightSum + dfs(rightPartStart, right))
                } else {
                    ans = max(ans, rightSum + dfs(rightPartStart, right))
                    ans = max(ans, leftSum + dfs(left, rightPartStart - 1))
                }
            }

//            defer {
//                print("left = \(left)  right = \(right)  score = \(ans)")
//            }
            memo[left][right] = ans
            return ans
        }
        return dfs(0, N - 1)
    }
}