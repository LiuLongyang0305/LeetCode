//https://leetcode.com/problems/maximum-frequency-of-an-element-after-performing-operations-i/
class Solution {
    private let INF = 1_000_000_000_7
    func maxFrequency(_ nums: [Int], _ k: Int, _ numOperations: Int) -> Int {

        var counter = [Int:Int]()
        for num in nums {counter[num,default: 0] += 1}
        let sortedNums = [-INF] + nums.sorted() + [INF]


        //最后一个小于taeget
        func binarySearch(for target: Int) -> Int {
            var l = 0
            var r = sortedNums.count - 1
            while l < r {
                let mid = (l + r + 1) >> 1
                if sortedNums[mid] < target {
                    l = mid
                } else {
                    r = mid - 1
                }
            }
            return l
        }


        var ans = 0
        for x in sortedNums[1]...sortedNums[sortedNums.count - 2] {
            let leftIdx = binarySearch(for: x - k)
            let rightIdx = binarySearch(for: x + k + 1)
            let cntX = counter[x] ?? 0
            let needChange = rightIdx - leftIdx - cntX
            ans = max(ans,cntX + min(numOperations,needChange))
        }

        return ans
    }
}
