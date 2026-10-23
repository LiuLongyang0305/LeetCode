//https://leetcode.cn/problems/maximum-subarray-sum-of-fixed-length-after-at-most-k-swaps/
class Solution {
    func maxSum(_ nums: [Int], _ length: Int, _ k: Int) -> Int {
        let M = nums.count
        let candidateLength = M - length
        var curSum = nums.prefix(length).reduce(0) { $0 + $1}

        guard candidateLength > 0 else {
            return curSum
        }
        let limit = min(candidateLength,length,k)

        var sortedChoosed = nums.prefix(length).sorted()
        var sortedCandidate = nums.suffix(candidateLength).sorted()

        func solve() -> Int {
            guard limit > 0 else {return 0}
            var delta = 0
            var l = 0
            var r = sortedCandidate.count - 1
            for _ in 0..<limit{
                guard sortedCandidate[r] - sortedChoosed[l] > 0 else {break}
                delta += sortedCandidate[r] - sortedChoosed[l]
                l += 1
                r -= 1
            }
            return delta
        }






        var ans = curSum + solve()



        for r in length..<M {
            if limit > 0 {
                    //candidate 移除num[r],添加nums[r - length]
                update(nums[r - length], nums[r],in: &sortedCandidate)
                    //choosed移除nums[r - length]，添加nums[r]
                update(nums[r], nums[r - length],in: &sortedChoosed)
            }
            curSum += nums[r] - nums[r - length]
            ans = max(ans,curSum + solve())
        }


        return ans
    }

     private func update(_ add: Int, _ remove: Int, in arr: inout [Int]) {

         func addNum(_ num: Int) {
             if let f = arr.first, f >= num {
                 arr.insert(num, at: 0)
                 return
             }
             if let la = arr.last, la <= num {
                 arr.append(num)
                 return
             }
             if let idx = arr.firstIndex(where: {$0 > num}) {
                 arr.insert(num, at: idx)
             }
         }

         func removeNum(_ num:Int) {
             if let idx = arr.firstIndex(of: num) {
                 arr.remove(at: idx)
             }
         }

         addNum(add)
         removeNum(remove)
    }
}
