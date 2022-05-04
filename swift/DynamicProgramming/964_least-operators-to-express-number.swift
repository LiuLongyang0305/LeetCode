// https://leetcode.com/problems/least-operators-to-express-number/
class Solution {
    func leastOpsExpressTarget(_ x: Int, _ target: Int) -> Int {
        var memo = [String:Int]()
        func solve(_ cur:Int, _ depth: Int) -> Int{
            guard cur > 0 else {return -1}
            let usage = depth == 0 ? 2 : depth
            guard cur != 1 else {
                return usage - 1
            }
            let key = "\(depth)-\(cur)"
            guard nil == memo[key] else {return memo[key]!}
            let div = cur / x, r = cur % x
            if r == 0 {
                memo[key] = solve(div, depth + 1)
            } else {
                memo[key] = min(solve(div, depth + 1) + r * usage, solve(div + 1, depth + 1) + (x - r) * usage)
            }
            return memo[key]!
        }

        return solve(target, 0)
    }

}
