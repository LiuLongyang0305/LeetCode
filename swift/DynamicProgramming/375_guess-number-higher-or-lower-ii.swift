//  https://leetcode.com/problems/guess-number-higher-or-lower-ii/
class Solution {
    private struct InnerRange: Hashable {
        var low: Int
        var high: Int
    }
    private static var memo = [InnerRange:Int]()
    func getMoneyAmount(_ n: Int) -> Int {
        func calculate(_ low: Int, _ high: Int) -> Int {
            guard low < high else {
                return 0
            }
            let key = InnerRange(low: low, high: high)
            guard nil == Solution.memo[key] else {
                return Solution.memo[key]!
            }
            var minRes = Int.max
            var i = (low + high) >> 1
            while i <= high {
                minRes = min(minRes, i + max(calculate(i + 1, high), calculate(low, i - 1)))
                i += 1
            }
            Solution.memo[key] = minRes
            return minRes
        }
        
        return calculate(1, n)
    }
}