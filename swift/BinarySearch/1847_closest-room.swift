// https://leetcode.com/problems/closest-room/
class Solution {
    func closestRoom(_ rooms: [[Int]], _ queries: [[Int]]) -> [Int] {

        let M = queries.count
        let N = rooms.count

        let sortedRoomIndicesBySize = (0..<N).sorted { rooms[$0][1] > rooms[$1][1]}
        var ans = [Int](repeating: -1, count: M)
        let sortedIdx = (0..<M).sorted { queries[$0][1] > queries[$1][1]}

        var sortedRoomIds =  [-1,Int.max]

        func insertRoomById(_ id: Int ) {
            var left = 0
            var right = sortedRoomIds.count - 1
            while left < right {
                let mid = (left + right) >> 1
                if sortedRoomIds[mid] > id {
                    right = mid
                } else {
                    left = mid + 1
                }
            }
            sortedRoomIds.insert(id, at: left)
        }


        func binarySearchId(_ prefferId: Int) -> Int {
            var left = 0
            var right = sortedRoomIds.count - 1
            while left < right {
                let mid = (left + right) >> 1
                if sortedRoomIds[mid] >= prefferId {
                    right = mid
                } else {
                    left = mid + 1
                }
            }

            if sortedRoomIds[left] == Int.max {
                return sortedRoomIds[left - 1]
            }

            if left == 1 {
                return sortedRoomIds[left]
            }
            let leftDis = abs(prefferId - sortedRoomIds[left - 1])
            let rightDis = abs(prefferId - sortedRoomIds[left])

            return leftDis <= rightDis ? sortedRoomIds[left - 1] : sortedRoomIds[left]

        }

        var roomIdx = 0
        var lastIdx = -1
        for idx in sortedIdx {
            if lastIdx != -1 &&  queries[idx] == queries[lastIdx]  {
                ans[idx] = ans[lastIdx]
                continue
            }
            let minSize = queries[idx][1]
            let prefferId = queries[idx][0]
            while roomIdx < N && rooms[sortedRoomIndicesBySize[roomIdx]][1] >= minSize {
                insertRoomById(rooms[sortedRoomIndicesBySize[roomIdx]][0])
                roomIdx += 1
            }
            guard sortedRoomIds.count > 2 else {continue}
            ans[idx] = binarySearchId(prefferId)
            lastIdx = idx

        }
        return ans
    }
}

