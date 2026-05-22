//https://leetcode.com/problems/count-of-integers/
class Solution {
    private let MOD = 1_000_000_007
    private struct KeyNode: Hashable {
        var pos: Int
        var isLessThan: Bool
        var curSum: Int
    }
    func count(_ num1: String, _ num2: String, _ min_sum: Int, _ max_sum: Int) -> Int {
        return ((check(num2, min_sum, max_sum) ? 1 : 0)  + MOD + calculate(num2, min_sum, max_sum) - calculate(num1, min_sum, max_sum)) % MOD
    }

    private func calculate(_ limit: String, _ minSum: Int, _ maxSum: Int) -> Int {

        let limit = limit.map { Int($0.asciiValue ?? 0) - 48}
        let M = limit.count
        var memo = [KeyNode:Int]()

        func dfs(_ pos: Int, _ isLessThan: Bool, _ curSum: Int) -> Int {
            guard pos < M else {
                return (isLessThan && curSum >= minSum && curSum <= maxSum) ? 1 : 0
            }
            guard curSum <= maxSum else {return 0}
            let key = KeyNode(pos: pos, isLessThan: isLessThan, curSum: curSum)
            if let sb = memo[key] {
                return sb
            }
            var sb = 0
            let high = isLessThan ? 9 : limit[pos]
            for d in 0...high {
                sb += dfs(pos + 1, isLessThan || (d < limit[pos]), curSum + d)
                sb %= MOD
            }
            memo[key] = sb
            return sb
        }

        return dfs(0, false, 0)
    }


    private func check(_ num: String, _ minNum: Int, _ maxNum: Int) -> Bool {
        let digits = num.map { Int($0.asciiValue ?? 0) - 48}
        let sum = digits.reduce(0) {$0 + $1}
        return sum >= minNum && sum <= maxNum
    }
}
