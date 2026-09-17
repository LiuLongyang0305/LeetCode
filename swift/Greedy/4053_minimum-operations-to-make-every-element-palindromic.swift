    //https://leetcode.cn/problems/minimum-operations-to-make-every-element-palindromic/
    //回文偶数
var palindromicEvenNumbers = [Int]()
    //回文奇数
var palindromicOddNumbers = [Int]()

func _init() {
    palindromicEvenNumbers += stride(from: 0, to: 10, by: 2)
    palindromicOddNumbers += stride(from: 1, to: 10, by: 2)
    func add(_ num: Int){
        if num & 1 == 0 {
            palindromicEvenNumbers.append(num)
        } else {
            palindromicOddNumbers.append(num)
        }
    }
    for num in 1...9999 {
        let str = "\(num)"
        let reversedStr = String(str.reversed())
            //构造偶数位回文数
        add(Int(str + reversedStr)!)
            //构造奇数位回文数
        for middleDigit in 0...9 {
            add(Int(str + "\(middleDigit)"  + reversedStr)!)
        }
    }
    palindromicEvenNumbers.append(2_000_000_002)
    palindromicOddNumbers.append(1_000_000_001)
    palindromicEvenNumbers.sort()
    palindromicOddNumbers.sort()
}

_init()
class Solution {
    func minOperations(_ nums: [Int]) -> Int {

        func binarySearchLastSmallerThanOrEqualTo(_ target: Int, in arr: [Int]) -> Int {
            if let f = arr.first, f == target {return target}
            if let s = arr.last, s == target {return target}
            var l = 0
            var r = arr.count - 1
            while l < r {
                let mid = (l + r + 1) >> 1
                guard arr[mid] != target else {return target}
                if arr[mid] < target {
                    l = mid
                } else {
                    r = mid - 1
                }
            }
            return arr[l]
        }

        func binarySearchFirsttlargerThanOrEqualTo(_ target: Int, in arr: [Int]) -> Int {
            if let f = arr.first, f == target {return target}
            if let s = arr.last, s == target {return target}
            var l = 0
            var r = arr.count - 1
            while l < r {
                let mid = (l + r) >> 1
                guard arr[mid] != target else {return target}
                if arr[mid] < target {
                    l = mid + 1
                } else {
                    r = mid
                }
            }
            return arr[l]
        }
        var sb = 0
        for num in nums {
            let arr = num & 1 == 0 ? palindromicEvenNumbers : palindromicOddNumbers
            sb += min(num - binarySearchLastSmallerThanOrEqualTo(num, in:arr), binarySearchFirsttlargerThanOrEqualTo(num, in: arr) - num) / 2
        }
        return sb
    }
}
