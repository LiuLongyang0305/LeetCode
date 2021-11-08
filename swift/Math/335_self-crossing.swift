// https://leetcode.com/problems/self-crossing/
class Solution {
    func isSelfCrossing(_ distance: [Int]) -> Bool {
        guard distance.count > 3 else {
            return false
        }
        for i in 3..<distance.count {
            if distance[i] >= distance[i - 2] && distance[i - 1] <= distance[i - 3] { return true}
            if i >= 4 && distance[i - 1] == distance[i - 3] && distance[i] + distance[i - 4] >= distance[i - 2] {return true}
            
            if i >= 5 &&  distance[i - 2] >= distance[i - 4] && distance[i] + distance[i - 4] >= distance[i - 2] && distance[i - 1] + distance[i - 5] >= distance[i - 3] && distance[i - 1] <= distance[i - 3] { return true}
        }
        return false
    }
}