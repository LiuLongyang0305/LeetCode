// https://leetcode.com/problems/count-numbers-with-non-decreasing-digits
let radixChars = Array("0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ")
class Solution {
    private let MOD = 1_000_000_007
    private struct KeyNode : Hashable {
        var pos: Int
        var isLessThan:Bool
        var last: Int
    }
    func countNumbers(_ l: String, _ r: String, _ b: Int) -> Int {
        return (clc(r, by: b) - clc(l, by: b) + MOD + (check(l, by: b) ? 1 : 0)) % MOD
    }


    func clc(_ maxNum: String, by radix: Int) -> Int {

        let digitsLimit = getDigits(of: maxNum, by: radix)
        let N = digitsLimit.count

        var memo = [KeyNode:Int]()
        func dfs(_ pos: Int, _ isLessThan: Bool, _ last: Int) -> Int {
            guard pos < N else {return 1}
            let key = KeyNode(pos: pos, isLessThan: isLessThan, last: last)
            if let sb = memo[key] {
                return sb
            }
            let high = isLessThan ? (radix - 1) : digitsLimit[pos]
            var sb = 0
            if last <= high {
                for d in last...high {
                    sb += dfs(pos + 1, isLessThan || d < digitsLimit[pos], d)
                    sb %= MOD
                }
            }
            memo[key] = sb
            return sb
        }

        return dfs(0, false, 0)
    }



    private func check(_ num: String, by radix: Int) -> Bool {

        let digits = getDigits(of: num, by: radix)
        guard digits.count > 1 else {return true}

        let N = digits.count
        for j in stride(from: 1, to: N, by: 1) {
            guard digits[j] >= digits[j - 1] else {return false}
        }
        return true
    }

    private func getDigits(of num: String, by radix: Int) -> [Int] {
        return convertDecimalString(num, toRadix: radix).map { Int($0.asciiValue!) - 48}
    }

    private func getDigits(of num: Int, by radix: Int) -> [Int] {
        return String.init(num,radix: radix).map { Int($0.asciiValue!) - 48}
    }
    private func convertDecimalString(_ decimalStr: String, toRadix radix: Int) -> String {
        guard (2...36).contains(radix) else { return "Invalid radix" }
        var numStr = decimalStr
        var result = ""

        while !numStr.isEmpty {
            var remainder = 0
            var quotient = ""

            // 逐位进行除法运算
            for char in numStr {
                let digit = Int(String(char))!
                let value = remainder * 10 + digit
                let q = value / radix
                remainder = value % radix

                if !quotient.isEmpty || q != 0 { // 避免前导零
                    quotient.append(String(q))
                }
            }

            // 当前余数转换为目标进制字符
            result = String(radixChars[remainder]) + result
            numStr = quotient // 更新下一轮的被除数
        }

        return result.isEmpty ? "0" : result
    }
}

