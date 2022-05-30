// https://leetcode.com/problems/minimum-obstacle-removal-to-reach-corner/
import CoreFoundation
typealias Info = (x:Int,y:Int,cnt:Int)

extension CFBinaryHeap {

    static public func getMinHeapOfInfo() -> CFBinaryHeap {
        var callbacks = CFBinaryHeapCallBacks()
        callbacks.compare = { a, b,_ in
            let x = a!.load(as: Info.self)
            let y = b!.load(as: Info.self)
            return x.cnt < y.cnt ? .compareLessThan : .compareGreaterThan
        }
        return CFBinaryHeapCreate(nil, 0, &callbacks, nil)
    }

    var isEmpty: Bool {
        return CFBinaryHeapGetCount(self) == 0
    }
}

class Solution {
    private typealias Direction = (dx:Int, dy: Int)
    private let directions:[Direction] = [(0,1),(0,-1),(1,0),(-1,0)]
    private var pointer: UnsafeMutablePointer<Info> = .allocate(capacity: 1)
    private let queue = CFBinaryHeap.getMinHeapOfInfo()
    func minimumObstacles(_ grid: [[Int]]) -> Int {
        let M = grid.count
        let N = grid[0].count
        var dp = [[Int]](repeating: [Int](repeating: Int.max, count: N), count: M)
        dp[0][0] = 0
        add((0,0,0))
        while !queue.isEmpty {
            let (x,y,cnt) = pop()
            guard cnt < dp[M - 1][N - 1] else {continue}
            for (dx,dy) in directions {
                let nx = x + dx
                let ny = y + dy
                guard nx >= 0 && nx < M && ny >= 0 && ny < N else {continue}
                let need = cnt + grid[nx][ny]
                guard need < dp[nx][ny] else {continue}
                dp[nx][ny] = need

                add((nx,ny,need))
            }

        }

        return dp[M - 1][N - 1]
    }


    private func add(_ info: Info) {
        pointer = .allocate(capacity: 1)
        pointer.initialize(to: info)
        CFBinaryHeapAddValue(queue, pointer)
    }


    private func pop() -> Info {
        let info = CFBinaryHeapGetMinimum(queue).load(as: Info.self)
        CFBinaryHeapRemoveMinimumValue(queue)
        return info
    }
}