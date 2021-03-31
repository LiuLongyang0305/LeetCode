// https://leetcode.com/problems/minimize-max-distance-to-gas-station/
class Solution {
    private let err = 1e-6
    func minmaxGasDist(_ stations: [Int], _ k: Int) -> Double {
        
        var distances: [Double] = []
        for idx in 1..<stations.count {
            distances.append(Double(stations[idx] - stations[idx - 1]))
        }
        
        func valid(_ dis: Double) -> Bool {
            var cnt = 0
            for d in distances {
                cnt += Int(d / dis)
            }
            return cnt <= k
        }
        
        var low = 0.0
        var high = 100000000.0
        while high - low > err {
            let mid: Double = low + (high - low) / 2.0
            if valid(mid) {
                high = mid
            } else {
                low = mid
            }
        }
        return low
    }
}
