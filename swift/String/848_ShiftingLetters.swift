//https://leetcode.com/problems/shifting-letters/

let indexToCharacters: [Int:Character] = [9: "j", 2: "c", 17: "r", 5: "f", 12: "m", 22: "w", 11: "l", 25: "z", 13: "n", 23: "x", 6: "g", 1: "b", 21: "v", 8: "i", 3: "d", 0: "a", 15: "p", 24: "y", 19: "t", 16: "q", 20: "u", 10: "k", 7: "h", 14: "o", 18: "s", 4: "e"]
let charactersToIndex: [Character:Int] = ["w": 22, "z": 25, "o": 14, "m": 12, "f": 5, "q": 16, "l": 11, "g": 6, "c": 2, "p": 15, "n": 13, "x": 23, "h": 7, "t": 19, "d": 3, "v": 21, "e": 4, "k": 10, "y": 24, "j": 9, "a": 0, "i": 8, "b": 1, "s": 18, "u": 20, "r": 17]

class Solution {
    func shiftingLetters(_ S: String, _ shifts: [Int]) -> String {
        
        var SToChars = Array<Character>(S)
        var i = S.count - 1
        var  currentShift = 0
        var ans = ""
        while i >= 0 {
            currentShift = (currentShift + shifts[i]) % 26
            let index = (charactersToIndex[SToChars[i]]! + currentShift) % 26
            ans.insert(indexToCharacters[index]!, at: ans.startIndex)
            i -= 1
        }
        return ans
    }
}
