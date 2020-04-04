//https://leetcode.com/problems/logger-rate-limiter/
class Logger {
    
    private var printedTime = [String:Int]()
    /** Initialize your data structure here. */
    init() {
        
    }
    
    /** Returns true if the message should be printed in the given timestamp, otherwise returns false.
     If this method returns false, the message will not be printed.
     The timestamp is in seconds granularity. */
    func shouldPrintMessage(_ timestamp: Int, _ message: String) -> Bool {
        guard let lastTime = printedTime[message] else {
            printedTime[message] = timestamp
            return true
        }
        guard timestamp - lastTime >= 10 else {
            return false
        }
        printedTime[message] = timestamp
        return true
    }
}

/**
 * Your Logger object will be instantiated and called as such:
 * let obj = Logger()
 * let ret_1: Bool = obj.shouldPrintMessage(timestamp, message)
 */
