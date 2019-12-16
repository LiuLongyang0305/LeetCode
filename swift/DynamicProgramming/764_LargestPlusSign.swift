//https://leetcode.com/problems/largest-plus-sign/submissions/ 
class Solution {
    typealias Position = (x:Int,y:Int)
    func orderOfLargestPlusSign(_ N: Int, _ mines: [[Int]]) -> Int {
        guard N * N != mines.count else {
            return 0
        }
        var grid = Array<Array<Bool>>(repeating: Array<Bool>(repeating: false, count: N), count: N)
        for p in mines {
            grid[p[0]][p[1]] = true
        }
        var maxPlusSignArmLength = 1
        
        func valid(plusSignCenter p: Position,armLength: Int) -> Bool {
            for delta in 0..<armLength {
                if grid[p.x + delta][p.y] || grid[p.x - delta][p.y] || grid[p.x ][p.y + delta] || grid[p.x ][p.y - delta] {
                    return  false
                }
            }
            return true
        }
        
        func getMaxArmLength(plusSignCenter p: Position) -> Int? {
            let currentMaxLength = min(p.x + 1, N - p.x, p.y + 1, N - p.y)
            guard currentMaxLength > maxPlusSignArmLength else {
                return nil
            }
            guard valid(plusSignCenter: p, armLength: maxPlusSignArmLength + 1) else {
                return nil
            }
            var armLength = maxPlusSignArmLength + 2
            while armLength <= currentMaxLength {
                let delta = armLength - 1
                if grid[p.x + delta][p.y] || grid[p.x - delta][p.y] || grid[p.x ][p.y + delta] || grid[p.x ][p.y - delta]  {
                    break
                }
                armLength += 1
            }
            return armLength - 1
        }
        
        for i in 0..<N {
            for j in 0..<N {
                if i != 0 && i != N - 1 && j != 0 && j != N - 1 && !grid[i][j] {
                    if let armLength = getMaxArmLength(plusSignCenter: Solution.Position(i,j))  {
                        maxPlusSignArmLength = armLength
                    }
                }
            }
        }
        return maxPlusSignArmLength
    }
 }