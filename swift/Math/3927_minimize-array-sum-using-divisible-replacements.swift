//https://leetcode.cn/problems/minimize-array-sum-using-divisible-replacements/
//预处理所有数的因数
let MX = 100001
var divisors = [[Int]](repeating: [], count: MX + 5)
for i in 1...MX {
    for j in stride(from: i, through: MX, by: i) {
        divisors[j].append(i)
    }
}

class Solution {
    func minArraySum(_ nums: [Int]) -> Int {
        let sortedNums = nums.sorted()
        var set = Set<Int>()
        set.insert(sortedNums[0])
        var sb = sortedNums[0]
        for num in sortedNums.dropFirst() {
            var flag = false
            for fac in divisors[num] {
                if set.contains(fac) {
                    sb += fac
                    flag = true
                    break
                }
            }
            if !flag {
                // print("\(num)  \(set)")
                sb += num
                set.insert(num)
            }
        }
        return sb
    }
}
