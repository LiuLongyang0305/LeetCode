
//https://leetcode.com/problems/maximum-beauty-of-an-array-after-applying-operation/
class Solution {
    func maximumBeauty(_ nums: [Int], _ k: Int) -> Int {

        var ans = 0
        var counter = [Int:Int]()
        for num in nums {
            counter[num - k,default: 0] += 1
            counter[num + k + 1,default: 0] -= 1
        }
        let sortedCounter = counter.sorted { $0.key < $1.key}
        // print(sortedCounter)
        var sum = 0
        for (_,c) in sortedCounter {
            sum += c
            // print(sum)
            ans = max(ans,sum)
        }
        return ans
    }
}
