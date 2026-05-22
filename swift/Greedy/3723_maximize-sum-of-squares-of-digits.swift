//https://leetcode.cn/problems/maximize-sum-of-squares-of-digits/
class Solution {
    func maxSumOfSquares(_ num: Int, _ sum: Int) -> String {
        guard num * 9 >= sum else {return ""}
        var sb = String(repeating: "9", count: sum / 9)
        if sum % 9 > 0 {
            sb.append("\(sum % 9)")
        }
        if sb.count < num {
            sb += String(repeating: "0", count: num - sb.count)
        }
        return sb
    }
}
