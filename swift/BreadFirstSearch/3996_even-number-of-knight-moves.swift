// https://leetcode.cn/problems/even-number-of-knight-moves/
class Solution {
    func canReach(_ start: [Int], _ target: [Int]) -> Bool {
        let dirs:[(dx:Int,dy:Int)] = [(1,2),(1,-2),(2,1),(2,-1),(-1,2),(-2,1),(-1,-2),(-2,1)]
        let M = 8
        var visited = [[(odd:Bool,even:Bool)]](repeating: [(Bool,Bool)](repeating: (false,false), count: M), count: M)
        visited[start[0]][start[1]].odd = true
        
        var queue:[(Int,Int,Int)] = [(start[0],start[1],0)]
        while !queue.isEmpty {
            var newQueue:[(Int,Int,Int)] = []
            for (x,y,t) in queue {
                for (dx,dy) in dirs {
                    let nx = x + dx
                    let ny = y + dy
                    let newT = t + 1
                    guard nx >= 0 && nx < M && ny >= 0 && ny < M else {continue}
                    if newT % 2 == 0 {
                        guard !visited[nx][ny].odd else {continue}
                        visited[nx][ny].odd = true
                    } else {
                        guard !visited[nx][ny].even else {continue}
                        visited[nx][ny].even = true
                    }
                    newQueue.append((nx,ny,newT))
                }
            }
            queue = newQueue
        }
        return visited[target[0]][target[1]].odd
    }
}
