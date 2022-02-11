// https://leetcode.com/problems/average-height-of-buildings-in-each-segment/
class Solution {
    private typealias SplitPointInfo = (deltaHeight:Int,deltaCnt:Int)
    private typealias Segment = (start:Int,end:Int,averageHeightOfBuildings:Int)
    func averageHeightOfBuildings(_ buildings: [[Int]]) -> [[Int]] {
        
        var splitPointsMap = [Int:SplitPointInfo]()
        for building in buildings {
            splitPointsMap[building[0], default: (0,0)].deltaCnt += 1
            splitPointsMap[building[0], default: (0,0)].deltaHeight += building[2]
            splitPointsMap[building[1], default: (0,0)].deltaCnt -= 1
            splitPointsMap[building[1], default: (0,0)].deltaHeight -= building[2]
        }
        
        let sortedSplitPoints = splitPointsMap.keys.sorted()
        var ans = [Segment]()
        
        var lastSplit = 0
        var sumOfHeights = 0
        var numberOfBuilding = 0
        
        for splitPoint in sortedSplitPoints {
            guard let (dh,dc) = splitPointsMap[splitPoint] else {
                continue
            }
            if sumOfHeights > 0 {
                let t: Segment = (lastSplit,splitPoint,sumOfHeights / numberOfBuilding)
                if var last = ans.last, last.end == t.start && last.averageHeightOfBuildings == t.averageHeightOfBuildings {
                    last.end = t.end
                    ans[ans.count - 1] = last
                } else {
                    ans.append(t)
                }
            }
            
            lastSplit = splitPoint
            sumOfHeights += dh
            numberOfBuilding += dc
        }
        return ans.map { [$0.start,$0.end,$0.averageHeightOfBuildings]}
    }
}