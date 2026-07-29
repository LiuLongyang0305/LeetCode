//https://leetcode.cn/problems/divisible-game/
func getPrimerFactors(of num: Int) -> Set<Int> {
    var ans = Set<Int>()
    var i = 2
    var x = num
    while i  <= x / i {
        if x % i == 0  {
            while x  % i == 0 {
                x /= i
            }
            ans.insert(i)
        }
        i += 1
    }
    if x  > 1 {
        ans.insert(x)
    }
    return  ans
}
class Solution {
    private let mod = 1_000_000_007
    func divisibleGame(_ nums: [Int]) -> Int {

        var primersSet = Set<Int>()
        for num in nums {
            primersSet.formUnion(getPrimerFactors(of: num))
        }

        if primersSet.isEmpty {
            return mod - 2
        }

        func maxSumArraySum(_ factor: Int) -> Int {
            var sb = nums[0] % factor == 0 ? nums[0] : -nums[0]
            var pre = 0

            for x in nums {
                let t = x * (x % factor == 0 ? 1 : -1)
                pre = max(pre + t, t)
                sb = max(sb,pre)
            }
            return sb
        }


        var maxDiff = Int.min
        var bestk = 0

        for p in primersSet.sorted() {
            let diff = maxSumArraySum(p)
            if diff > maxDiff {
                maxDiff = diff
                bestk = p
            }
        }
        return maxDiff * bestk % mod
    }
}
