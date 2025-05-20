//https://leetcode.cn/problems/minimize-the-maximum-of-two-arrays
extension Int {
    // 静态方法求 GCD
    static func gcd(_ a: Int, _ b: Int) -> Int {
        return b == 0 ? a : gcd(b, a % b)
    }

    // 实例方法求 LCM
    func lcm(with other: Int) -> Int {
        return (self / Int.gcd(self, other)) * other
    }
}
class Solution {
    func minimizeSet(_ divisor1: Int, _ divisor2: Int, _ uniqueCnt1: Int, _ uniqueCnt2: Int) -> Int {

        let lcm = divisor1.lcm(with: divisor2)
        func check(_ num: Int) -> Bool {
            let multiplyOfD1AndD2 = num / lcm
            let unique1 = num / divisor2 - multiplyOfD1AndD2
            let unique2 = num / divisor1 - multiplyOfD1AndD2
            let shared = num - num / divisor1 - num / divisor2 + multiplyOfD1AndD2
          
            
            if unique1 >= uniqueCnt1 {
                return unique2 + shared >= uniqueCnt2

            } else {
                if unique2 >= uniqueCnt2 {
                    return unique1 + shared >= uniqueCnt1
                } else {
                    return (uniqueCnt1 - unique1) + (uniqueCnt2 - unique2) <= shared
                }
            }
        }

        var left = 0
        var right = Int.max / 2
        while left < right {
            let mid = (left + right) >> 1
            if check(mid) {
                right = mid
            } else {
                left = mid + 1
            }
        }
        return left
    }
}