//https://leetcode.com/problems/count-pairs-of-points-with-distance-k/
class Solution {
    func countPairs(_ coordinates: [[Int]], _ k: Int) -> Int {
        var ans = 0
        var counterX = [Int:[Int:Int]]()
        for c in coordinates {
            let (x2,y2) = (c[0],c[1])
            for s1 in 0...k  {
                let s2 = k - s1
                let x1 =  s1 ^ x2
                let y1 = s2 ^ y2
                ans += counterX[x1]?[y1] ?? 0
            }
            counterX[x2,default: [:]][y2,default: 0] += 1
        }
        return ans
    }
}