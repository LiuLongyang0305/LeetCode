//https://leetcode.com/problems/number-of-burgers-with-no-waste-of-ingredients/ 
class Solution {
     func numOfBurgers(_ tomatoSlices: Int, _ cheeseSlices: Int) -> [Int] {

        let moreThan = tomatoSlices - cheeseSlices << 1
        guard moreThan >= 0 else {
            return []
        }
        guard moreThan % 2 == 0 else {
            return  []
        }
        let jumbo = moreThan >> 1
        let small = cheeseSlices - jumbo
        guard small >= 0 else {
            return []
        }
        return [jumbo,small]
     }
 }