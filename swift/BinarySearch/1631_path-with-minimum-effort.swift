// https://leetcode.com/problems/path-with-minimum-effort/
class Solution {
    private typealias Direction = (dx:Int,dy:Int)
    private let directions:[Direction] = [(0,1),(0,-1),(1,0),(-1,0)]
    func minimumEffortPath(_ heights: [[Int]]) -> Int {
        let M = heights.count
        let N = heights[0].count
        guard M * N > 1 else {
            return 0
        }
        var graph = [Int:[Int:Int]]()
        var maxDis = 0
        for r in 0..<M {
            for c in 0..<N {
                let from = r << 8 | c
                for dir in directions {
                    let newX = r + dir.dx
                    guard newX >= 0 && newX < M else {
                        continue
                    }
                    let newY = c + dir.dy
                    guard newY >= 0 && newY < N else {
                        continue
                    }
                    let to = newX << 8 | newY
                    let dis = abs(heights[r][c] - heights[newX][newY])
                    maxDis = max(dis, maxDis)
                    graph[from, default: [:] ][to] = dis
                }
            }
        }
        let target = (M - 1) << 8 | (N - 1)
        func check(_ disLimit: Int) -> Bool {
            var visited = Set<Int>()
            var queue = [0]
            visited.insert(0)
            while !queue.isEmpty {
                var nextLevel = [Int]()
                for p in queue {
                    guard let nextPositions = graph[p] else {
                        continue
                    }
                    for (nextP,dis) in nextPositions {
                        if !visited.contains(nextP) && dis <= disLimit {
                            guard nextP != target else {
                                return true
                            }
                            visited.insert(nextP)
                            nextLevel.append(nextP)
                        }
                    }
                }
                queue = nextLevel
            }
            return false
        }
        var low = 0
        var high = maxDis
        var checked = Set<Int>()
        var ans = Int.max
        while low < high {
            let mid = low + (high - low) >> 1
            checked.insert(mid)
            if check(mid) {
                ans = min(ans, mid)
                high = mid - 1
            } else {
                low = mid + 1
            }
        }
        return checked.contains(low) ? ans : (check(low) ? min(ans, low) : ans)
    }
}

