//https://leetcode.com/problems/construct-the-rectangle/submissions/ 
class Solution {
     func constructRectangle(_ area: Int) -> [Int] {
        var factor = Int(sqrt(Double(area)))
        while factor > 0 {
            if area % factor == 0 {
                let another = area / factor
                if another >= factor {
                    return [another,factor]
                } else {
                    return [factor,another]
                }
            }
            factor -= 1
        }
         return []
     }
 }