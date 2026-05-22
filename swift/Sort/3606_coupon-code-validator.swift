// https://leetcode.com/problems/coupon-code-validator/
class Solution {
    struct  Coupon {
        var code: String
        var businessLine: String
        var isAcvtive: Bool
    }
    let businessLinesSet = Set<String>(["electronics","grocery","pharmacy","restaurant"])
    func validateCoupons(_ codes: [String], _ businessLine: [String], _ isActive: [Bool]) -> [String] {

        let M = codes.count
        var  coupons = [Coupon]()
        for i in 0..<M {
            if checkCode(code: codes[i]) && businessLinesSet.contains(businessLine[i]) && isActive[i] {
                 coupons.append( Coupon(code: codes[i], businessLine: businessLine[i], isAcvtive: true))

            }
        }
        let sortedCoupons =  coupons.sorted { f, s in
            if f.businessLine == s.businessLine {
                return f.code < s.code
            }
            return f.businessLine < s.businessLine
        }
        return sortedCoupons.map { $0.code}
    }

    private func checkCode(code: String) -> Bool {
        guard !code.isEmpty else {return false}
        for ch in code {
            guard ch.isLetter || ch.isNumber || ch == "_" else {
                return false
            }
        }
        return true
    }
}
