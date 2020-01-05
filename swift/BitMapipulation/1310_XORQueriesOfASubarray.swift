// https://leetcode.com/problems/xor-queries-of-a-subarray/
class Solution {
    func xorQueries(_ arr: [Int], _ queries: [[Int]]) -> [Int] {
        var prefix = Array<Int>(repeating: 0, count: arr.count + 1)
        for index in 0..<arr.count {
            prefix[index + 1] = prefix[index] ^ arr[index]
        }
        return queries.map {prefix[$0[0]] ^ prefix[$0[1] + 1]}
    }
 }