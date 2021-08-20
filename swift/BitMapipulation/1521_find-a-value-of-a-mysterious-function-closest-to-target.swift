// https://leetcode.com/problems/find-a-value-of-a-mysterious-function-closest-to-target/
class Solution {
    func closestToTarget(_ arr: [Int], _ target: Int) -> Int {
        var ans = abs(arr[0] - target)
        var valid = Set<Int>()
        valid.insert(arr[0])
        for num in arr.dropFirst() {
            var validNew = Set<Int>()
            validNew.insert(num)
            ans = min(ans, abs(num - target))
            for pre in valid {
                validNew.insert(pre & num)
                ans = min(ans, abs(pre & num - target))
            }
            valid = validNew
        }
        return ans
    }
}