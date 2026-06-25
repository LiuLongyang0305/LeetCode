class XorBasis1 {
    private var b: [Int]

    /// n 为值域最大值 U 的二进制长度
    /// 例如 U = 1_000_000_000 时 n = 30
    init(n: Int) {
        b = Array(repeating: 0, count: n)
    }

    /// 插入一个数
    func insert(_ t: Int) {
        // 从高到低遍历
        var x = t
        for i in (0..<b.count).reversed() {
            if (x >> i) & 1 == 1 {
                if b[i] == 0 {
                    b[i] = x
                    return
                }
                x ^= b[i]
            }
        }
        // 若执行到这里，说明 x 可由已有基表示
    }

    /// 求最大异或值
    func maxXor() -> Int {
        var res = 0
        for i in (0..<b.count).reversed() {
            res = max(res, res ^ b[i])
        }
        return res
    }
}

class Solution {
    func maxXorSubsequences(_ nums: [Int]) -> Int {
        guard let mx = nums.max() else { return 0 }

        // 计算二进制长度
        let m = 64 - mx.leadingZeroBitCount

        let basis = XorBasis1(n: m)
        for x in nums {
            basis.insert(x)
        }
        return basis.maxXor()
    }
}
