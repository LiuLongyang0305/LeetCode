// https://leetcode.com/problems/apply-discount-to-prices/
class Solution {
    func discountPrices(_ sentence: String, _ discount: Int) -> String {
        let rate = Double(100 - discount) / 100.0
        let words = sentence.split(separator: " ").map { String($0)}
        var ans = ""
        for w in words {
            if isPrice(w) {
                ans.append("$")
                ans.append(caculate(String(w.dropFirst()), rate))

            } else {
                ans.append(w)
            }
            ans.append(" ")
        }
        ans.removeLast()
        return ans
    }


    private func caculate(_ num: String,_ rate: Double) -> String {
        return String(format: "%.2f", Double(Int(num)!) * rate)
    }
    private func isPrice(_ possiblePrice: String) -> Bool {
        guard possiblePrice.first! == "$" else {
            return false
        }
        guard possiblePrice.count > 1 else {return false}
        for ch in possiblePrice.dropFirst() {
            guard ch.isNumber else {return false}
        }
        return true
    }
}