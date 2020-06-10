// https://leetcode-cn.com/problems/shun-shi-zhen-da-yin-ju-zhen-lcof/
class Solution {
    
    private typealias Direction = (dx:Int,dy:Int)
    private let directions: [Direction] = [(0,1),(1,0),(0,-1),(-1,0)]
    
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        guard !matrix.isEmpty && !matrix[0].isEmpty else {
            return []
        }
        let M = matrix.count
        let N = matrix[0].count
        var visited = Array<Array<Bool>>(repeating: Array<Bool>(repeating: false, count: N), count: M)
        var ans = [Int]()
        ans.append(matrix[0][0])
        visited[0][0] = true
        
        func getNextDirection(_ x: Int, y: Int, _ direction: Int) -> Int? {
            for i in 0..<3 {
                let index = (direction + i ) % 4
                let nextX = x + directions[index].dx
                let nextY = y + directions[index].dy
                if nextX >= 0 && nextX < M && nextY >= 0 && nextY < N && !visited[nextX][nextY] {
                    return index
                }
            }
            return nil
        }
        func dfs(_ x: Int, _ y: Int, direction: Int){
            guard let nextDirIndex = getNextDirection(x, y: y, direction) else {
                return
            }
            let nextX = x + directions[nextDirIndex].dx
            let nextY = y + directions[nextDirIndex].dy
            visited[nextX][nextY] = true
            ans.append(matrix[nextX][nextY])
            dfs(nextX, nextY, direction: nextDirIndex)
        }
        dfs(0, 0, direction: 0)
        return ans
    }
}