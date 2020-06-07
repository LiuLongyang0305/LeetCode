// https://leetcode.com/problems/the-k-strongest-values-in-an-array/
class Solution {
    func getStrongest(_ arr: [Int], _ k: Int) -> [Int] {
        var ans = [Int]()
        let sortedArr = arr.sorted()
        let midIndex = (arr.count - 1) >> 1
        let mid = sortedArr[midIndex]
        var i = 0
        var j = arr.count - 1
        while ans.count < k {
            let leftMaxDis = i < midIndex ? mid - sortedArr[i] : -1
            let rightMaxDis = j >= midIndex ? sortedArr[j] - mid : -1
            if rightMaxDis >= leftMaxDis {
                ans.append(sortedArr[j])
                j -= 1
            } else {
                ans.append(sortedArr[i])
                i += 1
            }
        }
        return ans
    }
}
