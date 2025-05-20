//  https://leetcode.cn/problems/maximize-the-profit-as-the-salesman/
class Solution {
    private typealias Pair = (start:Int,gold:Int)
    func maximizeTheProfit(_ n: Int, _ offers: [[Int]]) -> Int {
        var groups = [Int:[Pair]]()
        for offer in offers {
            groups[offer[1],default: []].append((offer[0],offer[2]))
        }
        var memo = [Int](repeating: 0, count: n + 1)
        for end in 0..<n {
            var t = memo[end]
            if let pairs = groups[end] {
                for (s,gold) in pairs {
                    t = max(t,memo[s] + gold)
                }
            }
            memo[end + 1] = t

        }

        return memo[n]
    }

}