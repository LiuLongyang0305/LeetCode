//https://leetcode.com/problems/fraction-to-recurring-decimal/
class Solution {
    func fractionToDecimal(_ numerator: Int, _ denominator: Int) -> String {
        let di = gcd(numerator, denominator)
        
        var numeratorCopy = numerator / di
        var denominatorCopy = denominator / di
        let symbol = numeratorCopy * denominatorCopy < 0 ? "-" : ""
        if numeratorCopy < 0 {
            numeratorCopy *= -1
        }
        if denominatorCopy < 0 {
            denominatorCopy *= -1
        }
        var ans = symbol  + "\(numeratorCopy / denominatorCopy)"
        if numeratorCopy % denominatorCopy ==  0 {
            return ans
        }
        ans.append(".")
        return  ans + (isCirculatingDecimal(denominatorCopy) ? getCirculatingDecimalAns(numeratorCopy % denominatorCopy,denominatorCopy) : getNonCirculatingDecimalAns(numeratorCopy % denominatorCopy,denominatorCopy))
    }
    
    private func isCirculatingDecimal(_ denominator: Int) -> Bool {
        var temp = denominator
        while temp % 2 == 0 {
            temp /= 2
        }
        while temp % 5 == 0 {
            temp /= 5
        }
        
        return temp != 1
    }
    
    private func gcd(_  first: Int, _ second: Int) -> Int {
        return second == 0 ? first : gcd(second, first % second)
    }
    
    private func getNonCirculatingDecimalAns(_ numerator: Int, _ denominator: Int) -> String {
        var nunumeratorCopy = numerator
        var ans = ""
        while nunumeratorCopy != 0 {
            nunumeratorCopy *= 10
            ans += "\(nunumeratorCopy / denominator)"
            nunumeratorCopy %= denominator
        }
        return ans
    }
    private func getCirculatingDecimalAns(_ numerator: Int, _ denominator: Int) -> String {
        var numeratorCopy =  numerator
        var ans = ""
        var decimal = Array<Int>()
        var dic = [Int:Int]()
        dic[numeratorCopy] = 0
        
        var remainder = Set<Int>()
        var findCirculatingSection = false
        while !findCirculatingSection {
            numeratorCopy *= 10
            let tempRemainder =  numeratorCopy % denominator
            if remainder.contains(numeratorCopy){
                findCirculatingSection = true
            }  else {
                decimal.append(numeratorCopy / denominator)
                dic[numeratorCopy] = decimal.count - 1
                remainder.insert(numeratorCopy)
                numeratorCopy = tempRemainder
            }
        }
        let startIndex = dic[numeratorCopy]!
        var i = 0
        while i < startIndex {
            ans += "\(decimal[i])"
            i += 1
        }
        ans +=  "("
        while i < decimal.count{
            ans += "\(decimal[i])"
            i += 1
        }
        ans += ")"
        return ans
    }
}