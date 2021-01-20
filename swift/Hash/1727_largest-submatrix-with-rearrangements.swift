// https://leetcode-cn.com/problems/largest-submatrix-with-rearrangements/
class Solution {
    
    func largestSubmatrix(_ matrix: [[Int]]) -> Int {
        let M = matrix.count
        let N = matrix[0].count
        var countOnes = 0
        for r in 0..<M {
            for c in 0..<N {
                countOnes += matrix[r][c]
            }
        }
        guard countOnes < M * N else {
            return countOnes
        }
        guard countOnes > 0 else {
            return 0
        }
        var counter = Array<[Int:Int]>(repeating: [:], count: M + 1)
        var maxArea = 0
        
        for r in 0..<M {
            for c in 0..<N {
                
                if matrix[r][c] == 1 {
                    
                    var r1 = r
                    
                    while r1 >= 0 && matrix[r1][c] == 1{
                        
                        let l = r - r1  + 1
                        let key = r << 32 | r1
                        
                        counter[l][key, default: 0] += 1
                        maxArea = max(maxArea, l * counter[l][key]!)
                        guard maxArea < countOnes else {
                            return maxArea
                        }
                        r1 -= 1
                    }
                }
            }
        }
        return maxArea
    }
}