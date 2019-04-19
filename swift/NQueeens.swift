class Solution {
    var  result = [[String]]()
    
    var cols = Set<Int>()
    var pie = Set<Int>()
    var na = Set<Int>()
    
    var isCaculateTotalQueues = false
    var totalQueues = 0
    var numberOfQueues = -1
    
    private func NQueues(_ n : Int)  {
        self.numberOfQueues = n
        var currentState = [Int]()
        self.DFS(row: 0, currentState: &currentState)
        
    }
    public func solveNQueens(_ n: Int) -> [[String]] {
        
        guard n >= 1 else {
            return result
        }
        NQueues(n)
        return result
    }
    
    public func totalNQueens(_ n: Int) -> Int {
        guard n >= 1 else {
            return 0
        }
        self.isCaculateTotalQueues = true
        NQueues(n)
        return self.totalQueues
    }
    
    private func DFS(row : Int,currentState : inout [Int]) {
        if row >= numberOfQueues {
            if isCaculateTotalQueues {
                totalQueues += 1
            } else {
                generateResult(currentState)
            }
            return
        }
        for col in 0..<numberOfQueues {
            let currentPie = row - col
            let currentNa = row + col
            if cols.contains(col) || pie.contains(currentPie) || na.contains(currentNa) {
                continue
            }
            
            self.cols.insert(col)
            self.pie.insert(currentPie)
            self.na.insert(currentNa)
            currentState.append(col)
            self.DFS(row: row + 1, currentState: &currentState)
            self.cols.remove(col)
            self.pie.remove(currentPie)
            self.na.remove(currentNa)
            currentState.removeLast()
        }
    }
    
    private func generateResult(_ state : [Int]){
        guard !state.isEmpty else {
            return
        }
        var currentResult = Array<String>()
        for loc in state {
            var str = String(repeating: ".", count: loc)
            str.append("Q")
            str.append(String(repeating: ".", count: numberOfQueues - loc - 1))
            currentResult.append(str)
        }
        self.result.append(currentResult)
    }
}
