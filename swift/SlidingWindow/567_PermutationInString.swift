//https://leetcode.com/problems/permutation-in-string/
typealias Counter = [Character:Int]
extension String {
    func countChars() -> Counter {
        var ans = Counter()
        for ch in self {
            if let c = ans[ch] {
                ans[ch] = c + 1
            } else {
                ans[ch] = 1
            }
        }
        return ans
    }
}

class Solution {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        guard s2.count >= s1.count else {
            return false
        }
        let targetCounter = s1.countChars()
        let targetLength = s1.count
        let s2Chars = Array<Character>(s2)
        var tempCounter = String(s2Chars[0..<targetLength ]).countChars()
        guard tempCounter != targetCounter else {
            return true
        }
        for i in targetLength..<s2.count {
            if let c = tempCounter[s2Chars[i - targetLength ]] {
                if c == 1 {
                    tempCounter.removeValue(forKey: s2Chars[i - targetLength])
                } else {
                    tempCounter.updateValue(c - 1, forKey: s2Chars[i - targetLength ])
                }
            }
            if let c = tempCounter[s2Chars[i]] {
                tempCounter.updateValue(c + 1, forKey: s2Chars[i])
            } else {
                tempCounter[s2Chars[i]] = 1
            }
            guard tempCounter != targetCounter else {
                return true
            }
        }
        return  false
    }
}