// https://leetcode.com/problems/stone-game-ii/
class Solution {
    func stoneGameII(_ piles: [Int]) -> Int {

        var preffix = [0]
        piles.forEach { preffix.append(preffix.last! + $0)}
        let N = piles.count
        var memo = [Int:Int]()
        func  dfs(_ idx: Int, _ M: Int ) -> Int {
            guard idx < N else {
                return 0
            }

            let limit = M << 1
            if N - idx <= limit {
                return preffix[N] - preffix[idx]
            }

            let key = (M << 20) | idx
            if let v = memo[key] {
                return v
            }
            var ans = Int.min

            for length in 1...limit {
                let j = idx + length
                ans = max(ans, preffix[N] - preffix[idx] - dfs(j, max(length, M)))
            }
            memo[key] = ans
            return ans
        }


        return dfs(0, 1)
    }
}