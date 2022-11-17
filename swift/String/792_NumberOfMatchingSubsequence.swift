//https://leetcode.com/problems/number-of-matching-subsequences/
class Solution {
    private let charToIndex:[Character:Int] =  ["s": 18, "a": 0, "z": 25, "w": 22, "q": 16, "i": 8, "k": 10, "n": 13, "r": 17, "x": 23, "m": 12, "g": 6, "t": 19, "b": 1, "p": 15, "u": 20, "d": 3, "o": 14, "j": 9, "l": 11, "h": 7, "y": 24, "f": 5, "v": 21, "c": 2, "e": 4]
    func numMatchingSubseq(_ s: String, _ words: [String]) -> Int {
        var charToIndices = [[Int]](repeating: [-1], count: 26)
        let N = s.count
        var idx = 0
        for ch in s {
            charToIndices[charToIndex[ch]!].append(idx)
            idx += 1
        }
        for i in 0..<26 {
            charToIndices[i].append(N)
        }

        func  binarySearch(_ ch: Character, target: Int) -> Int {
            let idx = charToIndex[ch]!
            var left = 0
            var right = charToIndices[idx].count - 1
            while left < right {
                let mid = (left + right) >> 1
                if charToIndices[idx][mid] > target {
                    right = mid
                } else {
                    left = mid + 1
                }
            }
            return charToIndices[idx][left]
        }

        func match(_ word: String) -> Bool {
            var lastIdx = -1
            for ch in word {
                let idx = binarySearch(ch, target: lastIdx)
                guard idx < N else {return false}
                lastIdx = idx
            }
            return true
        }

        return words.reduce(0) {$0 + (match($1) ? 1 : 0)}
    }
}
