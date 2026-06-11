// https://leetcode.cn/problems/greatest-common-divisor-traversal/
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
        func canTraverseAllPairs(_ nums: [Int]) -> Bool {
            guard nums.count > 1 else {return true}
            guard !nums.contains(where: {$0 == 1}) else {return false}
            let maxVal = nums.max()!
            let uf = UnionFind1(n: maxVal + 5)

            for num in nums {
                for pf in primeFactorsInner(of: num) {
                    uf.union(x: num, y: pf)
                }
            }
            let target = uf.findSet(x: nums[0])
            for num in nums.dropFirst() {
                guard uf.connected(x: num, y: target) else {return false}
            }
            return true
        }
        private func primeFactorsInner(of number: Int) -> Set<Int> {
            guard number > 1 else { return [] }

            var n = number
            var factors: Set<Int> = []

            // 处理因子 2
            while n % 2 == 0 {
                factors.insert(2)
                n /= 2
            }

            // 处理奇数因子（从 3 开始，每次加 2）
            var divisor = 3
            while divisor * divisor <= n {
                while n % divisor == 0 {
                    factors.insert(divisor)
                    n /= divisor
                }
                divisor += 2
            }

            // 如果剩余的数大于 1，它本身是质数
            if n > 1 {
                factors.insert(n)
            }

            return factors
        }
    }
