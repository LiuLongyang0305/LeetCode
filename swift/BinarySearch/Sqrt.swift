class Q69_Solution {
    func mySqrt(_ x: Int) -> Int {
        var low = 0
        var high = x
        while low < high {
            let mid = low + (high - low) / 2
            let powMid = mid * mid
            let powMidPlusOne = (mid + 1) * (mid) + 1
            if powMid <= x && powMidPlusOne > x {
                return mid
            } else if powMid > x {
                high = mid - 1
            } else {
                low = mid + 1
            }
        }
        return low * low == x ? low : (low - 1)
    }
}