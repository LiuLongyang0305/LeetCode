// https://leetcode.com/problems/find-the-index-of-the-large-integer/
/**
 * // This is ArrayReader's API interface.
 * // You should not implement it, or speculate about its implementation
 * interface ArrayReader {
 *     // Compares the sum of arr[l..r] with the sum of arr[x..y] 
 *     // return 1 if sum(arr[l..r]) > sum(arr[x..y])
 *     // return 0 if sum(arr[l..r]) == sum(arr[x..y])
 *     // return -1 if sum(arr[l..r]) < sum(arr[x..y])
 *     public func compareSub(_ l: Int, _ r: Int, _ x: Int, _ y: Int) -> Int {}
 *
 *     // Returns the length of the array
 *     public func length() -> Int {}
 * }
 */

class Solution {
    func getIndex(_ reader: ArrayReader) -> Int {
        return binarySearch(reader)
    }
    private func binarySearch(_ reader: ArrayReader) -> Int {
        var right = reader.length() - 1
        var left = 0
        while left < right {
            let mid = left + (right - left) >> 1
            let N = right - left + 1
            if N % 2 == 0 {
                let rel = reader.compareSub(left, mid, mid + 1, right)
                //print("l = \(left)  r = \(right)  N = \(N)  mid = \(mid) rel = \(rel)")
                if rel == 1 {
                    right = mid
                } else {
                    left = mid + 1
                }
            } else {
                let rel = reader.compareSub(left, mid - 1, mid + 1, right)
                if rel == 0 {
                    return mid
                } else if rel == 1 {
                    right = mid - 1
                } else {
                    left = mid + 1
                }
            }
        }
        return left
    }
}
