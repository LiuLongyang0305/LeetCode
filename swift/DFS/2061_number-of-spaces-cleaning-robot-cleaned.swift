//https://leetcode.com/problems/number-of-spaces-cleaning-robot-cleaned/
class Solution {
    
    private typealias Direction = (dx:Int,dy:Int)
    private let directions: [Direction] = [(0,1),(1,0),(0,-1),(-1,0)]
    private let targetState = 15
    func numberOfCleanRooms(_ room: [[Int]]) -> Int {
        let M = room.count
        let N = room[0].count
        
        var visited = Array<Array<Array<Bool>>>(repeating: Array<Array<Bool>>(repeating: Array<Bool>(repeating: false, count: 4), count: N + 5), count: M + 5)
        var haven = [[Bool]](repeating: [Bool](repeating: false, count: N + 5), count: M + 5)
        
        var ans = 0
        var x = 0
        var y = 0
        var d = 0
        while true {
            guard !visited[x][y][d]  else {break}
            visited[x][y][d] = true
            if !haven[x][y] {
                haven[x][y] = true
                ans += 1
            }
            let nx = x + directions[d].dx
            let ny = y + directions[d].dy
            guard nx >= 0 && nx < M && ny >= 0 && ny < N && room[nx][ny] == 0 else {
                d = (d + 1) % 4
                continue
            }
            x = nx
            y = ny
        }
        return ans
    }
}