//https://leetcode.cn/problems/find-all-anagrams-in-a-string/
class Solution {
    let chToIndex: [Character:Int] = ["k": 10, "d": 3, "n": 13, "g": 6, "a": 0, "q": 16, "j": 9, "w": 22, "y": 24, "c": 2, "h": 7, "i": 8, "f": 5, "m": 12, "l": 11, "v": 21, "e": 4, "o": 14, "r": 17, "s": 18, "z": 25, "b": 1, "u": 20, "x": 23, "p": 15, "t": 19]
    func findAnagrams(_ s: String, _ p: String) -> [Int] {
        guard p.count <= s.count else {return []}
        var PCounter = [Int](repeating: 0, count: 26)
        for ch in p {
            PCounter[chToIndex[ch]!] += 1
        }

        var ans = [Int]()
        let sToChars = [Character](s)
        var curCounter = [Int](repeating: 0, count: 26)
        var j = 0
        while j < p.count  {
            curCounter[chToIndex[sToChars[j]]!] += 1
            j += 1
        }
        if curCounter == PCounter {
            ans.append(0)
        }
        var i = 0
        while j < s.count {
            curCounter[chToIndex[ sToChars[i]]!] -= 1
            curCounter[chToIndex[ sToChars[j]]!] += 1
            if curCounter == PCounter {
                ans.append(i + 1)
            }
            j += 1
            i += 1
        }

        return ans
    }
}