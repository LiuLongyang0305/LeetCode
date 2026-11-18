// https://leetcode.cn/problems/power-update-after-k-th-largest-insertion-ii
class Solution {
    private let MOD = 1_000_000_007
    func powerUpdate(_ nums: [Int], _ p: Int, _ queries: [[Int]]) -> [Int] {
        var ans = [Int]()
        var sortedNums = nums.sorted { $0 > $1}
        var curP = p
        func insert(_ val: Int) {
            if let f = sortedNums.first, f <= val {
                sortedNums.insert(val, at: 0)
                return
            }
            if let l = sortedNums.last, l >= val {
                sortedNums.append(val)
                return
            }
            var l = 0
            var r = sortedNums.count - 1
            while l < r {
                let mid = (l + r) >> 1
                if sortedNums[mid] >= val {
                    l = mid + 1
                } else {
                    r = mid
                }
            }
            sortedNums.insert(val, at: l)
        }

        for query in queries {
            insert(query[0])
            curP = fastPower(curP, sortedNums[query[1] - 1], MOD)
            ans.append(curP)
        }

        return ans
    }
    private func fastPower(_ base: Int, _ exponent: Int, _ mod: Int) -> Int {
        var result = 1
        var b = base % mod
        var e = exponent

        while e > 0 {
            if e & 1 == 1 {
                result = (result * b) % mod
            }
            b = (b * b) % mod
            e >>= 1
        }

        return result
    }
}
