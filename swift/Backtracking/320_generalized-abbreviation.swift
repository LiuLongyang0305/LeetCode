// https://leetcode.com/problems/generalized-abbreviation/
class Solution {
    private var ans = [String]()
    private var word = [Character]()
    func generateAbbreviations(_ word: String) -> [String] {
        self.word = [Character](word)
        backtracking(0, 0, "")
        return ans
    }
    private func backtracking(_ index: Int, _ cnt: Int, _ curStr:  String) {
        if index == word.count {
            ans.append(curStr + (cnt > 0 ? "\(cnt)" : ""))
            return
        }
        backtracking(index + 1, cnt + 1, curStr)
        var strCopy = curStr
        if cnt > 0 {
            strCopy += "\(cnt)"
        }
        strCopy.append(word[index])
        backtracking(index + 1, 0, strCopy)
    }
}
