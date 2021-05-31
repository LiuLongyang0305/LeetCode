// https://leetcode.com/problems/count-all-possible-routes/

class Solution {
    private let MOD = 1_000_000_007
    private var memo = [Int:Int]()
    private var locations = [Int]()
    private var start = -1
    private var finish = -1
    private var locationsCnt = -1
    func countRoutes(_ locations: [Int], _ start: Int, _ finish: Int, _ fuel: Int) -> Int {
        self.memo = [:]
        self.locations = locations
        self.finish = finish
        self.start = start
        self.locationsCnt = locations.count
        return dfs(start, fuel)
    }
    
    private func dfs(_ curPos: Int, _ restFuel: Int) -> Int {
        let key = curPos << 32 | restFuel
        guard nil == memo[key] else {
            return memo[key]!
        }
        guard abs(self.locations[curPos] - self.locations[self.finish]) <= restFuel else {
            memo[key] = 0
            return 0
        }
        var ways = 0
        var pos = 0
        while pos < self.locationsCnt {
            if pos != curPos {
                let cost = abs(self.locations[curPos] - self.locations[pos])
                if cost <= restFuel {
                    ways += dfs(pos, restFuel - cost)
                    ways %= MOD
                }
            }
            pos += 1
        }
        if curPos == finish {
            ways += 1
            ways %= MOD
        }
        memo[key] = ways
        return ways
    }
}

