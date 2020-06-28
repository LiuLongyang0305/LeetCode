// https://leetcode.com/problems/average-salary-excluding-the-minimum-and-maximum-salary/
class Solution1 {
    func average(_ salary: [Int]) -> Double {
        var total = 0, maxEle = Int.min,minEle = Int.max
        salary.forEach { (val) in
            total += val
            maxEle = max(maxEle, val)
            minEle = min(minEle,val)
        }
        return Double(total - maxEle - minEle) / Double(salary.count - 2)
    }
}

class Solution {
    func average(_ salary: [Int]) -> Double {
        let total = salary.reduce(0) { $0 + $1}
        return Double(total - salary.min()! - salary.max()!) / Double(salary.count - 2)
    }
}