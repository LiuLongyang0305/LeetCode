    // https://leetcode.cn/problems/minimum-time-to-build-blocks/
    class Solution {
        func minBuildTime(_ blocks: [Int], _ split: Int) -> Int {
            var heap = Heap<Int>(blocks)
            while heap.count > 1 {
                let _ = heap.popMin()
                let x = heap.popMin()!
                heap.insert(split + x)
            }
            return heap.min!
        }
    }
