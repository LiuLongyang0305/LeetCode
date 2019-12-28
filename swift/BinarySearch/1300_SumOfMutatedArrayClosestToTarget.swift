// https://leetcode.com/problems/sum-of-mutated-array-closest-to-target/
class Solution {
    func findBestValue(_ arr: [Int], _ target: Int) -> Int {
        let sortedArr = arr.sorted()
        let N = arr.count
        var preffix = Array<Int>(repeating: 0, count: N + 1)
        for i in 0..<N {
            preffix[i + 1] = preffix[i] + sortedArr[i]
        }
        func check(value: Int) -> Int {
           guard let index = sortedArr.firstIndex(where: { $0 > value}) else {
               return preffix.last!
           }
           return preffix[index] + value * (N - index)
        }
        var left = 0
        var right = sortedArr.last!
        while left < right {
            let mid =  (left + right)  >> 1
            if check(value: mid) >= target {
                right = mid
            } else {
                left = mid + 1
            }
        }
        let l1 = abs(check(value: left) - target)
        let l2 = abs(check(value: left - 1)  - target)
        return  l1 < l2 ? left : (left - 1)
    }
 }