//https://leetcode.com/problems/minimum-removals-to-balance-array/
class Solution {

    func minRemoval(_ nums: [Int], _ k: Int) -> Int {

        var counter  = [Int:Int]()
        for num in nums {
            counter[num,default: 0] += 1
        }
        let sortedCounter = counter.sorted { p1, p2 in
            p1.key < p2.key
        }

        var pre = [0]
        for p in sortedCounter {
            pre.append(pre.last! + p.value)
        }
        
        let M = sortedCounter.count
        let N = nums.count

        var ans = Int.max
        var right = 0
        for left in 0..<M {
            let maxEle = sortedCounter[left].key * k
            while right < M && sortedCounter[right].key <= maxEle {
                right += 1
            }
            ans = min(ans,pre[left] + (N - pre[right]) )
        }
        return ans
    }
}
