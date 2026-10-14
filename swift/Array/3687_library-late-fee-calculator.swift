//https://leetcode.cn/problems/library-late-fee-calculator/
class Solution {
    func lateFee(_ daysLate: [Int]) -> Int {
        var sb = 0
        for dl in daysLate {
            if dl == 1 {
                sb += 1
                continue
            }
            if dl >= 2 && dl <= 5 {
                sb += 2 * dl
                continue
            }
            sb += 3 * dl
        }
        return sb
    }
}
