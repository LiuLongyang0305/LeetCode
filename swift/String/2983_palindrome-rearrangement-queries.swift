//https://leetcode.cn/problems/palindrome-rearrangement-queries/
struct _StringHasher {
    private let base: UInt64 = 131  // 常用质数基数
    private let mod: UInt64 = 1_000_000_007  // 大质数模数
    private var prefixHash: [UInt64] = []
    private var power: [UInt64] = []

    init(_ s: String) {
        let n = s.count
        prefixHash = Array(repeating: 0, count: n + 1)
        power = Array(repeating: 1, count: n + 1)

        let chars = Array(s)
        for i in 0..<n {
            let charValue = UInt64(chars[i].asciiValue ?? 0)
            prefixHash[i + 1] = (prefixHash[i] * base + charValue) % mod
            power[i + 1] = (power[i] * base) % mod
        }
    }

        /// 获取子串 [l, r] 的哈希值（闭区间，0-based）
    func getHash(_ l: Int, _ r: Int) -> UInt64 {
        guard l <= r, l >= 0, r < prefixHash.count - 1 else { return 0 }
        let hash = (prefixHash[r + 1] + mod - (prefixHash[l] * power[r - l + 1]) % mod) % mod
        return hash
    }
}
class Solution {
    private typealias Pair = (l:Int, r:Int)
    func canMakePalindromeQueries(_ s: String, _ queries: [[Int]]) -> [Bool] {
        let N = s.count
        let left = String(s.prefix(N / 2))
        let right = String(s.suffix(N / 2).reversed())
        let half = N / 2

        var leftHash = _StringHasher(left)
        var rightHash = _StringHasher(right)

        var  leftPreffix = getPreffixCounter(left)
        var rightPreffix = getPreffixCounter(right)


        func checkMoveableSubrange(_ l: Int, _ r: Int) -> Bool {
            return subCounter(leftPreffix[l], leftPreffix[r + 1]) == subCounter(rightPreffix[l], rightPreffix[r + 1])
        }


        func checkMaintableSubrange(_ l: Int, _ r: Int) -> Bool {
            return leftHash.getHash(l, r) == rightHash.getHash(l, r)
        }

        func swapInner() {
            swap(&leftPreffix, &rightPreffix)
            swap(&leftHash, &rightHash)
        }


        var sb = [Bool]()
        var isSwaped = false

        for q in queries {
                //保证p1的左端点在前，p2.左端点在后
            var p1:Pair = (q[0],q[1])
            var p2: Pair = (N - 1 - q[3], N - 1 - q[2])
            if p1.l > p2.l {
                swap(&p1, &p2)
                //需要交换，如果已经交换则不额外交换
                if !isSwaped {
                    swapInner()
                    isSwaped.toggle()
                }
            } else {
                //不需要交换，如果已经交换，则需要交换回来
                if isSwaped {
                    swapInner()
                    isSwaped.toggle()
                }
            }
                //包含,只考p1
            if p2.r <= p1.r {
                guard checkMoveableSubrange(p1.l, p1.r) else {
                    sb.append(false)
                    continue
                }
            }
                //不相交
            else if p2.l > p1.r {
                guard  checkMoveableSubrange(p1.l, p1.r) &&  checkMoveableSubrange(p2.l, p2.r)  else {
                    sb.append(false)
                    continue
                }



            } else {
                    //相交
                let counter1 = subCounter(subCounter(rightPreffix[p1.l], rightPreffix[p2.l]), subCounter(leftPreffix[p1.l], leftPreffix[p1.r + 1]))
                let counter2 = subCounter(subCounter(leftPreffix[p1.r + 1], leftPreffix[p2.r + 1]), subCounter(rightPreffix[p2.l], rightPreffix[p2.r + 1]))
                guard counter1 == counter2 && counter1.min()! >= 0 else {
                    sb.append(false)
                    continue
                }
            }
            let srs = getSubranges(N / 2, [p1,p2])
            var flag = true
            for sr in srs {
                guard checkMaintableSubrange(sr.l, sr.r) else {
                    flag = false
                    break
                }
            }
            sb.append(flag)
        }
        return sb
    }

    private func getSubranges(_ N: Int, _ ps: [Pair]) -> [Pair] {
        var sb = [Pair]()
        let mrs = mergeIntervals(ps)
        if let f = mrs.first {
            if f.l > 0 {
                sb.append((0,f.l - 1))
            }
        }
        var last = mrs.first!
        for range in mrs.dropFirst() {
            if last.r < range.l - 1 {
                sb.append((last.r + 1, range.l - 1))
            }
        }
        if let l = mrs.last {
            if l.r < N - 1 {
                sb.append((l.r + 1, N - 1))
            }
        }
        return sb
    }


    private func subCounter(_ l: [Int], _ r: [Int]) -> [Int] {
        var sb = r
        for i in 0..<26 {
            sb[i] -= l[i]
        }
        return sb
    }

    private func mergeIntervals(_ intervals: [Pair]) -> [Pair] {
            // 1. 空数组或单个区间直接返回
        guard intervals.count > 1 else { return intervals }

            // 2. 按起点升序排序
        let sorted = intervals.sorted { $0.l < $1.l }

        var result: [Pair] = []
        result.reserveCapacity(sorted.count)

            // 3. 遍历合并
        for interval in sorted {
                // 如果结果数组为空，或者当前区间与最后一个区间不重叠，直接加入
            if result.isEmpty || interval.l > result.last!.r {
                result.append(interval)
            } else {
                    // 有重叠，合并：取终点的最大值
                let lastIndex = result.count - 1
                result[lastIndex].r = max(result[lastIndex].r, interval.r)
            }
        }
        return result
    }

     func getPreffixCounter(_ s: String) -> [[Int]] {
        var counter = [Int](repeating: 0, count: 26)
        var sb = [counter]
        for ch in s {
            counter[Int(ch.asciiValue!) - 97] += 1
            sb.append(counter)
        }
        return sb
    }
}
