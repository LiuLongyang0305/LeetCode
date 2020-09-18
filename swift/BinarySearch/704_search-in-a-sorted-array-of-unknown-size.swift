// https://leetcode.com/problems/search-in-a-sorted-array-of-unknown-size/
/**
 * // This is ArrayReader's API interface.
 * // You should not implement it, or speculate about its implementation
 * public class ArrayReader {
 *     public func get(_ index: Int) -> Int {}
 * }
 */

class Solution {
    func search(_ reader: ArrayReader, _ target: Int) -> Int {
        var left = 0
        var right = 20000
        while left < right {
            let mid = left + (right - left) >> 1
            let num = reader.get(mid)
            guard num != target else {
                return mid
            }
            if  num == 2147483647 || num > target {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        return reader.get(left) == target ? left : -1
    }
}
