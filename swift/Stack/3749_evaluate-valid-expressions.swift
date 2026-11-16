//https://leetcode.cn/problems/evaluate-valid-expressions/
class Solution {

    private let opeToVal = ["add":0,"sub":1,"mul":2,"div":3]
    let opesSet: Set<String> = ["add","sub","mul","div"]
    private func cal(_ f: Int, _ s: Int, _ ope: String) -> Int {
        switch opeToVal[ope]! {
            case 0:
                return f + s
            case 1:
                return f - s
            case 2:
                return f * s
            case 3:
                return f / s
            default:
                return -1
        }
    }
    func evaluateExpression(_ expression: String) -> Int {

        if let v = Int(expression) {
            return v
        }

        var values = [[Int]]()
        var opes = [String]()
        let chars = [Character](expression)
        let M = chars.count
        var l = 0

        while l < M {
            var cur = ""
            var r = l
            while r < M && chars[r] != "(" && chars[r] != ")" && chars[r] != "," {
                cur.append(chars[r])
                r += 1
            }
            //遇见左括号
            if chars[r] == "(" {
                opes.append(cur)
                values.append([])
            } else if chars[r] == "," {
                if let v = Int(cur) {
                    values[values.count - 1].append(v)
                }
            } else if chars[r] == ")" {
                if let v = Int(cur) {
                    values[values.count - 1].append(v)
                }
                while let last = values.last, last.count == 2 {
                    let v = cal(last[0], last[1], opes.removeLast())
                    values.removeLast()
                    if values.isEmpty {
                        return v
                    } else {
                        values[values.count - 1].append(v)
                    }
                }
            }
            l = r + 1
        }


        return -1
    }

}
