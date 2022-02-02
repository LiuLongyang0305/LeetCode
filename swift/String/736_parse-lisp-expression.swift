// https://leetcode.com/problems/parse-lisp-expression/
class Solution {
    private typealias NameToVal = Dictionary<String,Int>
    func evaluate(_ expression: String) -> Int {
        return helper(String(expression.dropLast().dropFirst()), NameToVal())
    }
    private func helper(_ expression: String, _ vars: NameToVal) -> Int {
        var expressionCopy = expression
        //判断表达式类型
        if expression.hasPrefix("let") {
            //"let"表达式先计算成对的，最后返回最终的表达式
            var localVars = vars
            expressionCopy.removeFirst(4)
            while !expressionCopy.isEmpty {
                let name = split(expressionCopy)
                guard name != expressionCopy else {
                    return getVal(expressionCopy, localVars)
                }
                expressionCopy.removeFirst(name.count + 1)
                let valStr = split(expressionCopy)
                let val = getVal(valStr, localVars)
                expressionCopy.removeFirst(valStr.count + 1)
                localVars[name] = val
            }
        } else if expression.hasPrefix("add") {
            //区分两个数，并相加
            expressionCopy.removeFirst(4)
            let fs = split(expressionCopy)
            let fn = getVal(fs, vars)
            expressionCopy.removeFirst(fs.count + 1)
            return getVal(expressionCopy, vars) + fn
        } else if expression.hasPrefix("mult") {
            //区分两个数，并相乘
            expressionCopy.removeFirst(5)
            let fs = split(expressionCopy)
            let fn = getVal(fs, vars)
            expressionCopy.removeFirst(fs.count + 1)
            return getVal(expressionCopy, vars) * fn
        }
        return -1
    }
    // 分割：表达式或者字符串或者直接的数字
    private func  split(_ expression: String) -> String {
        guard expression.first! == "(" else {
            if let idx = expression.firstIndex(of: " ") {
                return String(expression[..<idx])
            } else {
                return expression
            }
        }
        var level = 0
        var idx = expression.startIndex
        while idx < expression.endIndex {
            if expression[idx] == "(" {
                level += 1
            } else if expression[idx] == ")" {
                level -= 1
            }
            guard level != 0 else {
                return String(expression[...idx])
            }
            idx = expression.index(after: idx)
        }
        return expression
    }
    
    // 求值
    private  func  getVal(_ str: String, _ vars: NameToVal) -> Int {
        return Int(str) ?? (vars[str] ?? helper(String(str.dropFirst().dropLast()), vars))
    }
}