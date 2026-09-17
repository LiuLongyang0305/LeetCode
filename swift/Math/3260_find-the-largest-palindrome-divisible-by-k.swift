    // https://leetcode.cn/problems/find-the-largest-palindrome-divisible-by-k/
class Solution {
    func largestPalindrome(_ n: Int, _ k: Int) -> String {
        if k == 1 || k == 3 || k == 9 {
            return String(repeating: "9", count: n)
        }
        if k == 2 {
            if n <= 2 {
                return String(repeating: "8", count: n)
            }

            return "8\(String(repeating: "9", count: n - 2))8"
        }
        if k == 4 {
            if n <= 4 {
                return String(repeating: "8", count: n)
            }
            return "88\(String(repeating: "9", count: n - 4))88"
        }
        if k == 8 {
            if n <= 6 {
                return String(repeating: "8", count: n)
            }
            return  "888\(String(repeating: "9", count: n - 6))888"
        }
        if k == 5 {
            if n <= 2 {
                return  String(repeating: "5", count: n)
            }
            return   "5\(String(repeating: "9", count: n - 2))5"
        }
        if k == 6 {
            if n == 1 {return "6"}
            if n == 2 {return "66"}
            if n % 2 == 1 {
                let t = (n - 3) / 2
                let half = String(repeating: "9", count: t)
                return "8\(half)8\(half)8"
            } else {
                let t = (n - 4) / 2
                let str = String(repeating: "9", count: t)
                return "8\(str)77\(str)8"
            }
        }

        if k == 7 {
            if n <= 2 {
                return String(repeating: "7", count: n)
            }
            for digit in stride(from: 9, through: 0, by: -1) {
                if check(n, digit) {
                    let half = n / 2
                    let flag = n % 2 == 0 ? true : false
                    let haslStr = String(repeating: "9", count: flag ? (half - 1) : half)
                    return haslStr + String(repeating: "\(digit)", count: flag ? 2 : 1) + haslStr
                }
            }
        }
        return ""
    }

    private func check(_ n: Int, _ digit:Int) -> Bool {
        var half = n >> 1
        let limit = half
        let isEvenNumber = n & 1 == 0
        if isEvenNumber {
            half -= 1
        }
        var remainder = 0
        for _ in stride(from: 0, to: half, by: 1) {
            remainder = 10 * remainder + 9
            remainder %= 7
        }
        remainder = (isEvenNumber ? 100 : 10) * remainder + digit * (isEvenNumber ? 11 : 1)
        remainder %= 7
        for _ in stride(from: 0, to: half, by: 1) {
            remainder = 10 * remainder + 9
            remainder %= 7
        }
        return remainder == 0
    }
}
