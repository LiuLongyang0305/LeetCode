// https://leetcode.com/problems/confusing-number/
// https://leetcode.com/problems/confusing-number/
class Solution {
    private let map = [0,1,-1,-1,-1,-1,9,-1,8,6]
    func confusingNumber(_ N: Int) -> Bool {
        var temp = N
        var rotatedNum = 0
        while temp > 0 {
            let digit = temp % 10
            guard map[digit] != -1 else {
                return false
            }
            rotatedNum *= 10
            rotatedNum += map[digit]
            temp /= 10
        }
        return rotatedNum != N
    }
}