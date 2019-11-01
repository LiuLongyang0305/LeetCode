//https://leetcode.com/problems/grumpy-bookstore-owner/
class Solution {
    func maxSatisfied(_ customers: [Int], _ grumpy: [Int], _ X: Int) -> Int {
        var ans = 0
        let length = customers.count
        var customersSumWhenGrumpy = Array<Int>(repeating: 0, count: length + 1)
        for i in 0..<length {
            if grumpy[i] == 0 {
                ans += customers[i]
                customersSumWhenGrumpy[i + 1] =  customersSumWhenGrumpy[i]
            } else {
                customersSumWhenGrumpy[i + 1] =  customersSumWhenGrumpy[i] + customers[i]
            }
        }
        guard X < length else {
            return ans + customersSumWhenGrumpy.last!
        }
        var temp = Int.min
        for i in 1..<(length + 2 - X) {
            temp = max(temp, customersSumWhenGrumpy[i + X - 1] - customersSumWhenGrumpy[i - 1])
        }
        return  ans + temp
    }
}