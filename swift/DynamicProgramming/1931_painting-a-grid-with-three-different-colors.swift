// https://leetcode.com/problems/painting-a-grid-with-three-different-colors/
class Solution {
    private static var adjacentStates = Array<[String:[String]]>(repeating: [:], count: 6)
    private let MOD = 1_000_000_007
    
    func colorTheGrid(_ m: Int, _ n: Int) -> Int {
        let row = max(m, n)
        let col = min(m, n)
        if Solution.adjacentStates[col].isEmpty {
            Solution.adjacentStates[col] = getAdjacentStates(of: getPossibleStates(col))
        }
        
        let curAdjacentStates = Solution.adjacentStates[col]
        guard row > 1 else {
            return curAdjacentStates.count
        }
        var lastRow = [String:Int]()
        curAdjacentStates.forEach { (s,_) in
            lastRow[s] = 1
        }
        for _ in 2...row {
            var curRow = [String:Int]()
            for (s,cnt) in lastRow {
                guard let nextRows = curAdjacentStates[s] else {
                    continue
                }
                for nr in nextRows {
                    curRow.updateValue(((curRow[nr] ?? 0) + cnt) % MOD, forKey: nr)
                }
            }
            lastRow = curRow
        }
        return lastRow.values.reduce(0) { ($0 + $1) % MOD }
    }
    
    private func getPossibleStates(_ n: Int) -> [String] {
        var ans = [String]()
        let max = Int(pow(3.0, Double(n)))
        
        func check(_ s: String) -> Bool {
            var last = s.first!
            for ch in s.dropFirst() {
                guard ch != last else {
                    return false
                }
                last = ch
            }
            return true
        }
        for i in 0..<max {
            var state = String.init(i, radix: 3)
            if state.count < n {
                state = String(repeating: "0", count: n - state.count) + state
            }
            if check(state) {
                ans.append(state)
            }
        }
        return ans
    }
    private func getAdjacentStates(of rowStates: [String]) -> [String:[String]] {
        let N = rowStates.count
        var ans = [String:[String]]()
        for f in 0..<N {
            var s = f + 1
            while s < N {
                if check(rowStates[f], rowStates[s]) {
                    ans[rowStates[f],default: []].append(rowStates[s])
                    ans[rowStates[s],default: []].append(rowStates[f])
                }
                s += 1
            }
        }
        return ans
    }
    private func check(_ first: String, _ second: String) -> Bool {
        var firstIdx = first.startIndex
        var secondIdx = second.startIndex
        while firstIdx < first.endIndex {
            guard first[firstIdx] != second[secondIdx] else {
                return false
            }
            firstIdx = first.index(after: firstIdx)
            secondIdx = second.index(after: secondIdx)
        }
        return true
    }
}