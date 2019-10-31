//https://leetcode.com/problems/partition-array-into-disjoint-intervals/
class Solution {
    func partitionDisjoint(_ A: [Int]) -> Int {
        var maxLeft = Array<Int>(repeating: -1, count: A.count)
        var minRight = Array<Int>(repeating: -1, count: A.count)
        let length = A.count
        maxLeft[0] = A[0]
        for i in 1..<A.count {
            maxLeft[i] = max(maxLeft[i - 1], A[i])
        }
        minRight[length - 1] = A[length - 1]
        for i in (0..<length  - 1).reversed() {
            minRight[i] = min(A[i], minRight[i + 1])
        }

        for i in 0..<(length - 1) {
            if maxLeft[i] <= minRight[i + 1] {
                return i + 1
            }
        }
        return 0
    }
}