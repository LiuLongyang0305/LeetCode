// https://leetcode.com/problems/number-of-substrings-containing-all-three-characters/ 
class Solution {
    
    func numberOfSubstrings(_ s: String) -> Int {
        var ans = 0
        
        let chars = [Character](s)
        var lastIndexOfA = -1
        var lastIndexOfB = -1
        var lastIndexOfC = -1
        
        for index in 0..<s.count {
            switch chars[index] {
            case "a":
                lastIndexOfA = index
            case "b":
                lastIndexOfB = index
            case "c":
                lastIndexOfC = index
            default:
                break
            }
            let minIndex = min(lastIndexOfB, lastIndexOfA, lastIndexOfC)
            if  minIndex != -1 {
                ans += minIndex + 1
            }
        }
        return ans
    }
 }
 