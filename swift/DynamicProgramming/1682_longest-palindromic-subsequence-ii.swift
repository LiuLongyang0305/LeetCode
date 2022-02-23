// https://leetcode.com/problems/longest-palindromic-subsequence-ii/
class Solution {
    func longestPalindromeSubseq(_ s: String) -> Int {
        let sToNumbers = s.map { Int($0.asciiValue!) - 97}
        let N = s.count
        var memo = [Int:Int]()
        func dfs(_ left: Int, _ right: Int,  startWith num : Int) -> Int {
            guard left < right else {return 0}
            let key = (left << 30) | (right << 20) | num
            guard nil == memo[key] else {return memo[key] ?? 0}
            guard sToNumbers[left] == num else {return dfs(left + 1, right, startWith: num)}
            guard sToNumbers[right] == num else {return dfs(left, right - 1, startWith: num)}
            var ans = 0
            for nextNum in 0...25 {
                guard nextNum != num else {continue}
                ans = max(ans, 2 + dfs(left + 1, right - 1, startWith: nextNum))
            }
            memo[key] = ans
            return ans
        }
        
        
        var ans = 0
        for num in 0...25 {
            ans = max(ans, dfs(0, N - 1, startWith: num))
        }
        return ans
    }
}
