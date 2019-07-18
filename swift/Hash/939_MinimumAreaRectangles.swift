//https://leetcode.com/problems/minimum-area-rectangle/
class Solution {
    func minAreaRect(_ points: [[Int]]) -> Int {
        
        var ans = Int.max
        var mapXToY = Dictionary<Int,Set<Int>>()
        
        for point in points {
            
            let x = point[0]
            if nil == mapXToY[x] {
                mapXToY[x] = Set<Int>()
            }
            mapXToY[x]?.insert(point[1])
        }
        
        let sameXPoints = mapXToY.filter { (arg0) -> Bool in
            let (_, value) = arg0
            return value.count >= 2
        }
        
        if sameXPoints.count < 2 {
            return 0
        }
        
        var sortedX = sameXPoints.keys.sorted()
        let size = sortedX.count
        for i in 0..<(size - 1) {
            for j in (i + 1)..<size {
                let firstX = sortedX[i]
                let secondX = sortedX[j]
                let width = secondX - firstX
                var potensionY = Array<Int>(sameXPoints[firstX]!.intersection(sameXPoints[secondX]!))
                if potensionY.count >= 2 {
                    var minHeight = Int.max
                    potensionY.sort()
                    for k in 0..<(potensionY.count - 1) {
                        let height = potensionY[k + 1] - potensionY[k]
                        if height < minHeight {
                            minHeight = height
                        }
                    }
                    
                    let area = width * minHeight
                    if area < ans {
                        ans = area
                    }
                }
            }
        }
        return ans == Int.max ? 0 : ans
    }
}

var  points = [[35264,38657],[15626,7304],[35264,19260],[28284,19260],[32875,19260],[35264,38594],[28284,38594],[32875,38657],[28284,38657],[15626,38657],[35264,7304],[15626,19260],[28284,7304]]
Solution().minAreaRect(points)


