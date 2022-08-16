// https://leetcode.com/problems/construct-smallest-number-from-di-string/
class Solution {
    func smallestNumber(_ pattern: String) -> String {
        let patternChars = [Character](pattern)
        let N = pattern.count
        let M = N + 1
        var ans = ""

        func getDigits(of num: Int) -> [Int] {
            var ans = [Int]()
            var t = num
            while t > 0 {
                ans.insert(t % 10, at: 0)
                t /= 10
            }
            return ans
        }

        func check(_ num: Int) -> Bool {
            let digits = getDigits(of: num)
            for idx in 0..<N {
                if patternChars[idx] == "D" {
                    guard digits[idx + 1] < digits[idx] else {
                        return false
                    }
                } else if patternChars[idx] == "I" {
                    guard digits[idx + 1] > digits[idx] else {
                        return false
                    }
                }
            }

            return true
        }


        func dfs(_ num: Int, _ visited:Int) {
            guard ans.isEmpty else {return}
            guard  M != visited.nonzeroBitCount else {
                if check(num) {
                    ans = "\(num)"
                }
                return
            }

            for digit in 1...M {
                guard visited & (1 << digit) == 0 else {continue}
                dfs(num * 10 + digit, visited | (1 << digit))
            }
        }


        dfs(0, 0)
        return ans
    }
}