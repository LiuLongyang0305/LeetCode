// https://leetcode.cn/problems/next-special-palindrome-number/
var numbers = Set<Int>()
let oddPositions = (1 << 1) | (1 << 3) | (1 << 5) | (1 << 7) | (1 << 9)


func getDigitsCnt(of mask: Int) -> Int {
    var sb = 0
    for i in 1...9 {
        if mask & (1 << i) != 0 {
            sb += i
        }
    }
    return sb
}


func getSpecialPanlidromeNumbers() {
    for mask in 2..<(1 << 10) {
        guard (mask & oddPositions).nonzeroBitCount <= 1 else{continue}
        guard getDigitsCnt(of: mask) <= 16 else {continue}

        var odd: Int? = nil
        var halfPart = [Int]()

        for i in 1...9 {
            if mask & (1 << i) != 0 {
                if i & 1 != 0 {
                    odd = i
                    if i - 1 > 0 {
                        halfPart.append(contentsOf: [Int](repeating: i, count: i / 2))
                    }
                } else {
                    halfPart.append(contentsOf: [Int](repeating: i, count: i / 2))
                }
            }

        }

        for per in halfPart.uniquePermutations() {
            let l = per.reduce("") { $0 + "\($1)"}
            let r = String(l.reversed())
            let cur = l + (nil == odd ? "" : "\(odd!)") + r
            numbers.insert(Int(cur)!)
        }
    }
}

getSpecialPanlidromeNumbers()
let sortedNums = numbers.sorted()
// print(sortedNums)

class Solution {
    func specialPalindrome(_ n: Int) -> Int {
        var l = 0
        var r = sortedNums.count - 1
        while l < r {
            let mid = (l + r) >> 1
            if sortedNums[mid] > n {
                r = mid 
            } else {
                l = mid + 1
            }
        }
        return sortedNums[l]
    }
}
