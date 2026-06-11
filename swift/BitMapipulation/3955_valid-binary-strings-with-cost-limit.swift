    // https://leetcode.cn/problems/valid-binary-strings-with-cost-limit/
    class Solution {
        func generateValidStrings(_ n: Int, _ k: Int) -> [String] {
            var sb = [String]()
            for num in 0..<(1 << n) {
                var str = String(num,radix: 2)
                if str.count < n {
                    str = String(repeating: "0", count: n - str.count) + str
                }
                if check(str, k) {
                    sb.append(str)
                }
            }
            return sb
        }
        private func check(_ str: String, _ costLimit: Int) -> Bool {
            if let _ = str.firstRange(of: "11") {return false}
            return calScore(str) <= costLimit
        }
        private func calScore(_ str: String) -> Int {
            var score = 0
            var i = 0
            for ch in str {
                if ch == "1" {
                    score += i
                }
                i += 1
            }
            return score
        }
    }
