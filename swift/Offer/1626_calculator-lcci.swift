// https://leetcode-cn.com/problems/calculator-lcci/
class Solution {
    private let operatorsSet = Set<Character>("+-*/")
    func calculate(_ s: String) -> Int {
        let sCopy = s.replacingOccurrences(of: " ", with: "")
        var numbers = sCopy.components(separatedBy: CharacterSet.init(charactersIn: "+-*/")).map { Int(String($0))!}
        var operators = [Character]()
        sCopy.forEach { (ch) in
            if operatorsSet.contains(ch) {
                operators.append(ch)
            }
        }
        var idx = 0
        while idx < operators.count {
            if operators[idx] == "*" || operators[idx] == "/" {
                numbers[idx] =  operators[idx] == "*" ? numbers[idx] * numbers[idx + 1] :  numbers[idx] / numbers[idx + 1]
                numbers.remove(at: idx + 1)
                operators.remove(at: idx)
            } else {
                idx += 1
            }
        }
        var ans = numbers[0]
        for idx in 0..<operators.count {
            if operators[idx] == "+" {
                ans += numbers[idx + 1]
            } else {
                ans -= numbers[idx + 1]
            }
        }
        return ans
    }
}