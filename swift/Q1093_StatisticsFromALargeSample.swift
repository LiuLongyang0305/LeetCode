
//https://leetcode.com/problems/statistics-from-a-large-sample/
class Solution {
    func sampleStats(_ count: [Int]) -> [Double] {
        var sum = 0
        var maxCount = 0
        var sumCount = Array<Int>(repeating: 0, count: 256)
        var result = Array<Double>(repeating: -1.0, count: 5)
        for i in 0...255 {
            let temp = Double(i)
            if count[i] != 0 {
                sum += i * count[i]
                if result[0].isEqual(to: -1.0) {
                    result[0] = temp
                }
                if result[1] < temp {
                    result[1] = temp
                }
                if count[i]  > maxCount {
                    maxCount = count[i]
                    result[4] = temp
                }
            }
           sumCount[i] = i == 0 ? count[i] : sumCount[i - 1] + count[i]
        }
        let total = sumCount.last!
        result[2] = Double(sum) / Double(total)
        let half = total / 2
        var i = 0
        while sumCount[i] < half {
            i = i + 1
        }
        if total % 2 == 1 {
            while count[i] == 0 {
                i = i + 1
            }
            result[3] = Double(i)
        } else {

            let delta = sumCount[i] - half
            if delta > 0 {
                result[3] = Double(i)
            } else {
                var j = i + 1
                while count[j] == 0 {
                    j += 1
                }
                result[3] = Double(i + j) / 2.0
            }
        }
        return result
    }
}

