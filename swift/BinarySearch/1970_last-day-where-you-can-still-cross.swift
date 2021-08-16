// https://leetcode.com/problems/last-day-where-you-can-still-cross/
class Solution {
    private typealias Position = (x:Int,y:Int)
    private typealias Direction = (dx:Int,dy:Int)
    private let directions:[Direction] = [(0,1),(0,-1),(-1,0),(1,0)]
    func latestDayToCross(_ row: Int, _ col: Int, _ cells: [[Int]]) -> Int {
        
        func check(_ days: Int) -> Bool {
            var grid = Array<Array<Bool>>(repeating: Array<Bool>(repeating: false, count: col), count: row)
            for i in 0..<days {
                grid[cells[i][0] - 1][cells[i][1] - 1] = true
            }
            var queue = [Position]()
            for c in 0..<col {
                if !grid[0][c] {
                    queue.append((0,c))
                    grid[0][c] = true
                }
            }
            while !queue.isEmpty {
                var newLevel = [Position]()
                for (x,y) in queue {
                    for (dx,dy) in directions {
                        let nx = x + dx
                        let ny = y + dy
                        guard nx >= 0 && nx < row && ny >= 0 && ny < col && !grid[nx][ny] else {
                            continue
                        }
                        guard nx != row - 1 else {
                            return true
                        }
                        grid[nx][ny] = true
                        newLevel.append((nx,ny))
                    }
                }
                queue = newLevel
            }
            return false
        }
        var left = 1
        var right = cells.count
        var ans = 0
        while left <= right {
            let mid = (left + right) >> 1
            if check(mid) {
                ans = mid
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        return ans
    }
}