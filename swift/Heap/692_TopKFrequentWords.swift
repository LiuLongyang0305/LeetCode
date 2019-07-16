//https://leetcode.com/problems/top-k-frequent-words/
class Solution {
    typealias Counter = Dictionary<String,Int>
    func topKFrequent(_ words: [String], _ k: Int) -> [String] {
        var ans = [String]()
        var counter = Counter()
        for word in words {
            if let count = counter[word] {
                counter[word] = count  + 1
            } else {
                counter[word] = 1
            }
        }
        var sortedCounter = counter.sorted { (arg0, arg1) -> Bool in
            let (key1, value1) = arg1
            let (key0, value0) = arg0
            if value0 != value1 {
                return value0 > value1
            }
            return key0 < key1
        }
        print(sortedCounter)
        for i in 0..<k {
            ans.append(sortedCounter[i].key)
        }
        return ans
    }
}