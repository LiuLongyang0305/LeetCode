// https://leetcode.com/problems/add-bold-tag-in-string/
class Solution {
    private let PREFIX = "<b>"
    private let SUFFIX = "</b>"
    func addBoldTag(_ s: String, _ dict: [String]) -> String {
        let chars = [Character](s)
        let N = chars.count
        var isBold = Array<Bool>(repeating: false, count: N)
        func updateIsBold( _ word: String) {
            let wordLength = word.count
            guard N >= wordLength else {
                return
            }
            let wordChars = [Character](word)
            var idx = 0
            while idx <= N - wordLength {
                var flag = true
                for j in 0..<wordLength {
                    guard wordChars[j] == chars[idx + j] else {
                        flag = false
                        break
                    }
                }
                if flag {
                    (0..<wordLength).forEach {isBold[idx + $0] = true}
                }
                idx += 1
            }
        }
        for word in dict {
            updateIsBold(word)
        }
//        print(isBold)
        var ans = ""
        for idx in 0..<N {
            if isBold[idx] && (idx == 0 || !isBold[idx - 1]) {
                ans.append(PREFIX)
            }
            if !isBold[idx] && idx > 0 && isBold[idx - 1]  {
                ans.append(SUFFIX)
            }
            ans.append(chars[idx])
        }
        if isBold[N - 1] {
            ans.append(SUFFIX)
        }
        return ans
    }
}

