// https://leetcode.com/problems/odd-string-difference/
class Solution {
    private var N = 0
    func oddString(_ words: [String]) -> String {
        self.N = words[0].count
        let M = words.count
        let first = getDiff(words[0])
        let second = getDiff(words[1])
        if first == second {
            for i in 2..<M {
                guard getDiff(words[i]) == first else {return words[i]}
            }
        } else {
            let last = getDiff(words.last!)
            return  words[last == first ? 1 : 0]
        }
        return ""
    }

    private func  getDiff(_ word: String) -> [Int] {
        var ans = [Int]()
        var lastIdx = word.startIndex
        var secondIdx = word.index(after: word.startIndex)
        while secondIdx < word.endIndex {
            ans.append(Int(word[secondIdx].asciiValue!) - Int(word[lastIdx].asciiValue!))
            lastIdx = secondIdx
            secondIdx = word.index(after: secondIdx)
        }
        return ans
    }
}
