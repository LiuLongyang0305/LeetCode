//https://leetcode.com/problems/minimum-cost-to-make-array-equalindromic/
var huiwenNumbers = [Int]()
func cal() {
    huiwenNumbers += [Int](0...9)
    for i in 1...9999 {
        var left = "\(i)"
        var right = String(left.reversed())
       huiwenNumbers.append(Int(left + right)!)
        for j in 0...9 {
            huiwenNumbers.append(Int(left + "\(j)" + right)!)
        }
    }
    huiwenNumbers.sort()
    huiwenNumbers.append(1000000001)
}
cal()


func binarySerachFirst(largerThan target: Int) -> Int {
    var l = 0
    var r = huiwenNumbers.count - 1
    while l < r {
        let mid = (l + r) >> 1
        if huiwenNumbers[mid] >= target {
            r = mid
        } else {
            l = mid + 1
        }
    }
    return l
}
class Solution {
    func minimumCost(_ nums: [Int]) -> Int {
        if nums.count == 1 {

            if let idx = huiwenNumbers.firstIndex(where: { $0 > nums[0]}) {
                return  min(huiwenNumbers[idx] - nums[0], idx > 0 ? nums[0] - huiwenNumbers[idx - 1] : Int.max)
            }
            return -1
        }

        let sortedNums = nums.sorted()
        let total = sortedNums.reduce(0) { $0 + $1}
        let N = nums.count
        var presum = 0
        let firstIdx = binarySerachFirst(largerThan: sortedNums[0])
        let lastIdx = binarySerachFirst(largerThan: sortedNums.last!)
        var ans =  total - N * huiwenNumbers[firstIdx - 1]
        var j = 0

        for idx in firstIdx...lastIdx {
            let huiwenNumber = huiwenNumbers[idx]
            while j < N && sortedNums[j] <= huiwenNumber {
                presum += sortedNums[j]
                j += 1
            }
            let t = j * huiwenNumber - presum + (total - presum) - (N - j) * huiwenNumber
            if t > ans {break}
            ans = t
        }

        return ans
    }
}
