// https://leetcode.cn/problems/longest-palindrome-after-substring-concatenation-ii/
struct HashResult:Hashable {
    var h1:UInt64
    var h2:UInt64
}
struct _DoubleStringHasher {
    private struct HashParams {
        let base: UInt64
        let mod: UInt64
    }

    // 使用两个不同的参数组，大幅降低碰撞概率
    private let params = [
        HashParams(base: 131, mod: 1_000_000_007),
        HashParams(base: 137, mod: 1_000_000_009)
    ]

    private var prefixHashes: [[UInt64]] = []
    private var powers: [[UInt64]] = []

    init(_ s: String) {
        let n = s.count
        prefixHashes = Array(repeating: Array(repeating: 0, count: n + 1), count: 2)
        powers = Array(repeating: Array(repeating: 1, count: n + 1), count: 2)

        let chars = Array(s)
        for p in 0..<2 {
            let base = params[p].base
            let mod = params[p].mod

            for i in 0..<n {
                let charValue = UInt64(chars[i].asciiValue ?? 0)
                prefixHashes[p][i + 1] = (prefixHashes[p][i] * base + charValue) % mod
                powers[p][i + 1] = (powers[p][i] * base) % mod
            }
        }
    }

    /// 获取子串的双哈希值
    func getDoubleHash(_ l: Int, _ r: Int) -> HashResult {
        guard l <= r, l >= 0, r < prefixHashes[0].count - 1 else { return HashResult(h1: 0, h2: 0) }
        var result:HashResult = HashResult(h1: 0, h2: 0)
        for p in 0..<2 {
            let mod = params[p].mod
            let hash = (prefixHashes[p][r + 1] + mod - (prefixHashes[p][l] * powers[p][r - l + 1]) % mod) % mod
            if p == 0 {
                result.h1 = hash
            } else {
                result.h2 = hash
            }
        }
        return result
    }
    /// 比较两个子串是否相等（通过比较哈希值）
    func isEqual(_ l1: Int, _ r1: Int, _ l2: Int, _ r2: Int) -> Bool {
        let hash1 = getDoubleHash(l1, r1)
        let hash2 = getDoubleHash(l2, r2)
        return hash1 == hash2
    }
}
class Solution {
    private typealias LengthAndExpan = (leng:Int, expan:Int)
    func longestPalindrome(_ s: String, _ t: String) -> Int {
        let M = s.count
        let N = t.count
        let sHasher = _DoubleStringHasher(s),srHasher = _DoubleStringHasher(String(s.reversed()))
        let tHasher = _DoubleStringHasher(t),trHasher = _DoubleStringHasher(String(t.reversed()))
        //只从一个字符串中选取
        var sb = max(solveWhenChooseFronOneStr(sHasher, srHasher, M),solveWhenChooseFronOneStr(tHasher, trHasher, N))
        //分别求以下标i开头的最长可以扩展的长度，可以扩展的部分必须是回文串
        //然后针对不同的hashValue记录对应长度和可以扩展的长度
        let sHashToLenAndExpanLength = getHashValToRange(sHasher,M, canExpanMaxPalindromeLength(sHasher, srHasher, M))
        let trHashToLenAndExpanLength = getHashValToRange(trHasher,N, canExpanMaxPalindromeLength(trHasher, tHasher,N))

        for (shv,(l,sMaxExpanLen)) in sHashToLenAndExpanLength {
            guard let (_,tMaxExpanLen) = trHashToLenAndExpanLength[shv] else {continue}
            let curLen = 2 * l
            let expanMaxLength = max(sMaxExpanLen,tMaxExpanLen)
            sb = max(sb,curLen + expanMaxLength)
        }
        return sb
    }

    private func solveWhenChooseFronOneStr(_ hasher:_DoubleStringHasher, _ rHasher: _DoubleStringHasher, _ len:Int) -> Int {
        guard len > 1 else {return len}
        if len == 2 {
            return hasher.getDoubleHash(0, 1) == rHasher.getDoubleHash(0, 1) ? 2 : 1
        }
        for l in stride(from: len, to: 1, by: -1) {
            for sIdx in 0..<len {
                let r = sIdx + l - 1
                guard r < len else {
                    break
                }

                let ml = len - r - 1
                let mr = len - sIdx - 1
                guard hasher.getDoubleHash(_:_:)(sIdx, r) != rHasher.getDoubleHash(ml, mr) else  {
                    return l
                }
            }
        }
        return 1
    }

    private func getHashValToRange(_ hasher: _DoubleStringHasher, _ len: Int, _ expanMaxLength:[Int]) -> [HashResult:LengthAndExpan] {

        var sb = [HashResult:LengthAndExpan]()
        for i in 0..<len {
            for j in stride(from: i, to: len, by: 1) {
                let v = hasher.getDoubleHash(i, j)
                if var pair = sb[v] {
                    if pair.expan < expanMaxLength[j + 1] {
                        pair.expan = expanMaxLength[j + 1]
                        sb[v] = pair
                    }
                } else {
                    sb[v] = (j - i + 1,expanMaxLength[j + 1])
                }
            }
        }
        return sb
    }


    private func canExpanMaxPalindromeLength(_ hasher:_DoubleStringHasher, _ rHasher:_DoubleStringHasher,_ len: Int) -> [Int] {
        var sb = [Int](repeating: 1, count: len + 1)
        sb[len] = 0
        for i in 0..<len {
            for j in stride(from: len - 1, to: i, by: -1) {
                guard hasher.getDoubleHash(i, j) != rHasher.getDoubleHash(len - 1 - j, len - 1 - i) else {
                    sb[i] = j - i + 1
                    break
                }
            }
        }
        return sb
    }
}
