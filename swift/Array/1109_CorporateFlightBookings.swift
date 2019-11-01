//https://leetcode.com/problems/corporate-flight-bookings/submissions/
class Solution {
    func corpFlightBookings(_ bookings: [[Int]], _ n: Int) -> [Int] {
        var ans = Array<Int>(repeating: 0, count: n)
        for booking in bookings {
            ans[booking[0] - 1] += booking[2]
            if booking[1] !=  n {
                ans[booking[1]] -= booking[2]
            }
        }
        for i in 1..<n {
            ans[i] = ans[i - 1] + ans[i]
        }
        return ans
    }
}