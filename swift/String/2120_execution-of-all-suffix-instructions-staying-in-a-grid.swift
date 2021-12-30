// https://leetcode.com/problems/execution-of-all-suffix-instructions-staying-in-a-grid/
class Solution {
    func executeInstructions(_ n: Int, _ startPos: [Int], _ s: String) -> [Int] {
        let  opes = [Character](s)
        let M = opes.count
        var ans = [Int]()
        for start in 0..<M {
            var x = startPos[0]
            var y = startPos[1]
            
            var  j = start
            while j < M {
                switch opes[j] {
                case "R":
                    y += 1
                case "L":
                    y -= 1
                case "U":
                    x -= 1
                case "D":
                    x += 1
                default:
                    break
                }
                guard x >= 0 && x < n && y >= 0 && y < n else {
                    break
                }
                j += 1
            }
            ans.append(j - start )
        }
        return ans
    }
}