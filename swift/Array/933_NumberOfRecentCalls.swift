//https://leetcode.com/problems/number-of-recent-calls/
class RecentCounter {
    var requests = Array<Int>()
    init() {
        
    }
    
    func ping(_ t: Int) -> Int {
        requests.append(t)
        let timeLimit = t - 3000
        while requests[0] < timeLimit {
            requests.removeFirst()
        }
        return requests.count
    }
}

/**
 * Your RecentCounter object will be instantiated and called as such:
 * let obj = RecentCounter()
 * let ret_1: Int = obj.ping(t)
 */
