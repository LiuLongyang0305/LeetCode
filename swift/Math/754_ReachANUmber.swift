//https://leetcode.com/problems/reach-a-number/
class Solution {
    func reachNumber(_ target: Int) -> Int {
        var targetCopy =  target > 0 ? target : -target
        var  k = 0
        while targetCopy > 0 {
            k += 1
            targetCopy -= k
        }
        return targetCopy % 2 == 0  ? k : k + 1 + k % 2
    }
}