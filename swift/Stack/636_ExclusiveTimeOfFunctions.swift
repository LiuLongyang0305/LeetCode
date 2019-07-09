//https://leetcode.com/problems/exclusive-time-of-functions/
class Solution {
    
    enum FunctionStatus: Int {
        case start = 0
        case end = 1
    }
    
    typealias Log = (functionID: Int, status: FunctionStatus, time: Int)
    
    func exclusiveTime(_ n: Int, _ logs: [String]) -> [Int] {
        
        var ans = Array<Int>(repeating: 0, count: n)
        var stack = Array<Log>()
        
        for log in logs {
            let currentLog = logToTuple(log: log)
            if currentLog.status == .start {
                stack.append(currentLog)
                continue
            }
            let lastLog = stack.removeLast()
            let deltaTime = currentLog.time - lastLog.time + 1
            ans[currentLog.functionID] += deltaTime
            if !stack.isEmpty {
                ans[stack.last!.functionID] -= deltaTime
            }
        }
        
        return ans
    }
    
    private func logToTuple(log: String) -> Log {
        var parts = log.split(separator: ":")
        return (Int(parts[0])!,parts[1] == "start" ? FunctionStatus.start : FunctionStatus.end, Int(parts[2])!)
    }
}


var n = 8
var logs = ["0:start:0","1:start:5","2:start:6","3:start:9","4:start:11","5:start:12","6:start:14","7:start:15","1:start:24","1:end:29","7:end:34","6:end:37","5:end:39","4:end:40","3:end:45","0:start:49","0:end:54","5:start:55","5:end:59","4:start:63","4:end:66","2:start:69","2:end:70","2:start:74","6:start:78","0:start:79","0:end:80","6:end:85","1:start:89","1:end:93","2:end:96","2:end:100","1:end:102","2:start:105","2:end:109","0:end:114"]
Solution().exclusiveTime(n, logs)
