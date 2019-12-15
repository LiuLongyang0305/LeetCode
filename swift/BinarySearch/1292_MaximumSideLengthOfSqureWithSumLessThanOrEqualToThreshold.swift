//https://leetcode.com/problems/maximum-side-length-of-a-square-with-sum-less-than-or-equal-to-threshold/
 class Solution {
    func maxSideLength(_ mat: [[Int]], _ threshold: Int) -> Int {
        let M = mat.count
        let N = mat[0].count
        var colPreSum = Array<Array<Int>>(repeating: Array<Int>(repeating: 0, count: N + 1), count: M + 1)
        var matrixPreSum =  Array<Array<Int>>(repeating: Array<Int>(repeating: 0, count: N + 1), count: M + 1)
        for i in 0..<M {
            for j in 0..<N {
                colPreSum[i + 1][j + 1] = colPreSum[i][j + 1] + mat[i][j]
            }
        }
        for i in 0..<M {
            for j in 0..<N {
                matrixPreSum[i + 1][j + 1] = matrixPreSum[i + 1][j] + colPreSum[i + 1][j + 1]
            }
        }
        

        
        var maxSqureLength = 0
        func getMaxSqureLength(x: Int,y:Int, squreLengthLimit: Int) -> Int {
            
            func valid(x: Int, y: Int, currentLength: Int) -> Bool {
                let xLast = x + currentLength
                let yLast = y + currentLength
                let sum = matrixPreSum[xLast][yLast] - matrixPreSum[x][yLast] - matrixPreSum[xLast][y] + matrixPreSum[x][y]
                
                return sum <= threshold
            }
            
            var left = maxSqureLength + 1
            var right = squreLengthLimit
            var temp = -1
            while left < right {
                let mid = left + (right - left) >> 1
                if valid(x: x, y: y, currentLength: mid){
                    temp = mid
                    left  = mid + 1
                } else {
                    right = mid
                }
            }
            return valid(x: x, y: y, currentLength: left) ? left : temp
        }
        
        for i in 0..<M {
            for j in 0..<N {
                let maxTempSqureLength = min(M - i, N - j)
                if maxTempSqureLength > maxSqureLength {
                    let  length = getMaxSqureLength(x: i, y: j, squreLengthLimit: maxTempSqureLength)
                    if length != -1 {
                        maxSqureLength = length
                    }
                }
            }
        }
        return maxSqureLength
    }
 }
class Solution1 {
    func maxSideLength(_ mat: [[Int]], _ threshold: Int) -> Int {
        let M = mat.count
        let N = mat[0].count
        var colPreSum = Array<Array<Int>>(repeating: Array<Int>(repeating: 0, count: N + 1), count: M + 1)
        var matrixPreSum =  Array<Array<Int>>(repeating: Array<Int>(repeating: 0, count: N + 1), count: M + 1)
        for i in 0..<M {
            for j in 0..<N {
                colPreSum[i + 1][j + 1] = colPreSum[i][j + 1] + mat[i][j]
            }
        }
        for i in 0..<M {
            for j in 0..<N {
                matrixPreSum[i + 1][j + 1] = matrixPreSum[i + 1][j] + colPreSum[i + 1][j + 1]
            }
        }
        
        func valid(x: Int, y: Int, currentLength: Int) -> Bool {
            let xLast = x + currentLength
            let yLast = y + currentLength
            let sum = matrixPreSum[xLast][yLast] - matrixPreSum[x][yLast] - matrixPreSum[xLast][y] + matrixPreSum[x][y]
            
            return sum <= threshold
        }
        
        var maxSqureLength = 0
        for i in 0..<M {
            for j in 0..<N {
                let maxTempSqureLength = min(M - i, N - j)
                if maxTempSqureLength > maxSqureLength {
                    for length in (maxSqureLength + 1)...maxTempSqureLength {
                        if !valid(x: i, y: j, currentLength: length) {
                            break
                        }
                        maxSqureLength = length
                    }
                }
            }
        }
        return maxSqureLength
    }
 }