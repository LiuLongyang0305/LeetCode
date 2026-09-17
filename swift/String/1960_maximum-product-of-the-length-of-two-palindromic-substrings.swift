// https://leetcode.cn/problems/maximum-product-of-the-length-of-two-palindromic-substrings/

struct _DoubleHashResult: Hashable {
    var h1: UInt64
    var h2: UInt64
}

struct _DoubleStringHasher {

    private struct HashParams {
        let base: UInt64
        let mod: UInt64
    }

    private let params = [
        HashParams(base: 131, mod: 1_000_000_007),
        HashParams(base: 137, mod: 1_000_000_009)
    ]

    private var prefixHashes: [[UInt64]] = []
    private var powers: [[UInt64]] = []

    init(_ s: String) {
        let n = s.count

        prefixHashes = Array(
            repeating: Array(repeating: 0, count: n + 1),
            count: 2
        )

        powers = Array(
            repeating: Array(repeating: 1, count: n + 1),
            count: 2
        )

        let chars = Array(s)

        for p in 0..<2 {
            let base = params[p].base
            let mod = params[p].mod

            for i in 0..<n {
                let charValue = UInt64(chars[i].asciiValue ?? 0)

                prefixHashes[p][i + 1] =
                    (prefixHashes[p][i] * base + charValue) % mod

                powers[p][i + 1] =
                    (powers[p][i] * base) % mod
            }
        }
    }

    func getDoubleHash(_ l: Int, _ r: Int) -> _DoubleHashResult {
        guard l <= r,
              l >= 0,
              r < prefixHashes[0].count - 1
        else {
            return _DoubleHashResult(h1: 0, h2: 0)
        }

        var result = _DoubleHashResult(h1: 0, h2: 0)

        for p in 0..<2 {
            let mod = params[p].mod

            let hash = (
                prefixHashes[p][r + 1]
                + mod
                - (
                    prefixHashes[p][l]
                    * powers[p][r - l + 1]
                ) % mod
            ) % mod

            if p == 0 {
                result.h1 = hash
            } else {
                result.h2 = hash
            }
        }

        return result
    }

    func isEqual(
        _ l1: Int,
        _ r1: Int,
        _ l2: Int,
        _ r2: Int
    ) -> Bool {
        return getDoubleHash(l1, r1) == getDoubleHash(l2, r2)
    }
}


class Solution {

    func maxProduct(_ s: String) -> Int {

        let M = s.count

        if M < 2 {
            return 0
        }

        let hasher = _DoubleStringHasher(s)
        let rHasher = _DoubleStringHasher(String(s.reversed()))

        // maxPalindromeRadius[i]
        //
        // 以 i 为中心的最大奇数回文半径
        //
        // 回文区间：
        // [i - radius[i], i + radius[i]]

        let maxPalindromeRadius = (0..<M).map {
            binaryToGetMaxPalindromeRadius(
                hasher,
                rHasher,
                $0,
                M
            )
        }

        // ============================================================
        // 找每个位置 i：
        //
        // 能覆盖 i 的最左侧中心
        //
        // 那么：
        //
        // 2 * (i - center) + 1
        //
        // 就是“以 i 为右端点”的最长奇回文长度
        // ============================================================

        let leftCanCover =
            getFirstIdxWhoCoverTheSplitPoint(
                maxPalindromeRadius
            )

        var leftMax = [Int](repeating: 1, count: M)

        for i in 0..<M {
            let center = leftCanCover[i]

            leftMax[i] =
                2 * (i - center) + 1
        }

        // prefix max
        //
        // leftMax[i] =
        // s[0...i] 中最长奇回文长度

        for i in 1..<M {
            leftMax[i] = max(
                leftMax[i],
                leftMax[i - 1]
            )
        }

        // ============================================================
        // 找每个位置 i：
        //
        // 能覆盖 i 的最右侧中心
        //
        // 那么：
        //
        // 2 * (center - i) + 1
        //
        // 就是“以 i 为左端点”的最长奇回文长度
        // ============================================================

        let rightCanCover =
            getRightmostIdxWhoCoversThePosition(
                maxPalindromeRadius
            )

        var rightMax = [Int](repeating: 1, count: M)

        for i in 0..<M {
            let center = rightCanCover[i]

            rightMax[i] =
                2 * (center - i) + 1
        }

        // suffix max
        //
        // rightMax[i] =
        // s[i...M-1] 中最长奇回文长度

        if M >= 2 {
            for i in stride(
                from: M - 2,
                through: 0,
                by: -1
            ) {
                rightMax[i] = max(
                    rightMax[i],
                    rightMax[i + 1]
                )
            }
        }

        // ============================================================
        // 枚举 split
        //
        // [0...i] | [i+1...M-1]
        // ============================================================

        var res = 1

        for i in 0..<(M - 1) {

            res = max(
                res,
                leftMax[i] * rightMax[i + 1]
            )
        }

        return res
    }


    // ================================================================
    // 最大奇数回文半径
    // ================================================================

    private func binaryToGetMaxPalindromeRadius(
        _ hasher: _DoubleStringHasher,
        _ rHasher: _DoubleStringHasher,
        _ idx: Int,
        _ M: Int
    ) -> Int {

        func check(_ l: Int, _ r: Int) -> Bool {

            let mr = M - 1 - l
            let ml = M - 1 - r

            return hasher.getDoubleHash(l, r)
                == rHasher.getDoubleHash(ml, mr)
        }

        var l = 0

        var r = min(
            idx,
            M - idx - 1
        )

        while l < r {

            let mid = (l + r + 1) / 2

            if check(
                idx - mid,
                idx + mid
            ) {
                l = mid
            } else {
                r = mid - 1
            }
        }

        return l
    }


    // ================================================================
    // 找到能覆盖每个位置 i 的最左侧回文中心
    //
    // center = c
    // radius = r
    //
    // 回文覆盖：
    //
    // [c-r ... c+r]
    // ================================================================

    private func getFirstIdxWhoCoverTheSplitPoint(
        _ maxRadius: [Int]
    ) -> [Int] {

        let M = maxRadius.count

        var res = [Int](
            repeating: -1,
            count: M
        )

        var j = 0

        for i in 0..<M {

            while j < i {

                let rightBound =
                    j + maxRadius[j]

                // j 已经无法覆盖 i
                if rightBound < i {
                    j += 1
                } else {
                    break
                }
            }

            res[i] = j
        }

        return res
    }


    // ================================================================
    // 找到能覆盖每个位置 i 的最右侧回文中心
    // ================================================================

    private func getRightmostIdxWhoCoversThePosition(
        _ maxRadius: [Int]
    ) -> [Int] {

        let M = maxRadius.count

        var res = [Int](
            repeating: -1,
            count: M
        )

        var j = M - 1

        for i in stride(
            from: M - 1,
            through: 0,
            by: -1
        ) {

            while j > i {

                let leftBound =
                    j - maxRadius[j]

                // j 已经无法覆盖 i
                if leftBound > i {
                    j -= 1
                } else {
                    break
                }
            }

            res[i] = j
        }

        return res
    }
}

