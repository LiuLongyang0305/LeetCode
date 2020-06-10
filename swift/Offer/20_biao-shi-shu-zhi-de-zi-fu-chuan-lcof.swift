// https://leetcode-cn.com/problems/biao-shi-shu-zhi-de-zi-fu-chuan-lcof/
class Solution {
    func isNumber(_ s: String) -> Bool {
        var sCopy = s
        while !sCopy.isEmpty  && sCopy.first! == " " {
            sCopy.removeFirst()
        }
        while !sCopy.isEmpty  && sCopy.last! == " " {
            sCopy.removeLast()
        }
        guard !sCopy.isEmpty else {
            return  false
        }
        if sCopy.first!  == "-" || sCopy.first!  == "+" {
            sCopy.removeFirst()
        }
        guard !sCopy.isEmpty else {
            return  false
        }
        guard !sCopy.hasPrefix("-")  && !sCopy.hasPrefix("-") else {
            return false
        }
        if let index = sCopy.firstIndex(of: "e") {
            let left = String(sCopy[sCopy.startIndex..<index])
            let right = String(sCopy[sCopy.index(after: index)..<sCopy.endIndex ])
            // print("\(isInt(left))   \(isInt(right))")
            return (isInt(left) || isDouble(left)) && isInt(right)
        }

        return isDouble(sCopy)  || isInt(sCopy)
    }
    private func  isInt(_ str: String)  -> Bool {
        var sCopy = str
        while sCopy.hasPrefix("0") {
            sCopy.removeFirst()
        }
        return Int(str) != nil
    }
    private func isDouble(_ str: String)  -> Bool {

        if str.hasPrefix(".") || str.hasSuffix("."){
            var strCopy = str
            if strCopy.hasPrefix(".") {
            strCopy.removeFirst()
            } else {
                strCopy.removeLast()
            }
            guard !strCopy.hasPrefix("-") && !strCopy.hasPrefix("+") else {
                return false
            }
            return isInt(strCopy) ? Int(strCopy)! >= 0 : false
        }
        
        if  let index  = str.firstIndex(of: "."){
            let  rightStr = String(str[str.index(after: index)..<str.endIndex])
            return isInt(String(str[str.startIndex..<index]))  && isInt(rightStr) && Int(rightStr)!  >= 0
        }
        return  false
    }
}