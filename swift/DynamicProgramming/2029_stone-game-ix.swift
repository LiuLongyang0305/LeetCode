// https://leetcode.cn/problems/stone-game-ix/
class Solution {
    func stoneGameIX(_ stones: [Int]) -> Bool {
        guard stones.count > 1 else {return false}
        var counter = [Int](repeating: 0, count: 3)
        for stone in stones {
            let mod = stone % 3
            counter[mod] += 1
        }

        counter[0] %= 2
        let minCnt = max(0,min(counter[1], counter[2]) - 1)
        counter[1] -= minCnt
        counter[2] -= minCnt
        let N = stones.count

        var memo = [Int:Bool]()
        func dfs(_ cuCcouter: [Int],_ cost: Int) -> Bool {

            // print("\(cuCcouter)  \(cost)")
            let remain = cuCcouter.reduce(0) { $0 + $1}
            if remain == 1 {
                let last = cuCcouter.firstIndex(of: 1)!
                let flag = (last +  cost) % 3 == 0
                //Alice
                if N & 1 == 1 {
                    return false
                } else // Bob
                {
                    return !flag
                }
            }


            let key = cuCcouter.hashValue
            if let ans = memo[key] {
                return ans
            }
            var flag = false
            for i in 0..<3 {
                guard cuCcouter[i] > 0 else {continue}
                let nc = (cost + i) % 3
                if nc != 0 {
                    var newCounter = cuCcouter
                    newCounter[i] -= 1
                    guard dfs(newCounter, nc) else {
                       flag = true
                        break
                    }
                }
            }
            memo[key] = flag
            return flag

        }
        return dfs(counter, 0)
    }
}