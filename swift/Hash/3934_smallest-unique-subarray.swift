     //https://leetcode.cn/problems/smallest-unique-subarray/
     struct SubarrayHasherDouble {
    private let base = 131
    private let mod1 = 1_000_000_007
    private let mod2 = 1_000_000_009
    private var prefix1: [Int]
    private var prefix2: [Int]
    private var power1: [Int]
    private var power2: [Int]

    init(_ nums: [Int]) {
        let n = nums.count
        prefix1 = Array(repeating: 0, count: n+1)
        prefix2 = Array(repeating: 0, count: n+1)
        power1 = Array(repeating: 1, count: n+1)
        power2 = Array(repeating: 1, count: n+1)

        for i in 0..<n {
            prefix1[i+1] = (prefix1[i] * base + nums[i]) % mod1
            prefix2[i+1] = (prefix2[i] * base + nums[i]) % mod2
            power1[i+1] = (power1[i] * base) % mod1
            power2[i+1] = (power2[i] * base) % mod2
        }
    }

    func getHash(_ l: Int, _ r: Int) -> (Int, Int) {
        let len = r - l + 1
        let h1 = (prefix1[r+1] - prefix1[l] * power1[len] % mod1 + mod1) % mod1
        let h2 = (prefix2[r+1] - prefix2[l] * power2[len] % mod2 + mod2) % mod2
        return (h1, h2)
    }

    func getHash(_ l: Int, _ r: Int) -> String {
        let len = r - l + 1
        let h1 = (prefix1[r+1] - prefix1[l] * power1[len] % mod1 + mod1) % mod1
        let h2 = (prefix2[r+1] - prefix2[l] * power2[len] % mod2 + mod2) % mod2
        return "\(h1)-\(h2)"
    }

}
    //https://leetcode.cn/problems/smallest-unique-subarray/
class Solution {
    func smallestUniqueSubarray(_ nums: [Int]) -> Int {
        let hasher = SubarrayHasherDouble(nums)
        let n = nums.count

        func check(_ len: Int) -> Bool {
            var counter = [String:Int]()
            for i in 0...(n-len) {
                let h:String = hasher.getHash(i, i + len - 1)
                counter[h,default: 0] += 1
            }
            if counter.values.min()! == 1 {return true}
            return false
        }

        var l = 1, r = n
        while l < r {
            let mid = (l + r) >> 1
            if check(mid) {
                r = mid
            } else {
                l = mid + 1
            }
        }
        return l
    }
}
