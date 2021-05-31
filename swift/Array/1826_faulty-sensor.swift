// https://leetcode.com/problems/faulty-sensor/
class Solution {
    func badSensor(_ sensor1: [Int], _ sensor2: [Int]) -> Int {
        guard sensor2 != sensor1 else {
            return -1
        }
        var idx = 0
        while idx < sensor1.count {
            if sensor1[idx] != sensor2[idx] {
                break
            }
            idx += 1
        }
        guard idx != sensor1.count - 1 else {
            return -1
        }
        return isFirstSensorBroken(sensor1, sensor2, idx) ? 1 : 2
    }
    
    private func isFirstSensorBroken(_ first: [Int], _ second: [Int], _ idx: Int) -> Bool {
        var j = idx + 1
        var i = idx
        while j < first.count {
            guard first[i] == second[j] else {
                return false
            }
            i += 1
            j += 1
        }
        return true
    }
    
}
