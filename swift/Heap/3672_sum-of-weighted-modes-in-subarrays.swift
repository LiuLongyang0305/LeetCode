//https://leetcode.cn/problems/sum-of-weighted-modes-in-subarrays/
class Solution {
    struct ValAndFrequency: Comparable {
        static func < (lhs: Solution.ValAndFrequency, rhs: Solution.ValAndFrequency) -> Bool {
            if lhs.f == rhs.f {
                return lhs.v > rhs.v
            }
            return lhs.f < rhs.f
        }

        var v: Int
        var f: Int
    }
    func modeWeight(_ nums: [Int], _ k: Int) -> Int {
        var heap = Heap<ValAndFrequency>()
        var counter = [Int:Int]()
        var sb = 0
        for (i,v) in nums.enumerated() {
            counter[v,default: 0] += 1
            heap.insert(ValAndFrequency(v: v, f: counter[v]!))
            if i >= k {
                let idx = i - k
                counter[nums[idx],default: 0] -= 1
                while let top = heap.max, let c = counter[top.v], c != top.f {
                    let _ = heap.popMax()
                }
            }
            if i >= k - 1 {
                let top = heap.max!
                sb += top.f * top.v
            }
        }
        return sb
    }
}
