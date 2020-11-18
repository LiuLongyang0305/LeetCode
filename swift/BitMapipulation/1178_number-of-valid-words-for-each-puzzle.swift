// https://leetcode.com/problems/number-of-valid-words-for-each-puzzle/
class Solution {
    private let mapCharToBit: [Character:Int] = ["a": 0, "k": 10, "u": 20, "l": 11, "d": 3, "m": 12, "z": 25, "i": 8, "f": 5, "q": 16, "v": 21, "j": 9, "e": 4, "b": 1, "s": 18, "x": 23, "p": 15, "r": 17, "t": 19, "w": 22, "g": 6, "h": 7, "y": 24, "c": 2, "o": 14, "n": 13]
    func findNumOfValidWords(_ words: [String], _ puzzles: [String]) -> [Int] {
        var ans = Array<Int>()
        var maskCounter = [Int: Int]()
        for word in words {
            maskCounter[getMask(of: word), default: 0] += 1
        }
        func getValidWordsCount(of puzzle:  String) -> Int {
            let puzzleMask = getMask(of: puzzle)
            var ans = 0
            let firstCharMask = 1 << mapCharToBit[puzzle.first!]!
            var temp = puzzleMask
            while temp > 0 {
                if firstCharMask & temp > 0 , let c = maskCounter[temp]{
                   ans += c
                }
                temp = (temp - 1) & puzzleMask
            }
            return ans
        }
        for puzzle in puzzles {
            ans.append(getValidWordsCount(of: puzzle))
        }
        return ans
    }
    
    func getMask(of str: String) -> Int {
        var ans = 0
        str.forEach {ans = ans | (1 << mapCharToBit[$0]!)}
        return ans
    }
}