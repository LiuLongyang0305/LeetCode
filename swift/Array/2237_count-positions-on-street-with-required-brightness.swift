// https://leetcode.com/problems/count-positions-on-street-with-required-brightness/
class Solution {
    func meetRequirement(_ n: Int, _ lights: [[Int]], _ requirement: [Int]) -> Int {

        var diff = [Int](repeating: 0, count: n + 5)
        for light in lights {
            diff[max(0, light[0] - light[1])] += 1
            diff[min(n, light[0] + light[1]) + 1] -= 1
        }

        for i in 1...n {
            diff[i] += diff[i - 1]
        }

        var ans = 0

        let N = requirement.count
        for pos in 0..<N {
            if diff[pos] >= requirement[pos] {
                ans += 1
            }
        }
        return ans
    }
}