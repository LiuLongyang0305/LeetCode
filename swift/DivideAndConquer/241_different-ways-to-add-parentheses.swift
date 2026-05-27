// https://leetcode.com/problems/different-ways-to-add-parentheses/
class Solution {
    private var memo = [String:[Int]]()
    private let operators = Set<Character>("+-*")
    func diffWaysToCompute(_ input: String) -> [Int] {
        divideAndConquer(input)
        return memo[input]!
    }
    private func divideAndConquer(_ input: String) -> [Int] {
        if let caculated = memo[input] {
            return caculated
        }
        if let num = Int(input) {
            memo[input] = [num]
            return [num]
        }
        var ans = [Int]()
        var idx = input.startIndex
        while idx < input.endIndex {
            if operators.contains(input[idx]) {
                let leftAns = divideAndConquer(String(input[..<idx]))
                let rightAns = divideAndConquer(String(input[input.index(after: idx)...]))
                for l in leftAns {
                    for r in rightAns {
                        ans.append(input[idx] == "*" ? (l * r) : (input[idx] == "+" ? (l + r) : (l - r)))
                    }
                }
            }
            idx = input.index(after: idx)
        }
        memo[input] = ans
        return ans
    }
}