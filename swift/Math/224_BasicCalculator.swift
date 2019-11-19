//https://leetcode.com/problems/basic-calculator/
class Solution {
    func calculate(_ s: String) -> Int {
        var chars = [Character]()
        var leftParentheses = [Int]()
        for ch in s {
            if ch.isNumber || ch == "+" ||  ch == "-" || ch == "(" {
                chars.append(ch)
                if ch == "(" {
                    leftParentheses.append(chars.count - 1)
                }
            } else  if ch == ")" {

                let from = leftParentheses.removeLast() + 1
                var str = String(chars[from...])
                chars.removeLast(str.count + 1)
                str = internerCalculate(str)
                
                if str.first! == "-" && !chars.isEmpty{
                    str.removeFirst()
                    let lastSymbol = chars.removeLast()
                    if lastSymbol == "-"  {
                        chars.append("+")
                    } else {
                        chars.append("-")
                    }
                }
                chars.append(contentsOf: str)
            }
        }
        return Int(internerCalculate(String(chars)))!
    }
    private func internerCalculate(_ expression: String) -> String {
        var ans = 0
        var str = ""
        for ch in expression {
            if ch == "+" {
                ans += Int(str)!
                str = ""
            } else if ch == "-" {
                if !str.isEmpty {
                    ans += Int(str)!
                }
                str = "-"
            } else {
                str.append(ch)
            }
        }
        ans += Int(str)!
        return "\(ans)"
    }
}
Solution().calculate("1-(2+3-(4+(5-(1-(2+4-(5+6))))))")