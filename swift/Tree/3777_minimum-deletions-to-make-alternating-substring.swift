//   https://leetcode.cn/problems/minimum-deletions-to-make-alternating-substring/
class NodeData {
    var lc: Int = 0      // 区间左端点字母（0 或 1）
    var rc: Int = 0      // 区间右端点字母（0 或 1）
    var del: Int = 0     // 区间删除次数

    init() {}

    init(lc: Int, rc: Int, del: Int) {
        self.lc = lc
        self.rc = rc
        self.del = del
    }
}

class SegmentTree {

    private func merge(_ l: NodeData, _ r: NodeData) -> NodeData {
        let res = NodeData()
        res.lc = l.lc
        res.rc = r.rc
        res.del = l.del + r.del + (l.rc == r.lc ? 1 : 0)
        return res
    }

    private let n: Int
    private var t: [NodeData]  // 线段树数组

    init(_ s: String) {
        n = s.count
        // ✅ 修复：每个位置创建独立实例，不能再用 repeating: NodeData()
        t = (0..<4 * n).map { _ in NodeData() }
        let chars = Array(s)
        build(chars, node: 1, l: 0, r: n - 1)
    }

    func flip(_ i: Int) {
        flip(node: 1, l: 0, r: n - 1, i: i)
    }

    func query(_ ql: Int, _ qr: Int) -> Int {
        return query(node: 1, l: 0, r: n - 1, ql: ql, qr: qr).del
    }

    // MARK: - 私有方法

    private func maintain(node: Int) {
        t[node] = merge(t[node * 2], t[node * 2 + 1])
    }

    private func build(_ a: [Character], node: Int, l: Int, r: Int) {
        if l == r { // 叶子
            t[node].lc = Int(a[l].asciiValue! - Character("A").asciiValue!)
            t[node].rc = Int(a[l].asciiValue! - Character("A").asciiValue!)
            return
        }
        let m = (l + r) / 2
        build(a, node: node * 2, l: l, r: m)
        build(a, node: node * 2 + 1, l: m + 1, r: r)
        maintain(node: node)
    }

    private func flip(node: Int, l: Int, r: Int, i: Int) {
        if l == r {
            t[node].lc ^= 1
            t[node].rc ^= 1
            return
        }
        let m = (l + r) / 2
        if i <= m {
            flip(node: node * 2, l: l, r: m, i: i)
        } else {
            flip(node: node * 2 + 1, l: m + 1, r: r, i: i)
        }
        maintain(node: node)
    }

    private func query(node: Int, l: Int, r: Int, ql: Int, qr: Int) -> NodeData {
        if ql <= l && r <= qr {
            return t[node]
        }
        let m = (l + r) / 2
        if qr <= m {
            return query(node: node * 2, l: l, r: m, ql: ql, qr: qr)
        }
        if ql > m {
            return query(node: node * 2 + 1, l: m + 1, r: r, ql: ql, qr: qr)
        }
        let lRes = query(node: node * 2, l: l, r: m, ql: ql, qr: qr)
        let rRes = query(node: node * 2 + 1, l: m + 1, r: r, ql: ql, qr: qr)
        return merge(lRes, rRes)
    }
}

class Solution {
    func minDeletions(_ s: String, _ queries: [[Int]]) -> [Int] {
        var size = 0
        for q in queries {
            size += q[0] - 1
        }

        let segTree = SegmentTree(s)
        var ans = [Int](repeating: 0, count: size)
        var idx = 0

        for q in queries {
            if q[0] == 1 {
                segTree.flip(q[1])
            } else {
                ans[idx] = segTree.query(q[1], q[2])
                idx += 1
            }
        }
        return ans
    }
}
