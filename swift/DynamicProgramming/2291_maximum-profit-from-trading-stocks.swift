// https://leetcode.com/problems/maximum-profit-from-trading-stocks/
class Solution {
    func maximumProfit(_ _present: [Int], _ _future: [Int], _ budget: Int) -> Int {
        let (present,profits,extraProfit) = simpleInputData(_present, _future, budget)
        guard !present.isEmpty else {return extraProfit}
        return extraProfit + maximumProfitInner(present, profits, budget)
    }


    private func maximumProfitInner(_ present: [Int], _ profits: [Int], _ budget: Int) -> Int {
        let N = present.count


        var memo = [Int:Int]()
        func dfs(_ remain: Int,_ idx: Int) -> Int {
            guard idx < N else {return 0}
            guard budget > 0 else {return 0}
            guard profits[idx] > 0 else {
                return dfs(remain, idx + 1)
            }
            let key = (remain << 10) | idx
            if let c = memo[key] {
                return c
            }
            var ans = dfs(remain, idx + 1)
            if remain >= present[idx] {
                ans = max(ans, profits[idx] + dfs(remain - present[idx], idx + 1))
            }

            memo[key] = ans
            return ans
        }
        return dfs(budget, 0)
    }


    private func simpleInputData(_ present: [Int], _ future: [Int], _ budget: Int) -> (present:[Int],profits:[Int],extraProfits: Int) {


        var newP = [Int]()
        var profits = [Int]()
        var extraProfit = 0

        let N = present.count

        for i in 0..<N {
            guard budget >= present[i] else {continue}
            let p = future[i] - present[i]
            guard p > 0 else {continue}
            guard present[i] != 0 else {
                extraProfit += p
                continue
            }
            newP.append(present[i])
            profits.append(p)
        }
        return (newP,profits,extraProfit)
    }
}