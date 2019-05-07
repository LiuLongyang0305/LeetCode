//https://leetcode.com/problems/string-to-integer-atoi/
class Solution {
    func myAtoi(_ str: String) -> Int {
        if str.isEmpty {
            return 0
        }
        if isMatched(str: str) {
            var result : Int = 0
            var isNegtive = false
            var flag = false
            let dic : Dictionary<Character,Int> = ["0":0,"1":1,"2":2,"3":3,"4":4,"5":5,"6":6,"7":7,"8":8,"9":9]
            for ch in str {
                if ch == " "{
                    if !flag {
                        continue
                    } else {
                        break
                    }
                } else if ch == "+" || ch == "-" {
                       if !flag {
                        flag = true
                        if ch == "-" {
                            isNegtive = true
                        }
                    } else {
                        break
                    }
                } else if dic[ch] != nil {
                    if !flag {
                        flag = true
                    }
                                        result = 10 * result + dic[ch]!
                    if result > Int32.max {
                        return isNegtive ? Int(Int32.min) : Int(Int32.max)
                    }
 
                } else if ch == "." {
                    return result
                } else {
                    break
                }
            }
            if isNegtive {
                result *= -1
            }
            return result
        }
        return 0
    }
    public func isMatched(str : String) -> Bool {
        let pattern = "^[\\s]{0,}[\\+,\\-]{0,1}[0]{0,}[1-9]{1}[0-9]{0,}[\\.]{0,1}[0-9]{0,}"
        let reg = try? NSRegularExpression(pattern: pattern, options: [])
        if let results  = reg?.matches(in: str, options: [], range: NSRange(location: 0, length: str.count)) {
            if results.isEmpty {
                return false
            }
            return true
        }
        return false
    }
}