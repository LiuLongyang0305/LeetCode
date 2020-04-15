// https://leetcode.com/problems/line-reflection/
class Solution {
    func isReflected(_ points: [[Int]]) -> Bool {
        guard points.count > 2 else {
            return points.count <= 1 || points[0][1] == points[1][1] || points[0][0] == points[1][0]
        }
        var map = [Int:Set<Int>]()
        for p in points {
            if nil == map[p[1]] {
                map[p[1]] = []
            }
            map[p[1]]?.insert(p[0])
        }
        let indices = map[points[0][1]]!.sorted()
        let N = indices.count
        var line = -1
        if indices.count % 2 == 1 {
            line = 2 * indices[N >> 1]
        } else {
            line = indices[0] + indices[N - 1]
        }
        for (_,xs) in map {
            let sortedXs = xs.sorted()
            let length = xs.count
            for i in 0...(length >> 1) {
                guard sortedXs[i] + sortedXs[length - 1 - i] == line else {
                    return false
                }
            }
        }
        return true
    }
}