//https://leetcode.com/problems/additive-number/submissions/
class Solution {
    func isAdditiveNumber(_ num: String) -> Bool {
        
        func dfs(_ first: Int,_ second: Int, str: inout String) -> Bool {
            // print("first  = \(first) second =  \(second) str = \(str)")
            
            let sum = first + second
            let sumStr = "\(sum)"
            guard str.hasPrefix(sumStr) else {
                return false
            }
            str.removeFirst(sumStr.count)
            guard !str.isEmpty else {
                return true
            }
            return dfs(second, sum, str: &str)
        }
        
        let length =  max(num.count, 19)
        for firstLength in 1..<length {
            for secondLength in 1..<length {
                let thirdLength = num.count  - firstLength -  secondLength
                if  thirdLength > 0 {
                    var numCopy = num
                    if !numCopy.hasPrefix("0") || firstLength ==  1  {
                        if let firstNumber = Int(String(numCopy[numCopy.startIndex...numCopy.index(numCopy.startIndex, offsetBy: firstLength - 1)])) {
                            numCopy.removeFirst(firstLength)
                            if !numCopy.hasPrefix("0") || secondLength == 1 {
                                if let secondNumber = Int(String(numCopy[numCopy.startIndex...numCopy.index(numCopy.startIndex, offsetBy: secondLength - 1)])) {
                                    numCopy.removeFirst(secondLength)
                                    if dfs(firstNumber, secondNumber, str: &numCopy) {
                                        return  true
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        return false
    }
}