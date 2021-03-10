// https://leetcode.com/problems/find-nearest-point-that-has-the-same-x-or-y-coordinate/
class Solution {
    func nearestValidPoint(_ x: Int, _ y: Int, _ points: [[Int]]) -> Int {
        var (idx,dis) = (-1,Int.max)
        let N = points.count
        for i in 0..<N {
            guard x == points[i][0] || y == points[i][1] else {
                continue
            }
            let curDis =  x == points[i][0] ? abs(y - points[i][1]) : abs(x - points[i][0])
            if curDis < dis {
                (idx,dis) = (i,curDis)
            }
        }
        return idx
    }
}