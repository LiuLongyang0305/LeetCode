// https://leetcode.com/problems/time-needed-to-buy-tickets/
class Solution {
    func timeRequiredToBuy(_ tickets: [Int], _ k: Int) -> Int {
        var ans = 0
        let seq = 0..<tickets.count
        var needTickets = tickets
        while true {
            for i in seq {
                if needTickets[i] > 0 {
                    ans += 1
                    needTickets[i] -= 1
                }
                guard !(i == k && needTickets[i] == 0) else {
                    break
                }
            }
            guard 0 != needTickets[k] else {
                break
            }
        }
        return ans
    }
}