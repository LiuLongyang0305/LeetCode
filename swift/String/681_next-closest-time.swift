// https://leetcode.com/problems/next-closest-time/
class Solution {
    private let zero = Character("0").asciiValue!
    private typealias TimeInfo = (hour:Int,min:Int,gap:Int)
    func nextClosestTime(_ time: String) -> String {
        
        var timeStr = [Character](time)
        timeStr.remove(at: 2)
        let existNums = Set<Int>( timeStr.map {Int($0.asciiValue! - zero)}).sorted()
        let startTime = Int(String(timeStr))!
        
        let startTimeInfo: TimeInfo = (startTime / 100,startTime % 100, Int.max)
        var ans: TimeInfo = startTimeInfo
        func update(_ currentHour: Int, _ currentMin: Int) {
            guard currentMin != startTimeInfo.min || currentHour != startTimeInfo.hour else {
                return
            }
            var gap = 0
            if currentHour > startTimeInfo.hour || (currentHour == startTimeInfo.hour && currentMin > startTimeInfo.min) {
                gap += (currentHour - startTimeInfo.hour ) * 60
            } else  {
                gap += (24 - startTimeInfo.hour + currentHour) * 60
            }
            gap += currentMin
            gap -= startTimeInfo.min
            if gap < ans.gap {
                ans = (currentHour,currentMin,gap)
            }
        }
        for i in existNums {
            guard i <= 2 else {
                continue
            }
            for j in existNums {
                let currentHour = 10 * i + j
                guard currentHour <= 23 else {
                    continue
                }
                for k in existNums {
                    guard k <= 5 else {
                        continue
                    }
                    for l in existNums {
                        let currentMin = 10 * k + l
                        update(currentHour, currentMin)
                    }
                }
            }
        }
        return (ans.hour < 10 ? "0" : "" )  + "\(ans.hour)" + ":" + (ans.min < 10 ? "0" : "") + "\(ans.min)"
    }
}
