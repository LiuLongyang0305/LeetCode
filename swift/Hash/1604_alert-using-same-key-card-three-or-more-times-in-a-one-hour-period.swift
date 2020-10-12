// https://leetcode.com/problems/alert-using-same-key-card-three-or-more-times-in-a-one-hour-period/
class Solution {
    func alertNames(_ keyName: [String], _ keyTime: [String]) -> [String] {
        func parseTime(_ timeStr: String) -> Int {
            var time = timeStr
            let hour = Int(String(time[...time.index(after: time.startIndex)]))!
            time.removeFirst(3)
            let min = Int(String(time))!
            return hour * 60 + min
        }
        var ans = [String]()
        var record = [String:[Int]]()
        for idx in 0..<keyName.count {
            record[keyName[idx],default: []].append(parseTime(keyTime[idx]))
        }
        for (name, rec) in record {
            let sortedTime = rec.sorted()
            guard sortedTime.count >= 3 else {
                continue
            }
            for i in 2..<sortedTime.count {
                if sortedTime[i] - sortedTime[i - 2] <= 60 {
                    ans.append(name)
                    break
                }
            }
        }
        return ans.sorted()
    }
}

