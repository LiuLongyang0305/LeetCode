// https://leetcode.com/problems/employee-free-time/
/**
 * Definition for an Interval.
 * public class Interval {
 *     public var start: Int
 *     public var end: Int
 *     public init(_ start: Int, _ end: Int) {
 *         self.start = start
 *         self.end = end
 *     }
 * }
 */

class Solution {
    func employeeFreeTime(_ schedule: [[Interval]]) -> [Interval] {
        var map = [Int:Int]()
        for p in schedule {
            for interval in p {
                map[interval.start, default: 0] += 1
                map[interval.end, default: 0] -= 1
            }
        }
        var sortedMap = map.sorted { (arg0, arg1) -> Bool in
            
            let (key1, _) = arg1
            let (key0,_) = arg0
            return key0 < key1
        }
        guard sortedMap.count > 1 else {
            return []
        }
        var ans = [Interval]()
        for idx in 1..<sortedMap.count {
            sortedMap[idx].value += sortedMap[idx - 1].value
        }
        // print(sortedMap)
        for idx in 0..<(sortedMap.count - 1) {
            if sortedMap[idx].value == 0 {
                ans.append(Interval(sortedMap[idx].key, sortedMap[idx + 1].key))
            }
        }
        return ans
    }
}
