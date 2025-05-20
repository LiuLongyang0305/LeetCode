//https://leetcode.cn/problems/minimum-swaps-to-sort-by-digit-sum/
class UnionFind1 {
    private var fa: [Int]
    private var sz: [Int]
    private var n: Int
    private var compCnt: Int
    init(n: Int) {
        self.n = n
        self.fa = Array<Int>(0..<n)
        self.compCnt = n
        self.sz = Array<Int>(repeating: 1, count: n)
    }

    func findSet1(x: Int) -> Int {
        guard fa[x] != x else {
            return x
        }
        fa[x] = findSet(x: fa[x])
        return fa[x]
    }
    func findSet(x: Int) -> Int {
        if x != fa[x] {
            fa[x] = findSet(x: fa[x])
        }
        return fa[x]
    }
    @discardableResult
    func union1(x:Int,y: Int) -> Bool {
        var fx = findSet(x: x)
        var fy = findSet(x: y)
        guard fx != fy else {
            return false
        }
        if sz[x] < sz[y] {
            (fx,fy) = (fy,fx)
        }
        fa[fy] = fx
        sz[fx] += sz[fy]
        compCnt -= 1
        return true
    }
    @discardableResult
    func union(x:Int,y: Int) -> Bool {
        let fx = findSet(x: x)
        let fy = findSet(x: y)
        guard fx != fy else {
            return false
        }
        if sz[fx] < sz[fy] {
            fa[fx] = fy
            sz[fy] += sz[fx]
        } else {
            fa[fy] = fx
            sz[fx] += sz[fy]
        }
        compCnt -= 1
        return true
    }
    func connected(x: Int,y: Int) -> Bool {
        return findSet(x: x) == findSet(x: y)
    }

    func getCompomentCnt() -> Int {
        return compCnt
    }
}
class Solution {
    private struct Node {
        var value:Int
        var idx:Int
        var digitsSum:Int
    }
    func minSwaps(_ nums: [Int]) -> Int {
        let sortedNodes = (0..<nums.count).map { idx in
            Node(value: nums[idx], idx: idx, digitsSum: getDigitsSum(of: nums[idx]))
        }.sorted { first, second in
            if first.digitsSum == second.digitsSum {
                return first.value < second.value
            }
            return first.digitsSum < second.digitsSum
        }

        let uf = UnionFind1(n: nums.count)
        for idx in 0..<nums.count {
            uf.union(x: idx, y: sortedNodes[idx].idx)
        }
        return nums.count - uf.getCompomentCnt()
    }

    private func getDigitsSum(of num: Int) -> Int {
        var t = num
        var ans = 0
        while t > 0 {
            ans += (t % 10)
            t /= 10
        }
        return ans
    }
}