//https://leetcode.com/problems/swim-in-rising-water/submissions/
 class Solution1 {
    private let dx = [0,0,1,-1]
    private let dy = [1,-1,0,0]
    
    func swimInWater(_ grid: [[Int]]) -> Int {
        
        let N = grid.count
        var canReachMinHeight = -1
        
        func canReach(_ position: Int,_ waterHeight: Int) -> Bool {
            
            var queue = [Int]()
            queue.append(0)
            
            var visited = Array<Array<Bool>>(repeating: Array<Bool>(repeating: false, count: N), count: N)
            visited[0][0] = true
            
            while !queue.isEmpty {
                var nextLevel = [Int]()
                for p in queue {
                    let x = p & 0xff
                    let y = p >> 8
                    for index in 0..<4 {
                        let  nextX = x + dx[index]
                        let  nextY = y + dy[index]
                        if nextX >= 0 &&  nextX < N && nextY >= 0 && nextY < N && !visited[nextX][nextY] && grid[nextX][nextY] <= waterHeight {
                            guard nextY != N  - 1 || nextX !=  N - 1 else {
                                canReachMinHeight = waterHeight
                                return true
                            }
                            visited[nextX][nextY]  = true
                            nextLevel.append(nextY << 8 | nextX)
                        }
                    }
                }
                queue = nextLevel
            }
            
            return false
        }
        
        var left = grid[0][0]
        let maxHeight = grid.map {$0.max()!}.max()!
        guard left < maxHeight else {
            return left
        }
        var right = maxHeight + 1
        while left < right {
            let mid =  left + (right -  left) >> 1
            if canReach(0,mid) {
                right = mid
            }  else {
                left = mid + 1
            }
        }
        
        guard left < canReachMinHeight else {
            return canReachMinHeight
        }
        return canReach(0,left) ? left : canReachMinHeight
    }
 }
 class Solution {
    private let dx = [0,0,1,-1]
    private let dy = [1,-1,0,0]
    
    func swimInWater(_ grid: [[Int]]) -> Int {
        
        let N = grid.count
        var canReachMinHeight = -1
        
        func canReach(_ x: Int,_ y: Int,_ waterHeight: Int) -> Bool {
            
            var queue = [[Int]]()
            queue.append([0,0])
            
            var visited = Array<Array<Bool>>(repeating: Array<Bool>(repeating: false, count: N), count: N)
            visited[0][0] = true
            
            while !queue.isEmpty {
                var nextLevel = [[Int]]()
                for p in queue {
                    for index in 0..<4 {
                        let  nextX = p[0] + dx[index]
                        let  nextY = p[1] + dy[index]
                        if nextX >= 0 &&  nextX < N && nextY >= 0 && nextY < N && !visited[nextX][nextY] && grid[nextX][nextY] <= waterHeight {
                            guard nextY != N  - 1 || nextX !=  N - 1 else {
                                canReachMinHeight = waterHeight
                                return true
                            }
                            visited[nextX][nextY]  = true
                            nextLevel.append([nextX,nextY])
                        }
                    }
                }
                queue = nextLevel
            }
            
            return false
        }
        
        var left = grid[0][0]
        let maxHeight = grid.map {$0.max()!}.max()!
        guard left < maxHeight else {
            return left
        }
        var right = maxHeight + 1
        while left < right {
            let mid =  left + (right -  left) >> 1
            if canReach(0, 0, mid) {
                right = mid
            }  else {
                left = mid + 1
            }
        }
        
        guard left < canReachMinHeight else {
            return canReachMinHeight
        }
        return canReach(0, 0, left) ? left : canReachMinHeight
    }
 }
 let grid = [[0,1,2,3,4],[24,23,22,21,5],[12,13,14,15,16],[11,17,18,19,20],[10,9,8,7,6]]
 print( Solution().swimInWater(grid))
