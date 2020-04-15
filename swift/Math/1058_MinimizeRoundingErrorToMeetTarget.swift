// https://leetcode.com/problems/minimize-rounding-error-to-meet-target/
typealias Info = (floor:Int,floorError:Double,ceilError:Double,ceil:Int)
extension Double {
    var info: Info {
        var ans: Info = (0,0,0,0)
        ans.floor = Int(floor(self))
        ans.floorError = self - floor(self)
        ans.ceilError = ceil(self) - self
        ans.ceil = Int(ceil(self))
        return ans
    }
}
class Solution {
    func minimizeError(_ prices: [String], _ target: Int) -> String {
        let nums = prices.map { Double($0)!.info}
        let floorSum = nums.reduce(0) { $0 + $1.floor}
        let ceilSum = nums.reduce(0) { $0 + $1.ceil}
        guard target >= floorSum && target <= ceilSum else {
            return "-1"
        }
        guard target != ceilSum else {
            return String(format: "%.3f", nums.reduce(0.0, { $0 + $1.ceilError}))
        }
        var floorError = nums.reduce(0.0, { $0 + $1.floorError})
        guard target != floorSum else {
            return String(format: "%.3f", floorError)
        }
        let sortedNumbers = nums.sorted { (a, b) -> Bool in
            return a.ceilError - a.floorError < b.ceilError - b.floorError
        }
        for i in 0..<(target - floorSum) {
            floorError += sortedNumbers[i].ceilError - sortedNumbers[i].floorError
        }
        return String(format: "%.3f", floorError)
        
    }
}