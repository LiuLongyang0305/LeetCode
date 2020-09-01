// https://leetcode.com/problems/detect-pattern-of-length-m-repeated-k-or-more-times/
class Solution1 {
    func containsPattern(_ arr: [Int], _ m: Int, _ k: Int) -> Bool {
        func check(from index: Int) -> Bool {
            let subArr = Array<Int>(arr[index..<(index + m)])
            let targetArr = Array<Int>(arr[index..<(index + m * k)])
            var tempArr = [Int]()
            for _ in 0..<k {
                tempArr.append(contentsOf: subArr)
            }
            return tempArr == targetArr
        }
        let N = arr.count
        guard N >= m * k else {
            return false
        }
        for i in 0...(N - m * k) {
            guard !check(from: i) else {
                return true
            }
        }
        return false
    }
}


class Solution {
    func containsPattern(_ arr: [Int], _ m: Int, _ k: Int) -> Bool {
        func check(_ nums: [Int]) -> Bool {
            let prefix = nums[0..<m]
            var cnt = 0
            var numsCopy = nums
            while numsCopy.count >= m {
                let temp = numsCopy[0..<m]
                if temp == prefix {
                    cnt += 1
                    if cnt >= k {
                        return true
                    }
                    numsCopy.removeFirst(m)
                } else {
                    return false
                }
            }
            return false
        }
        var arrCopy = arr
        while arrCopy.count >= m * k{
            guard !check(arrCopy) else {
                return true
            }
            arrCopy.removeFirst()
        }
        return false
    }
}