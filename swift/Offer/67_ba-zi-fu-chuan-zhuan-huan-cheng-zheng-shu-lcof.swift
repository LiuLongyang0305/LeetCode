// https://leetcode-cn.com/problems/ba-zi-fu-chuan-zhuan-huan-cheng-zheng-shu-lcof/
class Solution {
    func strToInt(_ str: String) -> Int {
        var s = ""
        for ch in str {
            if ch == "+" || ch == "-" {
                guard s.isEmpty else {
                    break
                }
                s.append(ch)
            } else if ch.isNumber {
                s.append(ch)
            } else if ch == " " && s.isEmpty{
                continue
            } else {
                break
            }
        }
        // print(s)
        guard !s.isEmpty else {
            return 0
        }
        if let index = s.firstIndex(of: "+") {
            guard index == s.startIndex else {
                return 0
            }
        }
        if let index = s.firstIndex(of: "-") {
            guard index == s.startIndex else {
                return 0
            }
        }
        let symbol = s.first! == "-" ? -1 : 1
        
        if let firstChar = s.first, firstChar == "+" || firstChar == "-" {
            s.removeFirst()
        }
        while !s.isEmpty && s.first! == "0" {
            s.removeFirst()
        }
        guard !s.isEmpty else {
            return 0
        }
        if s.count > 11 {
            s.removeLast(s.count - 11)
        }
        guard var num = Int(s) else {
            return 0
        }
        num *= symbol
        if num > Int32.max {
            return Int(Int32.max)
        }
        if num < Int32.min {
            return Int(Int32.min)
        }
        return num
        
    }
}