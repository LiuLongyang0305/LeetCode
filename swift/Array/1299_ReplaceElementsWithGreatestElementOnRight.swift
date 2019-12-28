// https://leetcode.com/problems/replace-elements-with-greatest-element-on-right-side/class 
Solution {
    func replaceElements(_ arr: [Int]) -> [Int] {
        var ans = Array<Int>(repeating: 0, count: arr.count)
        var maxEle = -1
        for index in (0..<arr.count).reversed() {
            ans[index] =  maxEle
            maxEle = max(maxEle, arr[index])
        }
        return ans
    }
 }

