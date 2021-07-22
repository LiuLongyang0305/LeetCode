//https://leetcode.com/problems/number-of-ships-in-a-rectangle/
/**
 * // This is Sea's API interface.
 * // You should not implement it, or speculate about its implementation
 * class Sea {
 *     public func hasShips(_ topRight: [Int], _ bottomLeft: [Int]) -> Bool {}
 * }
 */
class Solution {
    func countShips(_ sea: Sea, _ topRight: [Int], _ bottomLeft: [Int]) -> Int {
        
        let x1 = topRight[0]
        let y1 = topRight[1]
        let x0 = bottomLeft[0]
        let y0 = bottomLeft[1]
        guard x1 >= x0  && y0 <= y1 && sea.hasShips(topRight, bottomLeft) else {
            return 0
        }
        if(x1 == x0 && y1 == y0) {
            return 1
        }
        let xMid = (x0 + x1) / 2
        let yMid = (y0 + y1) / 2
        
        return countShips(sea,[xMid,yMid], bottomLeft) + countShips(sea, topRight, [xMid + 1,yMid + 1]) + countShips(sea, [xMid,y1], [x0,yMid + 1]) + countShips(sea, [x1,yMid], [xMid + 1 ,y0])
    }
}