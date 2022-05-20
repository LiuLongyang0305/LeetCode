// https://leetcode.com/problems/minimum-possible-integer-after-at-most-k-adjacent-swaps-on-digits/
class BinaryIndexTree {
    private var tree:[Int]
    private var n: Int
    init(_ _n: Int) {
        self.tree = [Int](repeating: 0, count: _n + 1)
        self.n = _n
    }
    private func lowBit(_ x: Int) -> Int{
        return x & (-x)
    }
    func update(_ node: Int, _ delta: Int) {
        var curNode = node
        while curNode <= n {
            tree[curNode] += delta
            curNode += lowBit(curNode)
        }
    }
    func query(_ node: Int) -> Int {
        var ans  = 0
        var curNode = node

        while curNode > 0 {
            ans += tree[curNode]
            curNode -= lowBit(curNode)
        }
        return ans
    }

    func query(_ left: Int, _ right: Int) -> Int {
        return query(right) - query(left - 1)
    }
}

class Solution {
    func minInteger(_ num: String, _ k: Int) -> String {
        let digits = num.map {Int($0.asciiValue! - 48 )}
        let N = num.count

        let tree = BinaryIndexTree(N)
        var nextIndices = [Int](repeating: 0, count: 10)
        var ans = ""
        var indices = [[Int]](repeating: [], count: 10)
        for i in 0..<N {
            indices[digits[i]].append(i + 1)
        }

        var remainK = k

        for targetIdx in 1...N {
            for digit in 0...9 {

                if nextIndices[digit] < indices[digit].count {
                    let oriIdx = indices[digit][nextIndices[digit]]
                    let behind = tree.query(oriIdx + 1,N)
                    let curIdx = oriIdx + behind
                    let dis = curIdx - targetIdx
                    if dis <= remainK {
                        tree.update(oriIdx, 1)
                        nextIndices[digit] += 1
                        ans += "\(digit)"
                        remainK -= dis
                        break
                    }
                }
            }
        }
        return ans
    }
}