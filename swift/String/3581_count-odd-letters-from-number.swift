let digitsStr: [String] = [
    "zero",   // 0
    "one",    // 1
    "two",    // 2
    "three",  // 3
    "four",   // 4
    "five",   // 5
    "six",    // 6
    "seven",  // 7
    "eight",  // 8
    "nine"    // 9
]
    //https://leetcode.cn/problems/count-odd-letters-from-number/
    class Solution {
        func countOddLetters(_ n: Int) -> Int {
            var cnt = [Character:Bool]()

            for ch in getNumStr(n) {
                if var f = cnt[ch] {
                    f.toggle()
                    cnt[ch] = f
                } else {
                    cnt[ch] = true
                }
            }

            return cnt.values.reduce(0) { $0 + ($1 ? 1 : 0)}
        }
        private func getNumStr(_ n: Int) -> String {
            var sb = ""
            var t = n
            while t > 0 {
                sb += digitsStr[t % 10]
                t /= 10
            }
            return sb
        }
    }
