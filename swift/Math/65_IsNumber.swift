//https://leetcode.com/problems/valid-number/
class Solution {
    private let validCharactersSet = Set<Character>("+-Ee.")
    func isNumber(_ s: String) -> Bool {
        guard !isInvalidcharacterExisted(s) else {
            return false
        }
        if let idx = s.firstIndex(where: {$0 == "E" || $0 == "e"}) {
            guard idx != s.startIndex && idx != s.index(before: s.endIndex) else {
                return false
            }
            let left = String(s[..<idx])
            let right = String(s[s.index(after: idx)...])
            guard isInteger(left) || isFloat(left) else {
                return false
            }
            return isInteger(right)
        }
         
        return s.contains(".") ?  isFloat(s) : isInteger(s)
        
    }
    private func isInteger(_ str: String) -> Bool {
        guard !str.isEmpty else {
            return false
        }
        var num = str
        if let f = num.first, f == "+" || f == "-" {
            num.removeFirst()
            guard !num.isEmpty else {
                return false
            }
        }
        for ch in num {
            guard ch.isNumber else {
                return false
            }
        }
        return true
    }
    private func isFloat(_ str: String) -> Bool {
        var floatNum = str
        if let f = floatNum.first, f == "+" || f == "-" {
            floatNum.removeFirst()
        }
        guard floatNum.count >= 2 else {
            return false
        }
        guard let index = floatNum.firstIndex(of: ".") else {
            return false
        }
        var idx = floatNum.startIndex
        while idx < floatNum.endIndex {
            if idx != index {
                guard floatNum[idx].isNumber else {
                    return false
                }
            }
            idx = floatNum.index(after: idx)
        }
        return true
    }
    private func isInvalidcharacterExisted(_ str: String) -> Bool {
        var counter  = [Character: Int]()
        for ch in str {
            guard ch.isNumber || validCharactersSet.contains(ch) else {
                return true
            }
            if validCharactersSet.contains(ch) {
                var key = ch
                if ch == "E" {
                    key  = "e"
                } else if ch == "-" {
                    key = "+"
                }
                counter[key,default: 0] += 1
            }
        }
        guard (counter["+"] ?? 0) <= 2 else {
            return true
        }
        guard (counter["e"] ?? 0) <= 1 else {
            return true
        }
        guard (counter["."] ?? 0) <= 1 else {
            return true
        }
        return false
    }
}

