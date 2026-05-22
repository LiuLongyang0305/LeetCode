//https://leetcode.cn/problems/count-sequences-to-k/
func _gcd(_ a: Int, _ b: Int) -> Int {
    return b == 0 ? a : _gcd(b, a % b)
}

class Solution {
    func countSequences(_ nums: [Int], _ k: Int) -> Int {


        let N = nums.count
        var memo = [String:Int]()
        func dfs(_ idx: Int, _ numerator: Int, _ denominator: Int) -> Int {
            guard idx < N else {return numerator == k && denominator == 1 ? 1 : 0}
            let key = "\(idx)-\(numerator)-\(denominator)"
            if let sb = memo[key] {return sb}
            var sb = 0

            //乘
            let newNumerator = numerator * nums[idx]
            let gcd1 = _gcd(newNumerator, denominator)
            sb += dfs(idx + 1, newNumerator / gcd1, denominator / gcd1)
            //除
            let newDenominator = denominator * nums[idx]
            let gcd2 = _gcd(numerator, newDenominator)
            sb += dfs(idx + 1, numerator / gcd2, newDenominator / gcd2)
            //不变
            sb += dfs(idx + 1,numerator,denominator)
            memo[key] = sb
            return sb
        }


        return dfs(0, 1, 1)
    }
}
