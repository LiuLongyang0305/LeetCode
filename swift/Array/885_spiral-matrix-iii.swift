// https://leetcode.com/problems/spiral-matrix-iii/
class Solution {
    func spiralMatrixIII(_ rows: Int, _ cols: Int, _ x: Int, _ y: Int) -> [[Int]] {
        let dx = [0,1,0,-1]
        let dy = [1,0,-1,0]
        var ans = [[Int]]()
        ans.append([x,y]);
        var r = x
        var c = y
        var d = 0
        let tot = rows * cols
        var k = 1
        while ans.count < tot {
            for _ in 0...1 {
                guard ans.count < tot else {
                    break
                }
                for _ in 0..<k {
                    guard ans.count < tot else {
                        break
                    }
                    let a = r + dx[d]
                    let b = c + dy[d]
                    if(a >= 0 && a < rows && b >= 0 && b < cols) {
                        ans.append([a,b])
                    }
                    (r,c) = (a,b)
                }
                d = (d + 1) % 4
            }
            k += 1
        }
        return ans
    }
}