//https://leetcode.com/contest/biweekly-contest-12/problems/array-transformation/
class Solution {
    func transformArray(_ arr: [Int]) -> [Int] {
        guard arr.count > 2 else {
            return arr
        }
        var ans = arr
        for i in 1...(arr.count - 2) {
            if arr[i] > arr[i - 1] && arr[i] > arr[i + 1] {
                ans[i] -= 1
            }
            if arr[i] < arr[i - 1] && arr[i] < arr[i + 1] {
                ans[i] += 1
            }
        }
        guard ans != arr else {
            return ans
        }
        return transformArray(ans)
    }
}