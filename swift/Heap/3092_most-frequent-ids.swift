//https://leetcode.cn/problems/most-frequent-ids/
struct Recorder {
    var id: Int
    var cnt: Int
}

extension Recorder: Comparable{
    static func < (lhs: Recorder, rhs: Recorder) -> Bool {
        return lhs.cnt < rhs.cnt
    }
}

class Solution {
    func mostFrequentIDs(_ nums: [Int], _ freq: [Int]) -> [Int] {
        let N = nums.count
        var ans = [Int](repeating: 0, count: N)
        var curFrequency = [Int:Int]()
        var heap = Heap<Recorder>()
        for i in 0..<N {
            let (id,delta) = (nums[i],freq[i])
            let new = Recorder(id: id, cnt:(curFrequency[id] ?? 0) + delta)
            curFrequency[id,default: 0] += delta
            heap.insert(new)
            while let mx = heap.max,let  curCnt = curFrequency[mx.id], mx.cnt != curCnt  {
                let _ = heap.popMax()
            }
            ans[i] = heap.max?.cnt ?? 0
        }
        return ans
    }
}