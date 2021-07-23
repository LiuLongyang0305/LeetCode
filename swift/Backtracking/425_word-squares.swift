// https://leetcode.com/problems/word-squares/
class Solution {
    
    private var ans = [[String]]()
    private var preffixToWord = [[Character]:[[Character]]]()
    private var squreLength = -1
    func wordSquares(_ words: [String]) -> [[String]] {
        self.ans = []
        self.preffixToWord = [:]
        self.squreLength = words.first!.count
        
        let wordToChars = words.map {[Character]($0)}
        for word in wordToChars {
            var preffix = [Character]()
            for ch in word.dropLast() {
                preffix.append(ch)
                preffixToWord[preffix, default: []].append(word)
            }
        }
        var curSqure = [[Character]]()
        for word in wordToChars {
            curSqure.append(word)
            helper(&curSqure)
            curSqure.removeLast()
        }
        return self.ans
    }
    
    
    private func helper(_ cur: inout [[Character]]) {
        guard cur.count < self.squreLength else {
            if check(cur) {
                self.ans.append(cur.map({ String($0)}))
            }
            return
        }
        let N = cur.count
        var preffix = [Character]()
        for r in 0..<N {
            preffix.append(cur[r][N])
        }
        guard let nextWords = preffixToWord[preffix] else {
            return
        }
        for nw in nextWords {
            cur.append(nw)
            helper(&cur)
            cur.removeLast()
        }
    }
    
    
    private func check(_ cur: [[Character]]) -> Bool {
//        print(cur)
        for col in 0..<self.squreLength {
            //列单词
            var curWord = [Character]()
            for row in 0..<self.squreLength {
                curWord.append(cur[row][col])
            }
            guard curWord == cur[col] else {
                return false
            }
        }
        return true
    }
}