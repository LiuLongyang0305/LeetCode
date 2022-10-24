// https://leetcode.com/problems/beautiful-array/
class Solution {
    static var memo = [Int:[Int]]()

    func beautifulArray(_ n: Int) -> [Int] {
        return helper(n)
    }

    private func helper(_ n: Int) -> [Int] {
        if let arr = Solution.memo[n] {
            return arr
        }
        guard n > 1 else {return [1]}
        var ans = [Int]()
        for x in helper((n + 1) / 2) {
            ans.append(2 * x - 1)
        }
        for x in helper(n / 2) {
            ans.append(2 * x)
        }
        Solution.memo[n] = ans
        return ans
    }
}