// https://leetcode.com/problems/find-the-distance-value-between-two-arrays/
class Solution {
    func findTheDistanceValue(_ arr1: [Int], _ arr2: [Int], _ d: Int) -> Int {
        var ans = 0
        var existed = [Int:Bool]()
        for num in arr2 {
            for i in (num - d)...(num + d) {
                existed[i] = false
            }
        }
        for num in arr1 {
            if existed[num] == nil {
                ans += 1
            }
        }
        return ans
    }
}

