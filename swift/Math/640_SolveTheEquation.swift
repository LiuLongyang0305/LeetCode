//https://leetcode.com/problems/solve-the-equation/
class Solution {
    func solveEquation(_ equation: String) -> String {
        let compoments = equation.split(separator: "=")
        var leftStrs = getStrs(String(compoments[0]))
        var rightStrs = getStrs(String(compoments[1]))
        var left = 0
        var right = 0
        for i in 0..<leftStrs.count {
            if leftStrs[i].hasSuffix("x")  {
                leftStrs[i].removeLast()
                left += leftStrs[i].isEmpty ? 1  : leftStrs[i] == "-" ? -1 : Int(leftStrs[i])!
            } else {
                right -= Int(leftStrs[i])!
            }
        }
        for i in 0..<rightStrs.count {
            if rightStrs[i].hasSuffix("x")  {
                rightStrs[i].removeLast()
                left -= rightStrs[i].isEmpty ? 1 : rightStrs[i] == "-" ? -1 : Int(rightStrs[i])!
            } else {
                right += Int(rightStrs[i])!
            }
        }
        
        guard left != 0 else {
            if right == 0 {
                return "Infinite solutions"
            }
            return "No solution"
        }
        return "x=\(right/left)"
    }
    private func getStrs(_ str: String) -> [String] {
        var ans = [String]()
        var strCopy = str
        var temp = ""
        while !strCopy.isEmpty {
            let ch = strCopy.removeFirst()
            if ch == "+" {
                ans.append(temp)
                temp = ""
            } else if ch == "-" {
                if !temp.isEmpty {
                    ans.append(temp)
                }
                temp = "-"
            } else {
                temp.append(ch)
            }
        }
        ans.append(temp)
        return ans
    }
}