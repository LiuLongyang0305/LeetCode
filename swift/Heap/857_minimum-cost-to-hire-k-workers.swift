// https://leetcode.com/problems/minimum-cost-to-hire-k-workers/
import CoreFoundation
extension CFBinaryHeap {
    public static func getMaxHeapOfInt() -> CFBinaryHeap {
        var callbacks = CFBinaryHeapCallBacks.init()
        callbacks.compare = {  a,b,_ in
            let x = a!.load(as: Int.self)
            let y = b!.load(as: Int.self)
            return x == y ? .compareEqualTo : (x < y ? .compareGreaterThan : .compareLessThan)
        }
        return CFBinaryHeapCreate(nil, 0, &callbacks, nil)
    }
}
class Solution {
    func mincostToHireWorkers(_ quality: [Int], _ wage: [Int], _ k: Int) -> Double {
        var ans = 1000000000.0
        let qualityDouble = quality.map {Double($0)}
        let wageDouble = wage.map { Double($0)}
        let N = quality.count
        let wageUnit = (0..<N).map { wageDouble[$0] / qualityDouble[$0]}
        let  sortedIdx = (0..<N).sorted { wageUnit[$0] < wageUnit[$1]}
        
        var pointer: UnsafeMutablePointer<Int> = .allocate(capacity: 1)
        let maxHeap = CFBinaryHeap.getMaxHeapOfInt()
        
        var totalQuality = 0
        
        for idx in sortedIdx {
            if CFBinaryHeapGetCount(maxHeap) >= k {
                totalQuality -= CFBinaryHeapGetMinimum(maxHeap).load(as: Int.self)
                CFBinaryHeapRemoveMinimumValue(maxHeap)
            }
            totalQuality += quality[idx]
            pointer = .allocate(capacity: 1)
            pointer.initialize(to: quality[idx])
            CFBinaryHeapAddValue(maxHeap, pointer)
            
            if CFBinaryHeapGetCount(maxHeap) == k {
//                print("\(totalQuality)  \(wageUnit[idx])")
                ans = min(ans,Double(totalQuality) * wageUnit[idx])
            }
        }
        defer {
            pointer.deallocate()
            CFBinaryHeapRemoveAllValues(maxHeap)
        }
        
        return ans
    }
}