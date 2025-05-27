// https://leetcode.cn/problems/find-the-substring-with-maximum-cost/
class Solution {
    private var lowercaseToCost:[Character:Int] = ["k": 10, "d": 3, "n": 13, "g": 6, "a": 0, "q": 16, "j": 9, "w": 22, "y": 24, "c": 2, "h": 7, "i": 8, "f": 5, "m": 12, "l": 11, "v": 21, "e": 4, "o": 14, "r": 17, "s": 18, "z": 25, "b": 1, "u": 20, "x": 23, "p": 15, "t": 19]
    func maximumCostSubstring(_ s: String, _ s2: String, _ vals: [Int]) -> Int {
        let chars = [Character](s2)
        for (ch,idx) in lowercaseToCost {
            lowercaseToCost[ch] = idx + 1
        }
        let M = chars.count
        for i in 0..<M {
            lowercaseToCost[chars[i]] = vals[i]
        }
        var last = lowercaseToCost[s.first!]!
        var ans = last

        for ch in s.dropFirst() {
            last = max(last + lowercaseToCost[ch]!, lowercaseToCost[ch]!)
            ans = max(last,ans)
        }
        return max(0,ans)
    }
}
