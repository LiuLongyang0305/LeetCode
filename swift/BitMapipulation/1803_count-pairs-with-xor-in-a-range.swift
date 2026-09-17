
// https://leetcode.cn/problems/count-pairs-with-xor-in-a-range/
struct _BinaryTrie {

    private final class Node {
        var child: [Node?] = [nil, nil]
        var count: Int = 0
    }

    private let root = Node()

    /// 插入一个 Int
    mutating func insert(_ num: Int) {
        var node = root

        // Int 按 32 位处理
        for bit in stride(from: 16, through: 0, by: -1) {
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

        for bit in stride(from: 16, through: 0, by: -1) {
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

        for bit in stride(from: 16, through: 0, by: -1) {
            let b = (num >> bit) & 1

            let next = node.child[b]!
            next.count -= 1

            node = next
        }
    }
    private func countGreaterThanRec(_ node: Node?, _ num: Int, _ target: Int, _ bit: Int) -> Int {
        guard bit >= 0, let node = node else {
            return 0
        }
        let xb = (num >> bit) & 1
        let kb = (target >> bit) & 1

        if kb == 0 {
            let oppositeCnt = node.child[ 1 - xb]?.count ?? 0
            let sameCnt = countGreaterThanRec(node.child[xb], num, target, bit - 1)
            return sameCnt + oppositeCnt
        } else {
            return countGreaterThanRec(node.child[ 1 - xb], num, target, bit - 1)
        }
    }

    func countGreaterThan(_ num: Int, _ target:Int, _ curBit: Int) -> Int {
        return countGreaterThanRec(root, num, target, 16)
    }

}

    class Solution {
        func countPairs(_ nums: [Int], _ low: Int, _ high: Int) -> Int {
            var trie = _BinaryTrie()
            var sb = 0
            for num in nums {
                sb +=  trie.countGreaterThan(num, low - 1, 16) - trie.countGreaterThan(num, high, 16) 
                trie.insert(num)
            }
            return sb
        }
    }
