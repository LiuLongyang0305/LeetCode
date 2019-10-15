//https://leetcode.com/problems/greatest-common-divisor-of-strings/
class Solution {
    func gcdOfStrings(_ str1: String, _ str2: String) -> String {
        guard str2 + str1 ==  str1 + str2 else {
            return ""
        }

        let longerStr  = str2.count < str1.count ? str1 :  str2
        let shorterStr = longerStr == str2 ? str1 : str2
        
        var counteShorterStr = [Character:Int]()
        for ele in  shorterStr {
            if let c = counteShorterStr[ele] {
                counteShorterStr[ele] = c + 1
            } else {
                counteShorterStr[ele] = 1
            }
        }
        let minCount = counteShorterStr.values.min()!
        guard minCount != 1 else {
            return shorterStr
        }
        var i = 1
        while i <= minCount {
            let targetLength = shorterStr.count / i
            if longerStr.count % targetLength == 0 {
                let endIndex = shorterStr.index(shorterStr.startIndex, offsetBy: targetLength)
                let str = String(shorterStr[shorterStr.startIndex..<endIndex])
                var longStrCopy = longerStr
                while longStrCopy.hasPrefix(str) {
                    longStrCopy.removeFirst(targetLength)
                }
                if longStrCopy.isEmpty {
                    return str
                }
            }
            i += 1
        }
        return ""
    }
}


class Solution2 {
    func gcdOfStrings(_ str1: String, _ str2: String) -> String {
        guard str2 + str1 == str1 + str2 else {
            return ""
        }
        let length = gcd(number1: str2.count, number2: str1.count)
        let endIndex = str2.index(str2.startIndex, offsetBy: length)
        return String(str2[str2.startIndex..<endIndex])
    }
    func gcd(number1: Int,number2: Int) -> Int {
        return number2 == 0 ? number1 : gcd(number1: number2, number2: number1 % number2)
    }
}

class Solution3 {
    func gcdOfStrings(_ str1: String, _ str2: String) -> String {
        //判断是否有公因子
        guard str2 + str1 ==  str1 + str2 else {
            return ""
        }
        return gcd(str1, str2)
    }
    private func gcd(_ str1: String,  _ str2: String) -> String {
        if str2.count == 0 {
            return str1
        }
        var str1Copy = str1
        while str1Copy.hasPrefix(str2) {
            str1Copy.removeFirst(str2.count)
        }
        return gcd(str2, str1Copy)
    }
}
