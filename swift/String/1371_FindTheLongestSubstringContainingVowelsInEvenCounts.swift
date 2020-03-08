// https://leetcode.com/problems/find-the-longest-substring-containing-vowels-in-even-counts/
class Solution {
    private let map: [Character:Int] = ["a":0,"e": 1,"i":2,"o":3,"u":4]
    func findTheLongestSubstring(_ s: String) -> Int {
        var maxLength = 0
        var firstIndexOfCounter = [Int8:Int]()
        var counter: Int8 = 0
        firstIndexOfCounter[0] = -1
        var i = 0
        for ch in s {
            
            if let index = map[ch] {
                counter ^= (1 << index)
            }
            if let first =  firstIndexOfCounter[counter] {
                maxLength = max(maxLength, i - first)
            } else {
                firstIndexOfCounter[counter] = i
            }
            i += 1
        }
        return maxLength
    }
 }