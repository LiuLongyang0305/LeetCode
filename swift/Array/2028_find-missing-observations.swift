// https://leetcode.com/problems/find-missing-observations/
class Solution {
    func missingRolls(_ rolls: [Int], _ mean: Int, _ n: Int) -> [Int] {
        let target = (rolls.count + n) * mean - rolls.reduce(0, { $0 + $1})
        guard target <= n * 6 && target >= n else{
            return []
        }
        var ans = [Int](repeating: target / n, count: n)
        let remain = target - ans[0] * n
        if remain > 0 {
            for i in 0..<remain {
                ans[i] += 1
            }
        }
        return ans
    }
}