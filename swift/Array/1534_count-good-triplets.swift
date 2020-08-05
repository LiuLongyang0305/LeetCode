// https://leetcode.com/problems/count-good-triplets/
class Solution {
    func countGoodTriplets(_ arr: [Int], _ a: Int, _ b: Int, _ c: Int) -> Int {
        guard arr.count > 2 else {
            return 0
        }
        var  ans = 0
        let N = arr.count
        for i in 0..<(N - 2) {
            for j in (i + 1)..<(N - 1) {
                for k in (j + 1)..<N {
                    if abs(arr[i] - arr[j]) <= a && abs(arr[k] - arr[j]) <= b  && abs(arr[i] - arr[k]) <= c  {
                        ans += 1
                    }
                }
            }
        }
        return ans
    }
}