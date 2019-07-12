//https://leetcode.com/problems/basic-calculator-ii/

let operators = Set<Character>("+-*/")

class Solution {
    
    func calculate(_ s: String) -> Int {
        let sCopy =  s.filter { (ch) -> Bool in
            ch.isNumber || operators.contains(ch)
        }
        
        var usedOperators = Array<Character>(sCopy.filter { (ch) -> Bool in
            operators.contains(ch)
        })
        
        let parts  = sCopy.components(separatedBy: CharacterSet(charactersIn: "+-*/"))
        var numbers  = parts.map { (str) -> Int in
            Int(str)!
        }
        var index = 0
        
        while index < usedOperators.count {
            let ope = usedOperators[index]
            if ope == "*" {
                let temp = numbers[index] * numbers[index + 1]
                numbers.remove(at: index + 1)
                numbers[index] = temp
                usedOperators.remove(at: index)
                continue
            }
            if ope == "/" {
                let temp = numbers[index] / numbers[index + 1]
                numbers.remove(at: index + 1)
                numbers[index] = temp
                usedOperators.remove(at: index)
                continue
            }
            index += 1
        }
        
        var ans = numbers[0]
        for i in 0..<usedOperators.count {
            ans += usedOperators[i] == "-" ? -numbers[i + 1] : numbers[i + 1]
        }
        return ans
    }
}
