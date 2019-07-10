//https://leetcode.com/problems/minimum-time-difference/
class Solution {
    func findMinDifference(_ timePoints: [String]) -> Int {
        
        //repeated
        if timePoints.count > 24 * 60 {
            return 0
        }
        
        //count
        let maxCount = 24 * 60
        var time = Array<Int>(repeating: 0, count: maxCount)
        for timePoint in timePoints {
            let parts = timePoint.split(separator: ":")
            time[60 * Int(parts[0])! + Int(parts[1])!] += 1
        }
        
        //repeat
        if time.first(where: { (val) -> Bool in
            val > 1
        }) != nil {
            return 0
        }
        //get time point
        var existedTime = [Int]()
        for (index,value) in time.enumerated() {
            if value != 0 {
                existedTime.append(index)
            }
        }
        
        var minGap = Int.max
        for i in 1..<existedTime.count {
            let gap =  existedTime[i] - existedTime[i - 1]
            if gap < minGap {
                minGap = gap
            }
        }
        return min(minGap, existedTime.first! + maxCount - existedTime.last!)
    }
}

var timePoints = ["23:59","00:00"]
Solution().findMinDifference(timePoints)
