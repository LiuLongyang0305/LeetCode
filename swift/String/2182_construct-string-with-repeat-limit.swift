// https://leetcode.com/problems/construct-string-with-repeat-limit/
extension String {
    var counter: [Character:Int] {
        var ans = [Character:Int]()
        self.forEach { ans[$0,default: 0 ] += 1}
        return ans
    }
}
class Solution {
    func repeatLimitedString(_ s: String, _ repeatLimit: Int) -> String {
        var sortedCounter = s.counter.sorted { $0.key > $1.key}
        var ans = ""
        while let f = sortedCounter.first {
            sortedCounter.removeFirst()
            ans += String(repeating: f.key, count: min(f.value, repeatLimit))
            guard f.value > repeatLimit else {
                continue
            }
            var cnt = f.value - repeatLimit
            while cnt > 0 {
                guard !sortedCounter.isEmpty else {
                    break
                }
                ans.append(sortedCounter[0].key)
                sortedCounter[0].value -= 1
                ans += String(repeating: f.key, count: min(cnt, repeatLimit))
                cnt -= min(repeatLimit, cnt)
                if sortedCounter[0].value == 0 {
                    sortedCounter.removeFirst()
                }
            }
        }
        return ans
    }
}
