// https://leetcode.com/problems/minimum-operations-to-make-the-array-alternating/
class Solution {
    func minimumOperations(_ nums: [Int]) -> Int {
        guard nums.count > 1 else {
            return 0
        }
        guard nums.count > 2 else {
            return nums[0] == nums[1] ? 1 : 0
        }
        let N = nums.count
        //奇数
        let odd = N >> 1
        //偶数
        let even = odd + (N & 1 == 0 ? 0 : 1)
        var counter1 = [Int:Int]()
        var counter2 = [Int:Int]()
        for idx in 0..<N {
            if idx & 1 == 0 {
                counter2[nums[idx],default: 0] += 1
            } else {
                counter1[nums[idx],default: 0] += 1
            }
        }
        
        
        
        let sortedCounter1 = counter1.sorted { $0.value > $1.value}
        let sortedCounter2 = counter2.sorted { $0.value > $1.value}
        let P = sortedCounter1.count
        let Q = sortedCounter2.count
        guard P != 1 || Q != 1 else {
            return sortedCounter1[0].key == sortedCounter2[0].key ? min(odd, even) : 0
        }
        guard P != 1 else {
            let idx = sortedCounter2.firstIndex { $0.key != sortedCounter1[0].key}!
            return even - sortedCounter2[idx].value
        }
        guard Q != 1 else {
            let idx = sortedCounter1.firstIndex { $0.key != sortedCounter2[0].key}!
            return odd - sortedCounter1[idx].value
        }
        var ans = N
        for (num,cnt) in sortedCounter1 {
            var i = 0
            while i < Q && sortedCounter2[i].key == num {
                i += 1
            }
            ans = min(odd - cnt + even - sortedCounter2[i].value,ans)
        }
        for (num,cnt) in counter2 {
            var i = 0
            while i < P && sortedCounter1[i].key == num {
                i += 1
            }
            ans = min(ans, even - cnt + odd - sortedCounter1[i].value)
        }
        return ans
    }
}
