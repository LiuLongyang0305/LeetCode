//https://leetcode.com/problems/gas-station/
class Solution {
    func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
        var remainderGas = Array<Int>(repeating: 0, count: gas.count)
        for i in 0..<gas.count {
            remainderGas[i] = gas[i] - cost[i]
        }
        let maxRemainder = remainderGas.max()!
        if maxRemainder < 0 {
            return -1
        }
        for index in 0..<gas.count {
            if remainderGas[index] >= 0 {
                var currentRemainder = 0
                for i in index..<(index + gas.count) {
                    let tempIndex = i % gas.count
                    currentRemainder = currentRemainder + gas[tempIndex] - cost[tempIndex]
                    if currentRemainder < 0 {
                        break
                    }
                    if i == index + gas.count - 1 {
                        return index
                    }
                }
                
            }
        }
        return -1
    }
}

