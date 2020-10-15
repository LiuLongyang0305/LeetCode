// https://leetcode.com/problems/leftmost-column-with-at-least-a-one/
/**
 * // This is the BinaryMatrix's API interface.
 * // You should not implement it, or speculate about its implementation
 * public class BinaryMatrix {
 *     public func get(_ row: Int, _ col: Int) -> Int {}
 *     public func dimensions() -> [Int] {}
 * };
 */

class Solution {
    func leftMostColumnWithOne(_ binaryMatrix: BinaryMatrix) -> Int {
        let dimensions = binaryMatrix.dimensions()
        let M = dimensions[0]
        let N = dimensions[1]
        var ans = Int.max
        for r in 0..<M {
            guard binaryMatrix.get(r, 0) == 0 else {
                return 0
            }
            guard binaryMatrix.get(r, N - 1) == 1 else {
                continue
            }
            var visited = Set<Int>()
            var left = 0
            var right = N - 1
            while left < right {
                let mid = left + (right - left) >> 1
                visited.insert(mid)
                if binaryMatrix.get(r, mid) == 1 {
                    ans = min(ans, mid)
                    right = mid - 1
                } else {
                    left = mid + 1
                }
            }
            if !visited.contains(left) && left < N  {
                if binaryMatrix.get(r, left) == 1 {
                    ans = min(ans, left)
                }
            }
        }
        return ans == Int.max ? -1 : ans
    }
}
