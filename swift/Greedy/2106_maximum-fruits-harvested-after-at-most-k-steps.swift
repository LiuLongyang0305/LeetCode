 // https://leetcode.com/problems/maximum-fruits-harvested-after-at-most-k-steps/
class Solution {
    private typealias FriutInfo = (pos:Int,ammount:Int)
    func maxTotalFruits(_ fruits: [[Int]], _ startPos: Int, _ k: Int) -> Int {
        var ans = 0
        var l = 0
        var r = 0
        var sum = 0
        let leftBound = startPos - k
        let rightBound = startPos + k
        let N = fruits.count
        
        while r < N {
            guard fruits[r][0] <= rightBound else {break }
            if fruits[r][0] < leftBound {
                l += 1
            } else {
                sum += fruits[r][1]
                while min( 2 * (startPos - fruits[l][0]) + fruits[r][0] - startPos, startPos - fruits[l][0] + 2 * (fruits[r][0] - startPos)) > k {
                    sum -= fruits[l][1]
                    l += 1
                }
                ans = max(ans, sum)
            }
            r += 1
        }
        return ans
    }
}