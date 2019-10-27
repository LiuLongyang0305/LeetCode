//https://leetcode.com/problems/spiral-matrix-ii/
class Solution {
    func generateMatrix(_ n: Int) -> [[Int]] {
        var ans = Array<Array<Int>>(repeating: Array<Int>(repeating: -1, count: n), count: n)
        let maxEle = n * n
        var left = 0
        var right = n - 1
        var top  = 0
        var bottom = n - 1
        var num = 1
        while num <= maxEle {
            //left--->right
//            print("left = \(left)  right = \(right)")
            if left <= right && num <= maxEle {
                for i in left...right {
                    ans[top][i] = num
                    num += 1
                }
                top += 1
            }
            //top--->bottom
//            print("top = \(top)  botoom = \(bottom)")
            if top <= bottom && num <= maxEle {
                for i in top...bottom {
                    ans[i][right] =  num
                    num += 1
                }
                right  -= 1
            }
            //right--->left
//            print("left = \(left)  right = \(right)")
            if left <= right && num <= maxEle {
                for i in (left...right).reversed() {
                    ans[bottom][i] = num
                    num +=  1
                }
                bottom -= 1
            }
            //bottom-->top
//            print("top = \(top)  botoom = \(bottom)")
            if top <= bottom && num <= maxEle {
                for i in (top...bottom).reversed() {
                    ans[i][left] = num
                    num += 1
                }
                left += 1
            }
        }
        return ans
    }
}