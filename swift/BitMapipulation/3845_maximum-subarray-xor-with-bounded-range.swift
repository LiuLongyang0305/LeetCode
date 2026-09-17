    // https://leetcode.cn/problems/maximum-subarray-xor-with-bounded-range/
    struct BinaryTrie {

    private final class Node {
        var child: [Node?] = [nil, nil]
        var count: Int = 0
    }

    private let root = Node()
    /// 插入一个 Int
    mutating func insert(_ num: Int) {
        var node = root

        // Int 按 32 位处理
        for bit in stride(from: 30, through: 0, by: -1) {
            let b = (num >> bit) & 1

            if node.child[b] == nil {
                node.child[b] = Node()
            }

            node = node.child[b]!
            node.count += 1
        }
    }

    /// 判断是否存在 num
    func contains(_ num: Int) -> Bool {
        var node = root

        for bit in stride(from: 30, through: 0, by: -1) {
            let b = (num >> bit) & 1

            guard let next = node.child[b],
                  next.count > 0
            else {
                return false
            }

            node = next
        }

        return true
    }

    /// 删除一个 num
    mutating func remove(_ num: Int) {
        guard contains(num) else {
            return
        }

        var node = root

        for bit in stride(from: 30, through: 0, by: -1) {
            let b = (num >> bit) & 1

            let next = node.child[b]!
            next.count -= 1

            node = next
        }
    }

    /// 找到与 num 异或结果最大的数字
    func maxXOR(_ num: Int) -> Int {
        var node = root
        var result = 0

        for bit in stride(from: 30, through: 0, by: -1) {

            let b = (num >> bit) & 1

            // 为了让 XOR 当前 bit = 1
            // 优先走相反的 bit
            let want = b ^ 1

            if let next = node.child[want],
               next.count > 0 {

                result |= (1 << bit)
                node = next

            } else {
                node = node.child[b]!
            }
        }

        return result
    }

    /// 找到与 num 异或结果最小的数字
    func minXOR(_ num: Int) -> Int {
        var node = root
        var result = 0

        for bit in stride(from: 30, through: 0, by: -1) {

            let b = (num >> bit) & 1

            // 为了让 XOR 当前 bit = 0
            // 优先走相同的 bit
            if let next = node.child[b],
               next.count > 0 {

                node = next

            } else {

                result |= (1 << bit)
                node = node.child[b ^ 1]!
            }
        }

        return result
    }
}

    class Solution1 {

        func maxXor(_ nums: [Int], _ k: Int) -> Int {
            let M = nums.count
            var preffixXor = [Int](repeating: 0, count: M + 1)
            for i in 1...M {
                preffixXor[i] = preffixXor[i - 1] ^ nums[i - 1]
            }

            var trie = BinaryTrie()
            var minQ = [Int]()
            var maxQ = [Int]()
            var ans = 0
            var left = 0

            for r in 0..<M {
                trie.insert(preffixXor[r])
                let x = nums[r]
                while !minQ.isEmpty && x <= nums[minQ.last!] {
                    let _ = minQ.popLast()
                }
                minQ.append(r)
                while !maxQ.isEmpty && x >= nums[maxQ.last!] {
                   let _ =  maxQ.popLast()
                }
                maxQ.append(r)

                while nums[maxQ.first!] - nums[minQ.first!] > k {
                    trie.remove(preffixXor[left])
                    left += 1
                    if let f = minQ.first, f < left {
                        let _ = minQ.removeFirst()
                    }
                    if let f = maxQ.first, f < left {
                        let _ = maxQ.removeFirst()
                    }
                }
                ans = max(ans,trie.maxXOR(preffixXor[r + 1]))

            }
            return ans
        }
    }

    // https://leetcode.cn/problems/maximum-subarray-xor-with-bounded-range/
typealias _Pair = (mx:Int,mn:Int)
class _SegmentTreeByArray {
    private var tree: [_Pair]
    private let n: Int

    init(_ nums: [Int]) {
        self.n = nums.count
        self.tree = [_Pair](repeating: (Int.min,Int.max), count: n * 4)
        if n > 0 {
            build(1, 0, n - 1, nums)
        }
    }

        // 构建线段树
    private func build(_ node: Int, _ l: Int, _ r: Int, _ nums: [Int]) {
        if l == r {
            tree[node] = (nums[l],nums[l])
            return
        }
        let mid = (l + r) >> 1
        build(node << 1, l, mid, nums)
        build(node << 1 | 1, mid + 1, r, nums)
        let (lmx,lmn) = tree[node << 1]
        let (rmx,rmn) = tree[node << 1 | 1]
        tree[node] = (max(lmx,rmx),min(lmn,rmn))
    }


        // 区间查询
    func query(_ left: Int, _ right: Int) -> _Pair {
        return query(1, 0, n - 1, left, right)
    }

    private func query(_ node: Int, _ l: Int, _ r: Int, _ ql: Int, _ qr: Int) -> _Pair {
        if ql <= l && r <= qr {
            return tree[node]
        }
        let mid = (l + r) >> 1
        var res:_Pair = (Int.min,Int.max)
        if ql <= mid {
            let (mx,mn) = query(node << 1, l, mid, ql, qr)
            res.mx = max(mx,res.mx)
            res.mn = min(mn,res.mn)
        }
        if qr > mid {
            let (mx,mn) = query(node << 1 | 1, mid + 1, r, ql, qr)
            res.mx = max(mx,res.mx)
            res.mn = min(mn,res.mn)
        }
        return res
    }
}
class Solution {

    func maxXor(_ nums: [Int], _ k: Int) -> Int {
        let M = nums.count
        var preffixXor = [Int](repeating: 0, count: M + 1)
        for i in 1...M {
            preffixXor[i] = preffixXor[i - 1] ^ nums[i - 1]
        }



        var trie = BinaryTrie()
        var minQ = [Int]()
        var maxQ = [Int]()
        var ans = 0
        var left = 0
        let st = _SegmentTreeByArray(nums)

        func binarySearch(_ right: Int ) -> Int {
            var l = 0
            var r = right
            while l < r {
                let mid = (l + r) >> 1
                let (mx,mn) = st.query(mid, right)
                if mx - mn > k {
                    l = mid + 1
                } else {
                    r = mid
                }
            }
            return l
        }
        for r in 0..<M {
            trie.insert(preffixXor[r])
            let leftBound = binarySearch(r)
            while left < leftBound {
                trie.remove(preffixXor[left])
                left += 1
            }
            ans = max(ans,trie.maxXOR(preffixXor[r + 1]))

        }
        return ans
    }
}
