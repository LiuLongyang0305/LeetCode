//https://leetcode.cn/problems/earliest-finish-time-for-land-and-water-rides-ii/
struct Equipment: Hashable,Comparable {
    static func < (lhs: Equipment, rhs: Equipment) -> Bool {
        return lhs.endTime < rhs.endTime
    }

    var idx: Int
    var startTime: Int
    var durarion: Int
    var endTime: Int {
        get {
            return startTime + durarion
        }
    }
}

class Solution {


    func earliestFinishTime(_ landStartTime: [Int], _ landDuration: [Int], _ waterStartTime: [Int], _ waterDuration: [Int]) -> Int {

        let N = landDuration.count
        let M = waterDuration.count

        let sortedLandEquips = (0..<N).map { i in
            Equipment(idx: i, startTime: landStartTime[i], durarion: landDuration[i])
        }.sorted()
        let sortedWaterEquips = (0..<M).map { i in
            Equipment(idx: i, startTime: waterStartTime[i], durarion: waterDuration[i])
        }.sorted()

        return min(cal(startWith: sortedLandEquips, secondCoiceIn: sortedWaterEquips), cal(startWith: sortedWaterEquips, secondCoiceIn: sortedLandEquips))
    }


    private func cal(startWith equiments: [Equipment], secondCoiceIn anotherEquipments: [Equipment]) -> Int {

        var ans = Int.max

        let M = anotherEquipments.count

        var notStartedHeap = Heap<Equipment>(anotherEquipments)

        let sortedAnotherEquipmentsByStartTime = anotherEquipments.sorted { e1, e2 in
            e1.startTime < e2.startTime
        }

        var curIdx = 0
        var minDurationStarted = Int.max

        var startedIndices = Set<Int>()


        for e in equiments {
            while curIdx < M && sortedAnotherEquipmentsByStartTime[curIdx].startTime <= e.endTime {
                minDurationStarted = min(minDurationStarted,sortedAnotherEquipmentsByStartTime[curIdx].durarion)
                startedIndices.insert(sortedAnotherEquipmentsByStartTime[curIdx].idx)
                curIdx += 1
            }
            while let p = notStartedHeap.min, startedIndices.contains(p.idx){
                let _ = notStartedHeap.popMin()
            }
            if minDurationStarted != Int.max {
                ans = min(ans,e.endTime + minDurationStarted)
            }
            if let p = notStartedHeap.min {
                ans = min(ans,p.endTime)
            }
        }
        return ans
    }
}
