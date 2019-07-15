//https://leetcode.com/problems/sort-characters-by-frequency/
class Solution {
    typealias Counter = Dictionary<Character,Int>
    func frequencySort(_ s: String) -> String {
        var counter = Counter()
        for ch in s {
            if let num = counter[ch] {
                counter[ch] = num + 1
                continue
            }
            counter[ch] = 1
        }
        let  sortedCounter = counter.sorted { (arg0, arg1) -> Bool in
            let (_, value1) = arg1
            let (_, value0) = arg0
            return value0 > value1
        }
        var ans = ""
        for (key,value) in sortedCounter {
            if value  > 1 {
                ans.append(contentsOf: Array<Character>(repeating: key, count: value))
                continue
            }
            ans.append(key)
        }
        return ans
    }
}
