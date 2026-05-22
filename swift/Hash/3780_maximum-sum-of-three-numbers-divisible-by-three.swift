 //https://leetcode.com/problems/maximum-sum-of-three-numbers-divisible-by-three/
    class Solution {
        func maximumSum(_ nums: [Int]) -> Int {
            var arr = [Heap<Int>](repeating: Heap<Int>(), count: 3)
            for num in nums {
                let remain = num % 3
                if arr[remain].count < 3 {
                    arr[remain].insert(num)
                } else {
                    if num > arr[remain].min! {
                        let _ = arr[remain].popMin()
                        arr[remain].insert(num)
                    }
                }

            }
            var sb = 0
            for heap in arr {
                if heap.count == 3 {
                    sb = max(sb,heap.unordered.reduce(0, { $0 + $1}))
                }
            }

            for heap in arr {
                guard !heap.isEmpty else {return sb}
            }

            sb = max(sb,arr.map({ $0.max!}).reduce(0, {$0 + $1}))

            return sb
        }
    }
