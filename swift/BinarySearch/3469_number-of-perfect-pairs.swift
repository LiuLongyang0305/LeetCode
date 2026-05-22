// https://leetcode.cn/problems/number-of-perfect-pairs/
class Solution {
    func perfectPairs(_ nums: [Int]) -> Int {
        let sortedNumbers = nums.map { abs($0)}.sorted() + [1_000_000_007]

        func binarySearchFirstLargerThan(_ target: Int) -> Int {
            var l = 0
            var r = sortedNumbers.count - 1
            while l < r {
                let mid = (l + r) >> 1
                if sortedNumbers[mid] <= target {
                    l = mid + 1
                } else {
                    r = mid
                }
            }
            return l
        }


        var sb = 0
        for i in 0..<(sortedNumbers.count - 1) {
            let idx = binarySearchFirstLargerThan(2 * sortedNumbers[i])
            sb += idx - i - 1

        }
        return  sb
    }
}

