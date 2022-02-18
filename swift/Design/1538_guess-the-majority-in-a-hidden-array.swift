// https://leetcode.com/problems/guess-the-majority-in-a-hidden-array/
/**
 * // This is ArrayReader's API interface.
 * // You should not implement it, or speculate about its implementation
 * interface ArrayReader {
 *     // Compares 4 different elements in the array
 *     // return 4 if the values of the 4 elements are the same (0 or 1).
 *     // return 2 if three elements have a value equal to 0 and one element has value equal to 1 or vice versa.
 *     // return 0 : if two element have a value equal to 0 and two elements have a value equal to 1.
 *     public func query(_ a: Int, _ b: Int, _ c: Int, _ d: Int) -> Int {}
 *
 *     // Returns the length of the array
 *     public func length() -> Int {}
 * }
 */


protocol ArrayReader {
    func query(_ a: Int, _ b: Int, _ c: Int, _ d: Int) -> Int
    func length() -> Int
}

class Solution {
    func guessMajority(_ reader: ArrayReader) -> Int {
        let N = reader.length()
        guard N > 2 else {return 0}
        //假设第一个数字是0
        var zeroCnt = 1
        var oneIndex = -1
        for idx in 1..<N {
            let t =  reader.query(0, 0, idx, idx)
            if t == 4 {
                zeroCnt += 1
            } else {
                if oneIndex == -1 {
                    oneIndex = idx
                }
            }
        }
        let oneCnt = N - zeroCnt
        guard oneCnt != zeroCnt else {return -1}
        return oneCnt > zeroCnt ? oneIndex : 0
    }
}