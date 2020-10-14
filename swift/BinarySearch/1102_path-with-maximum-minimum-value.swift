// https://leetcode.com/problems/path-with-maximum-minimum-value/
class Solution {
    private let directions = [(0,1),(0,-1),(1,0),(-1,0)]
    private typealias Position = (x:Int,y:Int)
    func maximumMinimumPath(_ A: [[Int]]) -> Int {
        let M = A.count
        let N = A[0].count
        var elelments = Set<Int>()
        for r in 0..<M {
            for c in 0..<N {
                elelments.insert(A[r][c])
            }
        }
        let sortedElements = elelments.sorted()
        guard M != 1 && N != 1 else {
            return sortedElements[0]
        }
        func bfsCheckArrivable(largerOrEqual limit: Int) -> Bool {
            guard A[0][0] >= limit && A[M - 1][N - 1] >= limit else {
                return false
            }
            
            var visited = Array<Array<Bool>>(repeating: Array<Bool>(repeating: false, count: N), count: M)
            var queue = [Position]()
            queue.append((0,0))
            visited[0][0] = true
            
            while !queue.isEmpty {
                var nextLevel = [Position]()
                for curPos in queue {
                    for (dx,dy) in directions {
                        let nx = curPos.x + dx
                        let ny = curPos.y + dy
                        if nx >= 0 && nx < M && ny >= 0 && ny < N && A[nx][ny] >= limit && !visited[nx][ny] {
                            guard nx != M - 1 || ny != N - 1 else {
                                // print("-----   \(limit) ----   true")
                                return true
                            }
                            nextLevel.append((nx,ny))
                            visited[nx][ny] = true
                        }
                    }
                }
                queue = nextLevel
            }
            // print("-----   \(limit) ----   false")
            return false
        }
        var left = 0
        var right = sortedElements.count - 1
        var ans = Int.min
        var visited = Set<Int>()
        while left < right {
            let mid = left + (right - left) >> 1
            visited.insert(mid)
            if bfsCheckArrivable(largerOrEqual: sortedElements[mid]) {
                ans = max(ans, sortedElements[mid])
                left = mid + 1
            } else {
                right = mid
            }
        }
        return visited.contains(left) ? ans : (bfsCheckArrivable(largerOrEqual: sortedElements[left]) ? max(ans, sortedElements[left]) : ans)
    }
}
