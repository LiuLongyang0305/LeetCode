 // https://leetcode.com/problems/jump-game-v/
class Solution {
    func maxJumps(_ arr: [Int], _ d: Int) -> Int {

        let N = arr.count

        var memo = [Int](repeating: -1, count: N)

        func dfs(_ cur: Int) -> Int {
            guard -1 == memo[cur] else {return memo[cur]}

            var ans = 1

            for x in 1...d {
                guard cur + x < N else {break}
                guard arr[cur] > arr[cur + x] else {break}
                ans = max(ans, 1 + dfs(cur + x))
            }
            for x in 1...d {
                guard cur - x >= 0 else {break}
                guard arr[cur] > arr[cur - x] else {break}
                ans = max(ans, 1 + dfs(cur - x))
            }

            memo[cur] = ans
            return ans
        }



        var ans = 1
        for i in 0..<N {
            ans = max(ans, dfs(i))
        }
        return ans
    }
}