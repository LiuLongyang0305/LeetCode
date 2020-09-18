// https://leetcode.com/problems/design-hit-counter/
class HitCounter {
    private typealias HitPrefix = (time:Int,prefix:Int)
    private var hitCounter: [HitPrefix] = [(-1,0)]
    /** Initialize your data structure here. */
    init() {
        
    }
    
    /** Record a hit.
        @param timestamp - The current timestamp (in seconds granularity). */
    func hit(_ timestamp: Int) {
        if let last = hitCounter.last {
            hitCounter.append((timestamp,last.prefix + 1))
        }
    }
    
    /** Return the number of hits in the past 5 minutes.
        @param timestamp - The current timestamp (in seconds granularity). */
    func getHits(_ timestamp: Int) -> Int {
        let from = max(0, timestamp - 300)
        if let idx1 = hitCounter.lastIndex(where: {$0.time <= from}), let idx2 = hitCounter.lastIndex(where: { $0.time <= timestamp}) {
            return hitCounter[idx2].prefix - hitCounter[idx1].prefix
        }
        return 0
    }
}

/**
 * Your HitCounter object will be instantiated and called as such:
 * let obj = HitCounter()
 * obj.hit(timestamp)
 * let ret_2: Int = obj.getHits(timestamp)
 */
