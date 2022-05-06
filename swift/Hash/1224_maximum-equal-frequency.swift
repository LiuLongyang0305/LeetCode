// https://leetcode.com/problems/maximum-equal-frequency/
class Solution {
    func maxEqualFreq(_ nums: [Int]) -> Int {

        let N = nums.count
        var ans = 1
        var counter = [nums[0]:1]

        var cntToNums = [Int:Set<Int>]()
        cntToNums[1,default: []].insert(nums[0])

        for idx in 1..<N {

            if let c = counter[nums[idx]] {
                counter[nums[idx]] = c + 1
                cntToNums[c + 1, default: []].insert(nums[idx])
                cntToNums[c]?.remove(nums[idx])
                if cntToNums[c]!.isEmpty {
                    cntToNums.removeValue(forKey: c)
                }
            } else {
                counter[nums[idx]] = 1
                cntToNums[1,default: []].insert(nums[idx])
            }


            let P = counter.count
            let M = idx + 1
            // print("counter = \(counter)  M = \(M) P = \(P)  cntToNum = \(cntToNums) ")
            //情况1：前缀里面只有一个元素
            if P == 1 || P == M {
                ans = M
                continue
            }
            //情况2：数字的出现频率为多个ave,以及1个ave+ 1
            if (M - 1) % P == 0 {
                let ave = (M - 1) / P
                if let l = cntToNums[ave],let m = cntToNums[ave + 1], 1 == m.count, l.count * ave + ave + 1 == M {
                    ans = M
                    continue
                }
            }
            //情况3：数字的出现频率为多个ave,以及只有一个数字出现1次
            if let one = cntToNums[1], 1 == one.count {
                let ave = (M - 1) / (P - 1)
                if let m = cntToNums[ave], m.count * ave + 1 == M {
                    ans = M
                }
            }

        }
        return ans
    }
}