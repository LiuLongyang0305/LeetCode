// https://leetcode.com/problems/nth-magical-number/
class Solution {
    private let MOD = 1_000_000_007
    func nthMagicalNumber(_ N: Int, _ A: Int, _ B: Int) -> Int {
        let lcm = A * B / gcd(A, B)
        var left = 1
        var right = min(A, B) * N
        while left < right {
            let mid = left + (right - left) >> 1
            let cnt = mid / A + mid / B - mid / lcm
            if cnt > N {
                right = mid
            } else if cnt < N {
                left = mid + 1
            } else {
                let subOne = mid - 1
                if subOne / A + subOne / B - subOne / lcm < N {
                    return mid % MOD
                } else {
                    right = mid
                }
                
            }
        }
        return left % MOD
    }
    private func gcd(_ a: Int, _ b: Int) -> Int {
        return b == 0 ? a : gcd(b, a % b)
    }
}

