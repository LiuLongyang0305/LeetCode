      // https://leetcode.cn/problems/maximum-strong-pair-xor-ii/
struct _BinaryTrie {

    private final class Node {
        var child: [Node?] = [nil, nil]
        var count: Int = 0
    }

    private let root = Node()
    func getTotalCnt() -> Int {
        return root.count
    }
    /// 插入一个 Int
    mutating func insert(_ num: Int) {
        var node = root

        // Int 按 32 位处理
        for bit in stride(from: 32, through: 0, by: -1) {
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

        for bit in stride(from: 32, through: 0, by: -1) {
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

        for bit in stride(from: 32, through: 0, by: -1) {
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

        for bit in stride(from: 32, through: 0, by: -1) {

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

        for bit in stride(from: 32, through: 0, by: -1) {

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

    private func countGreaterThanRec(_ node: Node?, _ num: Int, _ target: Int, _ bit: Int) -> Int {
        guard bit > 0, let node = node else {
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
        return countGreaterThanRec(root, num, target, 32)
    }

}

    class Solution {
        func maximumStrongPairXor(_ nums: [Int]) -> Int {
            let N = nums.count
            guard N > 1 else {return 0}
            var tire = _BinaryTrie()

            let sortedNum = nums.sorted()
            var removeIdx = 0
            var sb = 0
            for i in 0..<N {
                let num = sortedNum[i]
                tire.insert(num)
                while removeIdx < N && 2 * sortedNum[removeIdx] < num {
                    tire.remove(sortedNum[removeIdx])
                    removeIdx += 1
                }
                // print("\(i) \(removeIdx)")
                sb = max(sb,tire.maxXOR(sortedNum[i]))
            }
            return sb
        }
    }
