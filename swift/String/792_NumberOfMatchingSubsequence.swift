//https://leetcode.com/problems/number-of-matching-subsequences/
class Solution {
    var charToIndices = Array<Array<Int>>(repeating: Array<Int>(), count: 26)
    let charToIndex: [Character:Int] = ["s": 18, "a": 0, "z": 25, "w": 22, "q": 16, "i": 8, "k": 10, "n": 13, "r": 17, "x": 23, "m": 12, "g": 6, "t": 19, "b": 1, "p": 15, "u": 20, "d": 3, "o": 14, "j": 9, "l": 11, "h": 7, "y": 24, "f": 5, "v": 21, "c": 2, "e": 4]
    func numMatchingSubseq(_ S: String, _ words: [String]) -> Int {
        let SToInt = S.map{ charToIndex[$0]!}
        for i in 0..<S.count {
            charToIndices[SToInt[i]].append(i)
        }
        var ans = 0
        for word in words {
            let wordToInt = word.map{charToIndex[$0]!}
            if match(wordToInt) {
                ans += 1
            }
        }
        return ans
    }
    private func match(_ word: [Int]) -> Bool {
        var maxIndex = -1
        var index = 0
        while index < word.count {
            var left = 0
            let indices = charToIndices[word[index]]
            var right = indices.count
            while left < right {
                let mid = left + (right - left) >> 1
                if indices[mid] > maxIndex {
                    right = mid
                } else if indices[mid] < maxIndex {
                    left = mid + 1
                } else {
                    left = mid + 1
                    break
                }
            }
            if left == indices.count {
                return false
            }
            if index == word.count - 1  {
                return true
            }
            maxIndex = indices[left]
            index += 1
        }
        return false
    }
}