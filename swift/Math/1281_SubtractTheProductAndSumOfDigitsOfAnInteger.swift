//https://leetcode.com/problems/subtract-the-product-and-sum-of-digits-of-an-integer/ 
extension Int {
    var toArr: [Int] {
        var ans = [Int]()
        var temp = self
        while temp > 0 {
            ans.append(temp % 10)
            temp /= 10
        }
        return ans
    }
 }
 class Solution {
     func subtractProductAndSum(_ n: Int) -> Int {
        let ans = n.toArr.reduce((1,0)) {($0.0 * $1, $0.1 + $1)}
        return ans.0 - ans.1
     }
 }