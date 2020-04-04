// https://leetcode.com/problems/index-pairs-of-a-string/
class Solution {
    func indexPairs(_ text: String, _ words: [String]) -> [[Int]] {
        let textChars = [Character](text)
        var ans = [[Int]]()
        for word in words {
            guard word.count <= text.count else {
                continue
            }
            let wordChars = [Character](word)
            for i in 0...(text.count - word.count) {
                if textChars[i] == wordChars[0] {
                    var j = 0
                    while j < word.count {
                        if wordChars[j] != textChars[i + j] {
                            break
                        }
                        j += 1
                    }
                    if j == word.count {
                        ans.append([i,i + j - 1])
                    }
                }
            }
        }
        ans.sort { (indices1, indices2) -> Bool in
            if indices1[0] == indices2[0] {
                return indices1[1] < indices2[1]
            }
            return indices1[0] < indices2[0]
        }
        return ans
    }
}
