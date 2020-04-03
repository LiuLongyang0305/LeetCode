// https://leetcode.com/problems/palindrome-permutation/
class Solution {
    func canPermutePalindrome(_ s: String) -> Bool {
        var map: [Character:Bool] = [:]
        for ch in s {
            map.updateValue(!(map[ch] ?? true), forKey: ch)
        }
        var counter = 0
        for (_,flag) in map {
            if !flag {
                counter += 1
            }
        }
        return counter <= 1
    }
}
