// https://leetcode.cn/problems/minimum-operations-to-sort-a-permutation/
class Solution {
    func minOperations(_ nums: [Int]) -> Int {
        let targetArr = [Int](0..<nums.count)
        let haser = SubarrayHasher(targetArr)
        let targetHash = haser.getHash(0, nums.count - 1)
        let targetArr2 = [Int](targetArr.reversed())
        let haser2 = SubarrayHasher(targetArr2)
        let targetHash2 = haser2.getHash(0, nums.count - 1)
        let opTimes1 = min(minOperationsInner(nums,targetHash,targetHash2), Int.max / 2)
        let opTimes2 = min(1 + minOperationsInner([Int](nums.reversed()),targetHash,targetHash2), Int.max / 2)

        guard opTimes1 != Int.max / 2 || opTimes2 != Int.max / 2 else {
            return -1
        }
        return min(opTimes1,opTimes2)
    }

    private func minOperationsInner(_ arr: [Int], _ target1: Int, _ target2: Int) -> Int {
        let arrCopy = arr + arr
        let haser = SubarrayHasher(arrCopy)
        let length = arr.count
        let N = length * 2
        
        var sb = Int.max / 2
        for i in 0..<N {
            guard i + length - 1 < N else {break}
            let curHashValue = haser.getHash(i, i + length - 1)
            if curHashValue == target1 {
                sb = min(sb,i)
            }
            if curHashValue == target2 {
                sb = min(i + 1,sb)
            }
        }
        return sb
    }
}

struct SubarrayHasher {
    private let base = 131
    private let mod = 1_000_000_007
    private var prefix: [Int]
    private var power: [Int]

    init(_ nums: [Int]) {
        let n = nums.count
        prefix = Array(repeating: 0, count: n + 1)
        power = Array(repeating: 1, count: n + 1)

        for i in 0..<n {
            prefix[i + 1] = (prefix[i] * base + nums[i]) % mod
            power[i + 1] = (power[i] * base) % mod
        }
    }

        /// O(1) 判断 nums[l..<r] 是否等于 other[a..<b]
    func isEqual(
        to other: SubarrayHasher,
        _ l: Int, _ r: Int,
        _ a: Int, _ b: Int
    ) -> Bool {
        let hash1 = (prefix[r] - prefix[l] * power[r - l] % mod + mod) % mod
        let hash2 = (other.prefix[b] - other.prefix[a] * other.power[b - a] % mod + mod) % mod
        return hash1 == hash2
    }

        //L...R
    func getHash(_ l: Int, _ r: Int) -> Int {
        return (prefix[r + 1] - prefix[l] * power[r - l + 1] % mod + mod) % mod
    }
}
