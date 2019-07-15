//https://leetcode.com/problems/top-k-frequent-elements/
class Solution {
    typealias Counter = Dictionary<Int,Int>
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var ans = [Int]()
        var counter = Counter()
        for num in nums {
            if let count = counter[num] {
                counter[num] = count  + 1
            } else {
                counter[num] = 1
            }
        }
        var sortedCounter = counter.sorted { (arg0, arg1) -> Bool in
            let (_, value1) = arg1
            let (_, value0) = arg0
            return value0 > value1
        }
        for i in 0..<k {
            ans.append(sortedCounter[i].key)
        }
        return ans
    }
}
