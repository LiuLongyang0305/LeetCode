// https://leetcode-cn.com/problems/boolean-evaluation-lcci/
class Solution {
    private struct State: Hashable {
        var s: String
        var result: Int
    }
    private var memo = [State:Int]()
    func countEval(_ s: String, _ result: Int) -> Int {
        self.memo.removeAll()
        return helper(s, result)
    }
    private func helper(_ s: String, _ result: Int) -> Int {
        guard s.count > 1 else {
            return Int(s.first!.asciiValue!) - 48 - result == 0 ? 1 : 0
        }
        let key = State(s: s, result: result)
        if let v = memo[key] {
            return v
        }
        var ans = 0
        var idx = s.startIndex
        while idx < s.endIndex {
            if !s[idx].isNumber {
                let left = String(s[..<idx])
                let right = String(s[s.index(after: idx)...])
                if s[idx] == "&" {
                    if result == 0 {
                        ans += helper(left, 0) * helper(right, 0) + helper(left, 1) * helper(right, 0) + helper(left, 0) * helper(right, 1)
                    } else if result == 1 {
                        ans += helper(left, 1) * helper(right, 1)
                    }
                } else if s[idx] == "^" {
                    if result == 0 {
                        ans += helper(left, 1) * helper(right, 1) + helper(left, 0) * helper(right, 0)
                    } else {
                        ans += helper(left, 0) * helper(right, 1) + helper(left, 1) * helper(right, 0)
                    }
                } else if s[idx] == "|" {
                    if result == 0 {
                        ans += helper(left, 0) * helper(right, 0)
                    } else {
                        ans += helper(left, 1) * helper(right, 1) + helper(left, 1) * helper(right, 0) + helper(left, 0) * helper(right, 1)
                    }
                }
            }
            idx = s.index(after: idx)
        }
        memo[key] = ans
        return ans
    }
}


let s = "1^0|0|1", result = 0
print(Solution().countEval(s, result))
