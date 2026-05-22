//https://leetcode.com/problems/maximum-balanced-shipments/
class Solution {
    func maxBalancedShipments(_ weight: [Int]) -> Int {
        let N = weight.count
        var ans = 0
        var i = 1
        while i < N {
            if weight[i - 1] > weight[i] {
                ans += 1
                i += 2
            } else {
                i += 1
            }
        }
        return ans 
    }
}
