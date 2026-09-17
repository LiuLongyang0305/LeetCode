// https://leetcode.cn/problems/palindromic-subarray-sum/
class Solution {
    func getSum(_ nums: [Int]) -> Int {
        let newArr = getNewArray(nums)
        let preffix = getPreffixArr(ori: newArr)
        let M = newArr.count
        let hasher = DoubleRollingHash(newArr)
        let reverseHasher = DoubleRollingHash([Int](newArr.reversed()))

        func check(_ left:Int, _ right:Int) -> Bool {
            let ml = M - 1 - right
            let mr = M - 1 - left
            return hasher.hash(left, right) == reverseHasher.hash(ml, mr)
        }


        func solve(_ middle: Int) -> Int {
            var l = 0
            var r = min(middle,M - 1 - middle)
            while l < r {
                let mid = (l + r + 1) >> 1
                if check(middle - mid, middle + mid) {
                    l = mid
                } else {
                    r = mid - 1
                }
            }

            return preffix[middle + l + 1] - preffix[middle - l]
        }

        //枚举中心
        var result = -1
        for idx in 1..<(M - 1) {
            result = max(result, solve(idx))
        }

        return result
    }

    private func getNewArray(_ arr: [Int]) -> [Int] {
        let M = arr.count
        var ans = [Int](repeating: 0, count: M * 2 + 1)
        for i in 0..<M {
            ans[i * 2 + 1] = arr[i]
        }
        return ans
    }
    private func getPreffixArr( ori arr: [Int]) -> [Int] {
        let M = arr.count
        var preffix = [Int](repeating: 0, count: M + 1)

        for i in 0..<M {
            preffix[i + 1] = preffix[i] + arr[i]
        }
        return preffix
    }
}
struct HashKey: Hashable {
    let h1: UInt64
    let h2: UInt64
}

struct DoubleRollingHash {
    private let b1: UInt64 = 911382323
    private let b2: UInt64 = 972663749
    private var p1: [UInt64]
    private var p2: [UInt64]
    private var pw1: [UInt64]
    private var pw2: [UInt64]

    init(_ a: [Int]) {
        let n = a.count
        p1 = [UInt64](repeating: 0, count: n + 1)
        p2 = [UInt64](repeating: 0, count: n + 1)
        pw1 = [UInt64](repeating: 1, count: n + 1)
        pw2 = [UInt64](repeating: 1, count: n + 1)

        for i in 0..<n {
            let x = UInt64(bitPattern: Int64(a[i])) &+ 1
            p1[i + 1] = p1[i] &* b1 &+ x
            p2[i + 1] = p2[i] &* b2 &+ x
            pw1[i + 1] = pw1[i] &* b1
            pw2[i + 1] = pw2[i] &* b2
        }
    }

    @inline(__always)
    func hash(_ l: Int, _ r: Int) -> HashKey {
        HashKey(h1: p1[r + 1] &- p1[l] &* pw1[r - l + 1], h2: p2[r + 1] &- p2[l] &* pw2[r - l + 1])
    }

    @inline(__always)
    func equal(_ l1: Int, _ r1: Int, _ l2: Int, _ r2: Int) -> Bool {
        r1 - l1 == r2 - l2 && hash(l1, r1) == hash(l2, r2)
    }
}

