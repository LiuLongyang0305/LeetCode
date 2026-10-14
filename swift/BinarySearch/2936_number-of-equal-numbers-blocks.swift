/**
 * Definition for BigArray.
 * class BigArray {
 *     init(elements: [Int]) {}
 *     func at(_ index: Int) -> Int {}
 *     func size() -> Int {}
 * }
 */
class Solution {
    func countBlocks(_ nums: BigArray) -> Int {
        let N = nums.size()

        func binarySearchLastIdxOf(_ target: Int, _ si: Int) -> Int {
            var l = si
            var r = N - 1
            while l < r {
                let mid = (l + r + 1) >> 1
                if nums.at(mid) == target {
                    l = mid
                } else {
                    r = mid - 1
                }
            }
            return l
        }

        var cnt = 0
        var i = 0
        while i < N {
            let tareget = nums.at(i)
            cnt += 1
            i = binarySearchLastIdxOf(tareget, i) + 1
        }
        return cnt
    }
}
