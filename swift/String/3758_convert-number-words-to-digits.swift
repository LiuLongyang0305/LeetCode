//https://leetcode.cn/problems/convert-number-words-to-digits/
class Solution {
    let digitWords: [String] = [
        "zero",     // 0
        "one",      // 1
        "two",      // 2
        "three",    // 3
        "four",     // 4
        "five",     // 5
        "six",      // 6
        "seven",    // 7
        "eight",    // 8
        "nine"      // 9
    ]
    func convertNumber(_ s: String) -> String {
        var t = s
        var sb = ""
        while !t.isEmpty {
            var flag = false
            for i in 0..<10 {
                if t.hasPrefix(digitWords[i]) {
                    sb += "\(i)"
                    t.removeFirst(digitWords[i].count)
                    flag = true
                    break
                }
            }
            if !flag {
                t.removeFirst()
            }
        }
        return sb
    }
}
