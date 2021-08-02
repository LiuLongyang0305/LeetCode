// https://leetcode.com/problems/minimum-garden-perimeter-to-collect-enough-apples/
class Solution {
    func minimumPerimeter(_ neededApples: Int) -> Int {
        var low = 1
        var high = 1000000
        while low < high {
            let mid = (low + high) >> 1
            let applesCnt = 2 * mid * (mid + 1) * (2 * mid + 1)
            if applesCnt < neededApples {
                low = mid + 1
            } else {
                high = mid
            }
        }
        return 8 * low
    }
}