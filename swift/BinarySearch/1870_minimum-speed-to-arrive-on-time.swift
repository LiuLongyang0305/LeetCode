// https://leetcode.com/problems/minimum-speed-to-arrive-on-time/
class Solution {
    private var dist = [Double]()
    private var hour: Double = 0.0
    func minSpeedOnTime(_ _dist: [Int], _ hour: Double) -> Int {
        guard Double(_dist.count) - 1.0 <= hour else {
            return -1
        }
        self.dist = _dist.map({ Double($0)})
        self.hour = hour
        var low = 0
        var high = 1_000_000_0
        var ans = Int.max
        while low < high {
            let mid = (low + high) >> 1
            if check(Double(mid)) {
                if ans > mid {
                    ans = mid
                }
                high = mid - 1
            } else {
                low = mid + 1
            }
        }
        if low < ans && check(Double(low)) {
            return low
        }
        return ans
    }
    private func check(_ speed: Double) -> Bool {
        var needHour = 0.0
        for dis in self.dist.dropLast() {
            needHour += ceil(dis / speed)
        }
        needHour += dist.last! / speed
        return needHour <= self.hour
    }
}