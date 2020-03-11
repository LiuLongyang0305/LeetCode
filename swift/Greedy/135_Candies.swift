// https://leetcode.com/problems/candy/ 
class Solution {
    func candy(_ ratings: [Int]) -> Int {
        guard ratings.count > 1 else {
            return ratings.count
        }
        var ans  = 0
        let N = ratings.count
        var left2right = Array<Int>(repeating: 1, count: N)
        var right2Left = Array<Int>(repeating: 1, count: N)
        for i in 1..<N {
            if ratings[i] > ratings[i - 1] {
                left2right[i] = left2right[i - 1] + 1
            }
        }
        for i in (0..<(N - 1)).reversed() {
            if ratings[i] > ratings[i + 1] {
                right2Left[i] = right2Left[ i + 1] + 1
            }
        }
        for i in 0..<N {
            ans += max(left2right[i], right2Left[i])
        }
        return ans
    }
 }