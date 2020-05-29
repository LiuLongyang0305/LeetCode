// https://leetcode-cn.com/problems/smallest-rectangle-enclosing-black-pixels/
class Solution1 {
    private typealias Info = (up:Int,down:Int,left:Int,right:Int)
    private typealias Direction = (dx:Int,dy:Int)
    private let directions: [Direction] = [(0,1),(0,-1),(1,0),(-1,0)]
    func minArea(_ image: [[Character]], _ x: Int, _ y: Int) -> Int {
        
        var ans:Info = (Int.max,Int.min,Int.max,Int.min)
        var visited = Set<[Int]>()
        let M = image.count
        let N = image[0].count
        
        func dfs(_ x: Int,_ y: Int) {
            ans = (min(y, ans.up),max(y, ans.down),min(ans.left, x),max(x, ans.right))
            for dir in directions {
                let nextX = x + dir.dx
                let nextY = y + dir.dy
                if nextX >= 0 && nextX < M && nextY >= 0 && nextY < N && image[nextX][nextY] == "1" && !visited.contains([nextX,nextY]){
                    visited.insert([nextX,nextY])
                    dfs(nextX, nextY)
                }
            }
        }
        visited.insert([x,y])
        dfs(x, y)
        return (ans.down - ans.up + 1) * (ans.right - ans.left + 1)
    }
}

class Solution {
    func minArea(_ image: [[Character]], _ x: Int, _ y: Int) -> Int {
        
        let M = image.count
        let N = image[0].count
        var left = x
        var right = x
        var up = y
        var down = y
        for r in 0..<M {
            for c in 0..<N {
                if image[r][c] == "1" {
                    (left,right,up,down) = (min(left, x),max(x, right),min(y, up),max(y, down))
                }
            }
        }
        return (right - left + 1) * (down - up + 1)
    }
}
