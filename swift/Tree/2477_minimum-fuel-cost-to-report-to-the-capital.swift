// https://leetcode.com/problems/minimum-fuel-cost-to-report-to-the-capital/
class Solution {
    func minimumFuelCost(_ roads: [[Int]], _ seats: Int) -> Int {
        guard !roads.isEmpty else {return 0}
        let N = roads.count + 1

        //建树
        var tree = [[Int]](repeating: [], count: N)
        for road in roads {
            tree[road[0]].append(road[1])
            tree[road[1]].append(road[0])
        }
        tree[0].append(-1)

        //seats = 1,每个人都需要独立驱车前往，之所以单独讨论是因为直接喝seats > 1合并，有的时候会超时
        func minumFuelCostWhenSeatsEqualToOne() -> Int {

            var cost = 0

            func dfs(_ parent: Int,_ node: Int,_ depth: Int) {
                cost += depth
                guard tree[node].count > 1 else {
                    return
                }
                for ch in tree[node] {
                    if ch != parent {
                        dfs(node, ch, depth + 1)
                    }
                }
            }
            dfs(-1,0,0)
            return cost
        }

        //seats > 1时，需要先到达父节点，统计人数，安排车辆前往
        func minumFuelCostWhenSeatsLargerThanOne() -> Int {
            var cost = 0
            @discardableResult
            func dfs(_ parent: Int,_ node: Int) -> Int{
                guard tree[node].count > 1 else {
                    cost += 1
                    return 1
                }

                var cnt = 1
                for ch in tree[node] {
                    if ch != parent {
                        cnt += dfs(node, ch)
                    }
                }
                    //            print("node = \(node)  cnt = \(cnt)")
                if node != 0 {
                    cost += cnt / seats
                    if cnt % seats > 0 {
                        cost += 1
                    }
                }
                return cnt
            }

            dfs(-1, 0)
            return cost
        }

        return seats == 1 ? minumFuelCostWhenSeatsEqualToOne() : minumFuelCostWhenSeatsLargerThanOne()

    }
}