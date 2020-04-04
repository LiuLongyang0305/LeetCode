// https://leetcode.com/problems/bold-words-in-string/
class Solution {
    func boldWords(_ words: [String], _ S: String) -> String {
        let SChars = [Character](S)
        var bold = Array<Bool>(repeating: false, count: S.count)
        for word in words {
            guard word.count <= S.count else {
                continue
            }
            let wordChars = [Character](word)
            for i in 0...(S.count - word.count) {
                if SChars[i] == wordChars[0] {
                    var j = 1
                    while j < word.count {
                        if wordChars[j] != SChars[i + j] {
                            break
                        }
                        j += 1
                    }
                    if j == word.count {
                        for k in 0..<word.count {
                            bold[i + k] = true
                        }
                    }
                }
            }
        }
        var ans = ""
        var i = 0
        while i < S.count {
            if !bold[i] {
                ans.append(SChars[i])
                i += 1
                continue
            }
            ans.append("<b>")
            var j = i
            var tempStr = ""
            tempStr.append(SChars[j])
            while j < S.count && bold[j]{
                ans.append(SChars[j])
                j += 1
            }
            ans.append("</b>")
            i = j
        }
        return ans
    }
}
