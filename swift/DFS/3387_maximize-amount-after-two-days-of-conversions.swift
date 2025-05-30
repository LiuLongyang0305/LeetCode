//https://leetcode.com/problems/maximize-amount-after-two-days-of-conversions/
class Solution {
    private typealias Pair = (currency:String,rate: Double)
    func maxAmount(_ initialCurrency: String, _ pairs1: [[String]], _ rates1: [Double], _ pairs2: [[String]], _ rates2: [Double]) -> Double {

        let day1Ammount = caculate(pairs1, rates1, initialCurrency)
        let day2Ammount = caculate(pairs2, rates2, initialCurrency)

        var ans: Double = 0

        for (middleNode, amount1) in day1Ammount {
            if let amount2 = day2Ammount[middleNode] {
                ans = max(ans,amount1 / amount2)
            }
        }

        return ans
    }

    private func  caculate(_ pairs: [[String]], _ rate: [Double],_ initialCurrency: String) -> [String:Double] {
        var ans = [String:Double]()
        let N = pairs.count
        var tree = [String:[Pair]]()
        for i in 0..<N {
            tree[pairs[i][0],default: []].append(Pair(pairs[i][1],rate[i]))
            tree[pairs[i][1],default: []].append(Pair(pairs[i][0],1.0 / rate[i]))
        }

        func dfs(_ last: String, _ curAmmount: Double) {
            ans[last] = curAmmount
            for (next,rate) in tree[last] ?? [] {
                if next != last && !ans.keys.contains(next) {
                    dfs(next, curAmmount * rate)
                }
            }
        }

        dfs(initialCurrency, 1.0)
        return ans
    }

}
