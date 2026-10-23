    //https://leetcode.cn/problems/determine-if-a-simple-graph-exists/
    class Solution {
        func simpleGraphExists(_ degrees: [Int]) -> Bool {
            guard degrees.reduce(0, { $0 + $1}) & 1 == 0 else {return false}
            var sortedDegress = degrees.sorted { $0 > $1}
            let N = degrees.count
            var preffixSum = [Int](repeating: 0, count: N + 1)
            for i in  0..<N {
                preffixSum[i + 1] = preffixSum[i] + sortedDegress[i]
            }


            func solve(_ start: Int) -> Int {
                guard start < N  else {
                    return 0
                }
                //找到第一个小于start的di
                guard let la = sortedDegress.last, la < start else {
                    return start * (N - start)
                }

                var l = start
                var r = N - 1
                while l < r {
                    let mid = (l + r) >> 1
                    if sortedDegress[mid] < start {
                        r = mid
                    } else {
                        l = mid + 1
                    }
                }

                return (l - start) * start + (preffixSum.last! - preffixSum[l])
            }




            for k in 1...N {
                //preffixSum[k]
                guard preffixSum[k] <= k * (k - 1) + solve(k) else {return false}
            }
            return true
        }
    }
