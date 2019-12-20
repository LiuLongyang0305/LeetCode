// https://leetcode.com/problems/ones-and-zeroes/
 struct Counter: Hashable {
    var ones: Int
    var zeros: Int
 }
 extension String   {
    func countOnesAndZeros() -> Counter {
        var ones = 0
        for ch in self {
            if ch == "1" {
                ones += 1
            }
        }
        return Counter(ones: ones, zeros: count - ones)
    }
 }
 class Solution {
    func findMaxForm(_ strs: [String], _ m: Int, _ n: Int) -> Int {
        let strsCounter = strs.map { $0.countOnesAndZeros()}
        var status = [Counter:Int]()
        status[Counter(ones: n, zeros: m)] = 0
        for strCounter in strsCounter {
            let temp = status
            for (counter,formedStrsCount) in temp {
                let remainOnes = counter.ones - strCounter.ones
                let remainZeros =  counter.zeros - strCounter.zeros
                if remainOnes >= 0 && remainZeros >= 0 {
                    let remainCounter  = Counter(ones: remainOnes, zeros: remainZeros)
                    if let c = status[remainCounter],  c > formedStrsCount + 1 {
                        continue
                    }
                    status.updateValue(formedStrsCount + 1, forKey: remainCounter)
                }
            }
        }
        return status.values.max()!
    }
 }
