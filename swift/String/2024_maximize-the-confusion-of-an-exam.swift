//https://leetcode.com/problems/maximize-the-confusion-of-an-exam/
let uppercaseLetterToInt: [Character:Int] = ["E": 4, "Y": 24, "L": 11, "P": 15, "D": 3, "I": 8, "R": 17, "K": 10, "M": 12, "U": 20, "V": 21, "O": 14, "C": 2, "A": 0, "X": 23, "S": 18, "N": 13, "F": 5, "B": 1, "T": 19, "Z": 25, "H": 7, "J": 9, "Q": 16, "G": 6, "W": 22]
 let lowercaseLetterToInt: [Character:Int]  = ["i": 8, "n": 13, "f": 5, "z": 25, "c": 2, "y": 24, "s": 18, "o": 14, "q": 16, "j": 9, "l": 11, "g": 6, "u": 20, "k": 10, "p": 15, "b": 1, "a": 0, "e": 4, "r": 17, "d": 3, "x": 23, "v": 21, "m": 12, "w": 22, "t": 19, "h": 7]
 class Solution {
     func maxConsecutiveAnswers(_ s: String, _ k: Int) -> Int {
         guard !s.isEmpty else {
             return 0
         }
         let chars = Array<Character>(s)
         var counter = Array<Int>(repeating: 0, count: 26)
         var left = 0
         var ans = 0
         var maxCount = 0
         for right in 0..<s.count {
             counter[uppercaseLetterToInt[chars[right]]!] += 1
             maxCount = max(maxCount,counter[uppercaseLetterToInt[chars[right]]!])
             while right - left + 1  - maxCount > k {
                 counter[uppercaseLetterToInt[chars[left]]!] -= 1
                 left += 1
             }
             ans = max(ans, right -  left + 1)
         }
         return ans
     }
 }