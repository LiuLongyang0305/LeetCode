//https://leetcode.com/problems/fraction-addition-and-subtraction/
class Math {
    public static func gcd(first: Int, second: Int) -> Int {
        return second == 0 ? first : gcd(first: second, second: first % second)
    }
}

extension Int {
    var absValue: Int {
        return self < 0 ? -self : self
    }
}

struct Fraction {
    var numerator: Int
    var denominator: Int
    var symbol: String {
        get {
            return numerator * denominator < 0 ? "-" : ""
        }
    }
    init(numerator: Int, denominator: Int) {
        let gcdAns = Math.gcd(first: numerator, second: denominator)
        self.denominator = denominator / gcdAns
        self.numerator = numerator / gcdAns
    }
    func toString() -> String {
        return symbol + "\(numerator.absValue)/\(denominator.absValue)"
    }
    
    mutating func add( fraction other: Fraction) {
        numerator = numerator * other.denominator + denominator * other.numerator
        denominator = self.denominator * other.denominator
        let gcdAns = Math.gcd(first: numerator, second: denominator)
        numerator /= gcdAns
        denominator /= gcdAns
    }
}



class Solution {

    func fractionAddition(_ expression: String) -> String {
        let compoments = expression.split(separator: "/")
        var numbers = [Int]()
        for i in 0..<compoments.count {
            if i == 0 || i == compoments.count - 1 {
                numbers.append(Int(String(compoments[i]))!)
                continue
            }
            let str = String(compoments[i])
            if let index = str.firstIndex(of: "+") {
                numbers.append(Int(String(str[str.startIndex..<index]))!)
                numbers.append(Int(String(str[str.index(after: index)..<str.endIndex ]))!)
            }
            if let index = str.firstIndex(of: "-") {
                numbers.append(Int(String(str[str.startIndex..<index]))!)
                numbers.append(Int(String(str[index..<str.endIndex ]))!)
            }
        }
        guard numbers.count > 2 else {
            return Fraction(numerator: numbers[0], denominator: numbers[1]).toString()
        }
        var ansFraction = Fraction(numerator: numbers[0], denominator: numbers[1])
        for i in 1..<numbers.count  >> 1 {
            ansFraction.add(fraction: Fraction(numerator: numbers[i << 1], denominator: numbers[i << 1 + 1]))
        }
        return ansFraction.toString()
    }
}
