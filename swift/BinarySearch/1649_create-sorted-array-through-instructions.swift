// https://leetcode.com/problems/create-sorted-array-through-instructions/
class Solution {
    private let MOD = 1_000_000_007
    func createSortedArray(_ instructions: [Int]) -> Int {
        var values = [Int.min,Int.max]
        var cost = 0

        func  searchLastIndexLessThan(_ target: Int) -> Int {
            var left = 0
            var right = values.count - 1

            while left < right {
                let mid = (left + right + 1) >> 1
                if values[mid] < target {
                    left = mid
                } else {
                    right = mid - 1
                }
            }
            return left
        }



        func  searchFirstIndexLargerThan(_ target: Int) -> Int {
            var left = 0
            var right = values.count - 1

            while left < right {
                let mid = (left + right) >> 1
                if values[mid] <= target {
                    left = mid + 1
                } else {
                    right = mid
                }
            }
            return left
        }


        for num in instructions {
            let i = searchLastIndexLessThan(num)
            let j = searchFirstIndexLargerThan(num)
            cost += min(i, values.count - 1 - j)
            cost %= MOD
            values.insert(num, at: j)
        }



        return cost
    }
}