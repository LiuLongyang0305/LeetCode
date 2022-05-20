 // https://leetcode.com/problems/longest-substring-of-one-repeating-character/
class Solution {


    private struct Info {
        var ch: Character = " "
        var length: Int = 0
    }
    private class SegmentTreeNode {
        var left: Int = -1
        var right:Int = -1
        var total: Int = 0
        var size = 0
        var preffix:Info = Info()
        var suffix:Info = Info()
        init() {}
        init(_ pre: Info, _ suf: Info,_ total: Int,_ size: Int) {
            self.suffix = suf
            self.total = total
            self.preffix = pre
            self.size = size
        }
    }
    private let maxN = 100005
    private var segTree = [SegmentTreeNode]()
    private var sToChars = [Character]()

    private var N = -1

    init() {
        for _ in 0...(maxN << 2) {
            self.segTree.append(SegmentTreeNode())
        }
    }
    func longestRepeating(_ s: String, _ queryCharacters: String, _ queryIndices: [Int]) -> [Int] {
        self.N = s.count
        self.sToChars = [Character](s)
        let queryChars = [Character](queryCharacters)
        build(1, 0, N - 1)
        var ans = [Int]()
        let M = queryIndices.count

        for idx in 0..<M {
            update(1, queryIndices[idx], queryChars[idx])
            ans.append(segTree[1].total)
        }
        return ans
    }


    private func build(_ u: Int, _ l: Int,_ r:Int) {
        segTree[u].left = l
        segTree[u].right = r
        if(l == r) {
            let info = Info(ch: sToChars[l], length: 1)
            segTree[u].preffix = info
            segTree[u].total = 1
            segTree[u].suffix = info
            segTree[u].size = 1
            return
        } else {
            let mid = (l + r) >> 1
            build(u << 1, l, mid)
            build(u << 1 | 1, mid + 1, r)
            pushUp(u)
        }
    }

    private func pushUp(_ u:Int) {

        let l = segTree[u << 1]
        let r = segTree[u << 1 | 1]
        segTree[u].size = l.size + r.size
        segTree[u].total = getTotal(l, r)
        segTree[u].suffix = getSuffix(l, r)
        segTree[u].preffix = getPreffix(l, r)
    }
    private func  getPreffix(_ l: SegmentTreeNode,_ r:SegmentTreeNode) -> Info {
        if l.preffix.length != l.size {
            return l.preffix
        }
        if r.preffix.ch != l.preffix.ch {
            return l.preffix
        }
        return Info(ch: l.preffix.ch, length: l.preffix.length + r.preffix.length)
    }

    private func getSuffix(_ l: SegmentTreeNode,_ r:SegmentTreeNode ) -> Info {
        if r.size != r.suffix.length {
            return r.suffix
        }
        if l.suffix.ch != r.suffix.ch {
            return r.suffix
        }
        return Info(ch: r.suffix.ch, length: r.suffix.length + l.suffix.length)
    }

    private func getTotal(_ l: SegmentTreeNode,_ r:SegmentTreeNode) -> Int {
        return max(l.total, r.total, l.suffix.ch == r.preffix.ch ? (l.suffix.length + r.preffix.length) : 0)
    }
    private func update(_ u: Int, _ pos:Int, _ ch: Character) {

        if segTree[u].left == pos && pos == segTree[u].right {
            let t = Info(ch: ch, length: 1)
            segTree[u].preffix = t
            segTree[u].suffix = t
            return
        } else {
            let mid = (segTree[u].left + segTree[u].right) >> 1
            if pos <= mid {
                update(u << 1, pos, ch)
            } else if pos > mid {
                update(u << 1 | 1, pos, ch)
            }
            pushUp(u)
        }
    }
}