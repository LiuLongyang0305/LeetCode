// https://leetcode.com/problems/increasing-decreasing-string/
 class Solution {
    func sortString(_ s: String) -> String {
        var ans = ""
        var counter = [Character:Int]()
        for ch in s {
            counter.updateValue((counter[ch] ?? 0) + 1, forKey: ch)
        }
        var sortedCounter = counter.sorted { (dic1, dic2) -> Bool in
            dic1.key.asciiValue! < dic2.key.asciiValue!
        }
        var needReversed = false
        while true {
            var level = [Character]()
            for i in 0..<sortedCounter.count {
                if sortedCounter[i].value > 0 {
                    level.append(sortedCounter[i].key)
                    sortedCounter[i].value -= 1
                }
            }
            if level.isEmpty {
                break
            }
            if needReversed {
                ans.append(contentsOf: level.reversed())
            } else {
                ans.append(contentsOf: level)
            }
            needReversed = !needReversed
        }
        return ans
    }
 }
 
