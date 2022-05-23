//https://leetcode.com/problems/maximum-bags-with-full-capacity-of-rocks/
class Solution {
    func maximumBags(_ capacity: [Int], _ rocks: [Int], _ additionalRocks: Int) -> Int {

        let N = capacity.count
        let needRocks = (0..<N).map { capacity[$0] - rocks[$0]}.sorted()
        var remain = additionalRocks
        var cnt = 0
        for need in needRocks {
            guard need <= remain else {break}
            cnt += 1
            remain -= need
        }


        return cnt
    }
}