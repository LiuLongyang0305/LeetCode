//https://leetcode.com/problems/reorder-data-in-log-files/
struct Log {
    var symbol: String
    var content: String
}

class Solution {
    func reorderLogFiles(_ logs: [String]) -> [String] {
        var ans = [String]()
        var numberLogs = [String]()
        var letterLogs = [Log]()
        for log in logs {
            let compoments = log.components(separatedBy: " ")
            if  compoments[1].first!.isLetter {
                let symbol = compoments[0]
                let index = log.index(log.startIndex, offsetBy: symbol.count)
                let content = String(log[index..<log.endIndex])
                letterLogs.append(Log(symbol: symbol, content: content))
            } else  {
                numberLogs.append(log)
            }
        }
        let sortedLetterLog = letterLogs.sorted { (log1, log2) -> Bool in
            // if log1.content != log2.content {
            //     return log1.content < log2.content
            // } else {
            //     return log1.symbol < log2.symbol
            // }
            log1.content != log2.content ? log1.content < log2.content : log1.symbol < log2.symbol
        }
        ans.append(contentsOf: sortedLetterLog.map({ $0.symbol + $0.content}))
        ans.append(contentsOf: numberLogs)
        return ans
    }
}