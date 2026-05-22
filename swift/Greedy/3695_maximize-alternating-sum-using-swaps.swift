//https://leetcode.cn/problems/maximize-alternating-sum-using-swaps/
class Solution {
    // MARK: - 优化后的并查集
    class UnionFind {
        private var parent: [Int]
        private var rank: [Int]

        init(_ n: Int) {
            parent = Array(0..<n)
            rank = Array(repeating: 0, count: n)
        }

        func find(_ x: Int) -> Int {
            if parent[x] != x {
                parent[x] = find(parent[x]) // 路径压缩
            }
            return parent[x]
        }

        func union(_ x: Int, _ y: Int) {
            let rootX = find(x)
            let rootY = find(y)
            guard rootX != rootY else { return }

            // 按秩合并
            if rank[rootX] < rank[rootY] {
                parent[rootX] = rootY
            } else if rank[rootX] > rank[rootY] {
                parent[rootY] = rootX
            } else {
                parent[rootY] = rootX
                rank[rootX] += 1
            }
        }
    }

    // MARK: - 主函数
    func maxAlternatingSum(_ nums: [Int], _ swaps: [[Int]]) -> Int {
        let n = nums.count
        guard n > 0 else { return 0 }

        let uf = UnionFind(n)
        for swap in swaps {
            uf.union(swap[0], swap[1])
        }

        var rootToNums = [Int:[Int]]()
        var rootToCnt = [Int:(total:Int,odd:Int,sum:Int)]()

        for i in 0..<n {
            let root = uf.find(i)
            rootToNums[root,default: []].append(nums[i])
            rootToCnt[root,default: (0,0,0)].total += 1
            if i & 1 == 1 {
                rootToCnt[root,default: (0,0,0)].odd += 1
            }
            rootToCnt[root,default: (0,0,0)].sum += nums[i]
        }

        // print(rootToNums)
        // print(rootToCnt)
        func cal(_ arr: [Int], _ cnt: Int) -> Int {
            var heap = Heap<Int>()
            var sum = 0

            for v in arr {
                if heap.count < cnt {
                    sum += v
                    heap.insert(v)
                } else {
                    if let maxV =  heap.max {
                        if v < maxV {
                            sum -= maxV
                            sum += v
                            let _ = heap.popMax()
                            heap.insert(v)
                        }
                    }

                }
            }


            return sum
        }


        var sb = 0

        for (r,subArr) in rootToNums {
            let (totalcnt,oddcnt,sum) = rootToCnt[r]!

            if totalcnt == oddcnt {
                sb -= sum
                continue
            }
            if oddcnt == 0 {
                sb += sum
                continue
            }
            sb += sum - 2 * cal(subArr, oddcnt)
        }


        return sb
    }
}

