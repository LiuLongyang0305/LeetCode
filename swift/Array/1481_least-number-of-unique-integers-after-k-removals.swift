// https://leetcode.com/problems/least-number-of-unique-integers-after-k-removals/
class Solution {
    func findLeastNumOfUniqueInts(_ arr: [Int], _ k: Int) -> Int {
        var counter = [Int:Int]()
        arr.forEach { counter[$0,default: 0 ] += 1}
        let sortedCounter = counter.sorted { (arg0, arg1) -> Bool in
            
            let (_, value1) = arg1
            let (_, value0) = arg0
            return value0 < value1
        }
        var total = k
        for (key,val) in sortedCounter {
            guard total > 0 else {
                break
            }
            if total < val {
                break
            } else {
                total -= val
                counter.removeValue(forKey: key)
            }
        }
        return counter.count
    }
}


