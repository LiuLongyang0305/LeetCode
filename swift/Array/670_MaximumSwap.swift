//https://leetcode.com/problems/maximum-swap/
extension Int {
    func toArray() -> [Int] {
        var ans = [Int]()
        var temp  = self
        while temp > 0 {
            ans.insert(temp % 10, at: 0)
            temp /= 10
        }
        return ans
    }
}
extension Array where Element == Int {
    func toInt() -> Int {
        var ans = 0
        for bit in self {
            ans = ans * 10 + bit
        }
        return ans
    }
}
class Solution {
    func maximumSwap(_ num: Int) -> Int {
        var arr = num.toArray()
        let sortedArr =  arr.sorted(by: { $0 > $1})
        //当前数字就是最大
        guard sortedArr != arr else {
            return num
        }
        for i in 0..<arr.count {
            if arr[i] != sortedArr[i] {
                var k = arr.count - 1
                while arr[k] != sortedArr[i] {
                    k  -= 1
                }
                arr.swapAt(i, k)
                return arr.toInt()
            }
        }
        return num
    }
}
