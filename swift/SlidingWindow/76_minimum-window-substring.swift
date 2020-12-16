// https://leetcode.com/problems/minimum-window-substring/
class Solution {
    private typealias Counter = [Character:Int]
    private var charToIndex: [Character:Int] = [Character:Int]()
    init() {
        (97...122).forEach { charToIndex[Character(Unicode.Scalar.init($0)!)] = $0 - 97}
        (65...90).forEach { charToIndex[Character(Unicode.Scalar.init($0)!)] = $0 - 39}
    }
    func minWindow(_ s: String, _ t: String) -> String {
        let N = s.count
        let M = t.count
        guard N >= M else {
            return ""
        }
        var tCounter = Array<Int>(repeating: 0, count: 52)
        t.forEach {tCounter[charToIndex[$0]!] += 1}
        
        
        var l = s.startIndex
        var r = s.startIndex
        
        var ans = ""
        var substrCounter = Array<Int>(repeating: 0, count: 52)
        
        func check() -> Bool {
            for idx in 0..<52 {
                guard substrCounter[idx] >= tCounter[idx] else {
                    return false
                }
            }
            return true
        }
        while r < s.endIndex {
            while r < s.endIndex && !check() {
                substrCounter[charToIndex[s[r]]!] += 1
                r = s.index(after: r)
            }
            guard check() else {
                return ans
            }
            while check() {
                substrCounter[charToIndex[s[l]]!] -= 1
                l = s.index(after: l)
            }
            let temp = String(s[s.index(before: l)..<r ])
            if ans.isEmpty {
                ans = temp
            } else {
                if ans.count > temp.count {
                    ans = temp
                }
            }
        }
        return ans
    }
}