//https://leetcode.com/problems/range-sum-query-immutable/
class NumArray {
    var sum : Array<Int>
    init(_ nums: [Int]) {
        if !nums.isEmpty {
            sum = Array<Int>(repeating: 0, count: nums.count)
            sum[0] = nums[0]
            for i in 1..<nums.count {
                sum[i] = sum[i - 1] + nums[i]
            }
        } else {
            sum = [Int]()
        }
    }
    
    func sumRange(_ i: Int, _ j: Int) -> Int {
        guard i >= 0 && i <= j && j < sum.count else {
            return Int.min
        }
        if i == 0 {
            return sum[j]
        } else {
            return sum[j] - sum[i - 1]
        }
    }
}
