// https://leetcode.com/problems/diagonal-traverse/
class Solution {
    func findDiagonalOrder(_ matrix: [[Int]]) -> [Int] {
        guard !matrix.isEmpty else {
            return []
        }
        let M = matrix.count
        let N = matrix[0].count
        guard N > 0 else {
            return []
        }
        guard N > 1 else {
            var ans = [Int]()
            for i in 0..<M {
                ans.append(matrix[i][0])
            }
            return ans
        }
        guard M > 1 else {
            return matrix[0]
        }
        
        var needREversed = false
        var ans = [Int]()
        
        for i in 0..<M {
            
            var tempR = i
            var level = [Int]()
        
            while tempR >= 0 && i - tempR < N {
                let y =  i - tempR
                level.append(matrix[tempR][y])
                tempR -= 1
            }
            
            if needREversed {
                ans.append(contentsOf: level.reversed())
            } else {
                ans.append(contentsOf: level)
            }
            needREversed = !needREversed
        }

        guard N > 1 else {
            return ans
        }
        
        for i in 1..<N {
            let cons = M - 1 + i
            var level = [Int]()
            var tempC = i
            while tempC < N && cons - tempC >= 0{
                let x = cons - tempC
                level.append(matrix[x][tempC])
                tempC += 1
            }
            if needREversed {
                ans.append(contentsOf: level.reversed())
            } else {
                ans.append(contentsOf: level)
            }
            needREversed = !needREversed
        }
        return ans
    }
 }