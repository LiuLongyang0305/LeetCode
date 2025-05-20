//https://leetcode.cn/problems/maximum-points-inside-the-square
class Solution {
    func maxPointsInsideSquare(_ points: [[Int]], _ s: String) -> Int {
        let pointsDis = points.map {max(abs($0[0]),abs($0[1]))}
        let labels = s.map { $0}
        let sortedIndices = (0..<points.count).sorted {pointsDis[$0] < pointsDis[$1]}

        func check(_ length: Int) -> Bool {
            var set = Set<Character>()
            for idx in sortedIndices {
                guard pointsDis[idx] <= length else {break}
                guard !set.contains(labels[idx]) else {
                    return false
                }
                set.insert(labels[idx])
            }
            return true
        }


        var left = 0
        var right = 1_000_000_007
        while left < right {
            let mid = (left + right + 1) >> 1
            if check(mid) {
                left = mid
            } else {
                right = mid - 1
            }

        }

        let idx = sortedIndices.lastIndex {pointsDis[$0] <= left} ?? -1

        return idx + 1
    }
}