// https://leetcode.com/problems/equal-rational-numbers/
struct Fraction {
    //分子
    var numerator: Int
    //分母
    var denominator: Int
    
    public func isEqualTo(other fraction: Fraction) -> Bool {
        return numerator * fraction.denominator == denominator * fraction.numerator
    }
}
class Solution {
    private var powerOfTen: [Int]
    init() {
        powerOfTen = [1]
        for _ in 1...15 {
            powerOfTen.append(powerOfTen.last! * 10)
        }
    }
    func isRationalEqual(_ s: String, _ t: String) -> Bool {
        return stringToFraction(s).isEqualTo(other: stringToFraction(t))
    }
    
    private func stringToFraction(_ numStr: String) -> Fraction {
        guard !numStr.contains("(") else {
            return circulatingDecimalToFraction(numStr)
        }
        guard !numStr.contains(".") else {
            return doubleToFraction(numStr)
        }
        return integerToFraction(numStr)
    }
    
    private func integerToFraction(_ integer : String) -> Fraction {
        return Fraction(numerator: Int(integer)!, denominator: 1)
    }
    
    private func doubleToFraction(_ numStr: String) -> Fraction {
        let pointIndex = numStr.firstIndex(of: ".")!
        let integer = Int(String(numStr[..<pointIndex]))!
        let floatStr = String(numStr[numStr.index(after: pointIndex)...])
        
        if floatStr.isEmpty {
            return Fraction(numerator: integer, denominator: 1)
        }
        let floatLength = floatStr.count
        return Fraction(numerator: integer * powerOfTen[floatLength] + Int(floatStr)!, denominator: powerOfTen[floatLength])
    }
    private func circulatingDecimalToFraction(_ numStr: String) -> Fraction {
        let leftParenthesisIdx = numStr.firstIndex(of: "(")!
        let pointIndex = numStr.firstIndex(of: ".")!
        let integer = Int(String(numStr[..<pointIndex]))!
        let nonRepeatingPart = String(numStr[numStr.index(after: pointIndex)..<leftParenthesisIdx])
        let rightParenthesisIdx = numStr.firstIndex(of: ")")!
        let repeatingPart = String(numStr[numStr.index(after: leftParenthesisIdx)..<rightParenthesisIdx])
        return Fraction(numerator: powerOfTen[repeatingPart.count + nonRepeatingPart.count] * integer + Int(nonRepeatingPart + repeatingPart)! - (powerOfTen[nonRepeatingPart.count] * integer + (Int(nonRepeatingPart) ?? 0 )), denominator: powerOfTen[nonRepeatingPart.count + repeatingPart.count] - powerOfTen[nonRepeatingPart.count])
    }
}


