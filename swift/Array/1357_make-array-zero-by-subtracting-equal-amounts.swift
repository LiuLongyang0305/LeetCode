// https://leetcode.com/problems/make-array-zero-by-subtracting-equal-amounts/
class Solution {
    func minimumOperations(_ nums: [Int]) -> Int {
        let set = Set<Int>(nums)
        return set.count - (set.contains(0) ? 1 : 0)
    }
}

class Solution {
    func minimumOperations(_ nums: [Int]) -> Int {
        var nonZerosNums = [Int]()
        for num in nums{
            if num != 0 {
                nonZerosNums.append(num)
            }
        }
        var ans = 0
        while !nonZerosNums.isEmpty {
            let delta = nonZerosNums.min()!
            var newNonZeroNums = [Int]()
            ans += 1
            for num in nonZerosNums {
                if num > delta {
                    newNonZeroNums.append(num - delta)
                }
            }
            nonZerosNums = newNonZeroNums
        }
        return ans
    }
}