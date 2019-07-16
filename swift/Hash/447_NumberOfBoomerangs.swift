//https://leetcode.com/problems/number-of-boomerangs/
class Solution {
    func numberOfBoomerangs(_ points: [[Int]]) -> Int {
        guard points.count > 1 else {
            return 0
        }
        var ans = 0
        let size = points.count

        for i in 0..<size {
            var dic = Dictionary<Int,Int>()
            for j in 0..<size {
                if  j != i {
                    let deltaX = abs(points[i][0] - points[j][0])
                    let deltaY = abs(points[i][1]  - points[j][1])
                    let squreDistance = deltaX * deltaX + deltaY * deltaY
                    if let count  = dic[squreDistance] {
                        dic[squreDistance] = count + 1
                    } else {
                        dic[squreDistance] = 1
                    }
                }
            }
            for (_,val) in dic {
                if val >= 2 {
                    ans += val * (val - 1)
                }
            }
        }
        return ans
    }
}