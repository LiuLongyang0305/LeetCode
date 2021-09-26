// https://leetcode.com/problems/check-if-word-can-be-placed-in-crossword/
class Solution {
    private func check(_ ps: [Character], _ word: [Character],_ reversedWord: [Character]) -> Bool {
        let positions = ["#"] + ps + ["#"]
        let N = positions.count
        var last = 0
        var cur = 0
        while cur < N {
            while cur < N && positions[cur] != "#" {
                cur += 1
            }
            if check(positions, last + 1, cur - 1, word) || check(positions, last + 1, cur - 1, reversedWord) {
                return true
            }
            last = cur
            cur += 1
        }
        return false
    }
    private func check(_ row:[Character], _ from: Int,_ to: Int, _ word: [Character]) -> Bool {
        let length = to - from + 1
        guard length == word.count else {
            return false
        }
        for i in 0..<length {
            if row[i + from].isLowercase {
                guard row[i + from] == word[i] else {
                    return false
                }
            }
        }
        return true;
    }
    func placeWordInCrossword(_ board: [[Character]], _ w: String) -> Bool {
        
        let word = [Character](w)
        let reversedWord = [Character](word.reversed())
        
        for row in board {
            if check(row, word, reversedWord)  {
                return true
                
            }
        }
        let N = board[0].count
        for c in 0..<N {
            var col = [Character]()
            for row in board {
                col.append(row[c])
            }
            if check(col, word, reversedWord) {
                return true
            }
        }
        
        return false
    }
}


