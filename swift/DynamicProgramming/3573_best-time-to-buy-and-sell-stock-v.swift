//https://leetcode.com/problems/best-time-to-buy-and-sell-stock-v
class Solution {
    func maximumProfit(_ prices: [Int], _ k: Int) -> Int {
        let N = prices.count


        //state == 2: 做多先加再减
        //state == 1: 做空， 先减再加
        //state == 0 : 未交易

        var memo = [[[Int?]]](repeating: [[Int?]](repeating: [Int?](repeating: nil, count: 3), count: k + 5), count: N + 5)


        func dfs(_ cur: Int, _ remainK: Int, _ state: Int) -> Int {

            if cur == N || remainK == 0 {
                return state == 0 ? 0 : (Int.min / 2)
            }

            if let v = memo[cur][remainK][state] {
                return v
            }
            var ans = dfs(cur + 1, remainK, state)
            let c = prices[cur]

            if state == 1 {
                ans = max(ans,c + dfs(cur + 1, remainK - 1, 0))
            } else if state == 2 {
                ans = max(ans,-c + dfs(cur + 1,remainK - 1,0))
            }  else {
                ans = max(ans,-c + dfs(cur + 1, remainK, 1),c + dfs(cur + 1,remainK,2))
            }
            memo[cur][remainK][state] = ans
            return ans
        }



        return dfs(0, k, 0)
    }
}

