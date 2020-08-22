// https://leetcode.com/problems/max-difference-you-can-get-from-changing-an-integer/
extension Int {
    var toArr : [Int] {
        get {
            var ans = [Int]()
            var t = self
            while t > 0 {
                ans.insert(t % 10, at: 0)
                t /= 10
            }
            return ans
        }
    }
}
extension Array where Element == Int {
    var toInt: Int? {
        get {
            guard !self.isEmpty && self[0] != 0 else {
                return nil
            }
            var ans = 0
            for n in self {
                ans = ans * 10 + n
            }
            return ans
        }
    }
}
class Solution {
    func maxDiff(_ num: Int) -> Int {
        let numToArr = num.toArr
        var minVal = Int.max
        var maxVal = Int.min
        let N = numToArr.count
        for existNum in Set<Int>(numToArr) {
            // print("*****  \(existNum) ****")
            for j in 0...9 {
                var arrCopy = numToArr
                for i in 0..<N {
                    if arrCopy[i] == existNum {
                        arrCopy[i] = j
                    }
                }
                if let v = arrCopy.toInt {
                    // print(v)
                    minVal = min(minVal, v)
                    maxVal = max(maxVal, v)
                }
            }
            
        }
        // print("minVal = \(minVal)  maxVal = \(maxVal)")
        return maxVal - minVal
    }
}