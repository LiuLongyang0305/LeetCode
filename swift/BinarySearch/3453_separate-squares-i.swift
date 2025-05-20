// https://leetcode.cn/problems/separate-squares-i/
class Solution {
    private let err = 0.00001
    func separateSquares(_ squares: [[Int]]) -> Double {
        let ysAndLsAndAreas = squares.map { [Double($0[1]),Double($0[2]),Double($0[2]) * Double($0[2])]}

        func check(_ mid: Double) -> (isEqual: Bool,needIncrease:Bool) {
            var diff = 0.0
            for i in 0..<squares.count {
                let (y,l,s) = (ysAndLsAndAreas[i][0],ysAndLsAndAreas[i][1],ysAndLsAndAreas[i][2])
                if y >= mid {
                    diff += s

                } else if y + l <= mid {
                    diff -= s

                } else {
                    let up = ((y + l) - mid) / l * s
                    let down = (mid - y) / l * s
                    diff += up
                    diff -= down
                }
            }
            // print("\(#function)  mid = \(mid)  diff = \(diff)")
            return (abs(diff) <= err, diff > 0)

        }


        var low = 0.0
        var high = 1000000000.0


        while  abs(high - low) > err {
            let mid = (high + low) / 2.0
            let (flag1,flag2) = check(mid)
            if flag1 {
                high = mid
            } else {
                if flag2 {
                    low = mid
                } else {
                    high = mid
                }
            }
        }


        return low
    }
}