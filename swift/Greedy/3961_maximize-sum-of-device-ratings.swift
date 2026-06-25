//https://leetcode.cn/problems/maximize-sum-of-device-ratings/
class Solution {
    func maxRatings(_ units: [[Int]]) -> Int {

        if units[0].count == 1 {
            return units.reduce(0) { $0 + $1[0]}
        }
        let M = units[0].count
        let sortedUnits = units.map {[Int]($0.sorted().dropLast(M - 2))}
        var minCapcity = Int.max
        for su in sortedUnits {
            minCapcity = min(minCapcity,su[0])
        }
        var maxDiff = Int.min
        var sb = 0
        for su in sortedUnits {
            sb += su[1]
            maxDiff = max(maxDiff,minCapcity - su[1])
        }
        return sb + maxDiff
    }
}
