//https://leetcode.com/problems/find-k-pairs-with-smallest-sums/
typealias Counter = Dictionary<Int,[[Int]]>
class Solution {
    func kSmallestPairs(_ nums1: [Int], _ nums2: [Int], _ k: Int) -> [[Int]] {
        var counter = Counter()
        for ele in nums1 {
            for ele2 in nums2 {
                let sum = ele + ele2
                if nil != counter[sum] {
                    counter[sum]?.append([ele,ele2])
                } else {
                    counter[sum] = [[ele,ele2]]
                }
            }
        }
        let sortedCounter = counter.sorted { (arg0, arg1) -> Bool in
            let (key1, _) = arg1
            let (key, _) = arg0
            return key < key1
        }
        var  ans = [[Int]]()
        var remainder = k
        for (_,value) in sortedCounter {
            if value.count <= remainder {
                ans.append(contentsOf: value)
                remainder -= value.count
            } else {
                ans.append(contentsOf: value[0..<remainder])
                return ans
            }
        }
        return ans
    }
}

class Solution2 {
    
    func kSmallestPairs(_ nums1: [Int], _ nums2: [Int], _ k: Int) -> [[Int]] {
        var counter = Counter()
        for ele in nums1 {
            for ele2 in nums2 {
                let sum = ele + ele2
                if nil != counter[sum] {
                    counter[sum]?.append([ele,ele2])
                } else {
                    counter[sum] = [[ele,ele2]]
                }
            }
        }
        var  ans = [[Int]]()
        var sums = Array<Int>(counter.keys)
        sums.sort()
        var remainder = k
        for sum in sums {
            let values = counter[sum]!
            if remainder >= values.count {
                ans.append(contentsOf: values)
                remainder -= values.count
            } else {
                ans.append(contentsOf: values[0..<remainder])
                return ans
            }
        }
        return ans
    }
}