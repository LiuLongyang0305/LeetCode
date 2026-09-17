// https://leetcode.cn/problems/minimum-moves-to-clean-the-classroom/?
class Solution {

    private let dirs = [-1, 1, 0, 0]
    private let dirY = [0, 0, -1, 1]

    func minMoves(_ classroom: [String], _ energy: Int) -> Int {

        let m = classroom.count
        let n = classroom[0].count
        let cellCount = m * n

        // --------------------------------------------------
        // 1. 把 Character 网格转换成 UInt8
        // --------------------------------------------------

        var grid = [UInt8](repeating: 0, count: cellCount)

        var start = -1
        var garbageCount = 0

        // 记录每个垃圾对应的 bit
        var garbageIndex = [Int](repeating: -1, count: cellCount)

        for i in 0..<m {
            let chars = Array(classroom[i].utf8)

            for j in 0..<n {
                let pos = i * n + j
                let ch = chars[j]

                grid[pos] = ch

                if ch == 83 {          // S
                    start = pos
                } else if ch == 76 {   // L
                    garbageIndex[pos] = garbageCount
                    garbageCount += 1
                }
            }
        }

        // --------------------------------------------------
        // 2. 所有垃圾都已经收集
        // --------------------------------------------------

        let fullMask = (1 << garbageCount) - 1

        if garbageCount == 0 {
            return 0
        }

        // --------------------------------------------------
        // 3. 状态编码
        //
        // state:
        //
        // (((pos * (energy + 1)) + currentEnergy) << K) | mask
        //
        // --------------------------------------------------

        let energySize = energy + 1
        let maskBits = garbageCount

        @inline(__always)
        func encode(
            _ pos: Int,
            _ e: Int,
            _ mask: Int
        ) -> Int {
            return ((pos * energySize + e) << maskBits) | mask
        }

        @inline(__always)
        func decodeMask(_ state: Int) -> Int {
            return state & fullMask
        }

        @inline(__always)
        func decodeEnergy(_ state: Int) -> Int {
            return (state >> maskBits) % energySize
        }

        @inline(__always)
        func decodePosition(_ state: Int) -> Int {
            return (state >> maskBits) / energySize
        }

        // --------------------------------------------------
        // 4. BFS
        //
        // queue + head
        // 不再每层创建 newQueue
        // --------------------------------------------------

        var queue = [Int]()
        queue.reserveCapacity(m * n * 4)

        let initialState = encode(start, energy, 0)

        queue.append(initialState)

        var visited = Set<Int>()
        visited.reserveCapacity(m * n * 16)
        visited.insert(initialState)

        var head = 0
        var steps = 0

        while head < queue.count {

            let levelEnd = queue.count

            while head < levelEnd {

                let state = queue[head]
                head += 1

                let mask = decodeMask(state)

                if mask == fullMask {
                    return steps
                }

                let e = decodeEnergy(state)

                // 没有能量不能继续走
                if e == 0 {
                    continue
                }

                let pos = decodePosition(state)

                let x = pos / n
                let y = pos - x * n

                // --------------------------------------------------
                // 四个方向
                // --------------------------------------------------

                for k in 0..<4 {

                    let nx = x + dirs[k]
                    let ny = y + dirY[k]

                    if nx < 0 || nx >= m ||
                       ny < 0 || ny >= n {
                        continue
                    }

                    let nextPos = nx * n + ny
                    let ch = grid[nextPos]

                    // X
                    if ch == 88 {
                        continue
                    }

                    // --------------------------------------------------
                    // 收集垃圾
                    // --------------------------------------------------

                    var nextMask = mask

                    if ch == 76 {
                        let idx = garbageIndex[nextPos]
                        nextMask |= 1 << idx
                    }

                    // --------------------------------------------------
                    // R 恢复能量
                    // 否则消耗 1
                    // --------------------------------------------------

                    let nextEnergy: Int

                    if ch == 82 {
                        nextEnergy = energy
                    } else {
                        nextEnergy = e - 1
                    }

                    let nextState = encode(
                        nextPos,
                        nextEnergy,
                        nextMask
                    )

                    if visited.insert(nextState).inserted {
                        queue.append(nextState)
                    }
                }
            }

            steps += 1
        }

        return -1
    }
}
