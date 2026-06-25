    // https://leetcode.cn/problems/minimum-lights-to-illuminate-a-road/
    class Solution {
        func minLights(_ lights: [Int]) -> Int {
            let N = lights.count
            var preffixSum = [Int](repeating: 0, count: N + 5)
            for i in 0..<N {
                if lights[i] > 0 {
                    let left = max(0,i - lights[i])
                    let right = min(N,i + lights[i])
                    preffixSum[left] += 1
                    preffixSum[right + 1] -= 1
                }
            }
            for i in 1...N {
                preffixSum[i] += preffixSum[i - 1]
            }
            var sb = 0
            var left = 0
            while left < N {
                if left < N  && preffixSum[left] > 0 {
                    left += 1
                    continue
                }
                var right = left + 1
                while right < N && preffixSum[right] == 0 {
                    right += 1
                }
                let l = right - left
                sb += l / 3 + (l % 3 == 0 ? 0 : 1)

                left = right
            }
            return sb
        }
    }
