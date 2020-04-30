// https://leetcode.com/problems/design-hit-counter/
class HitCounter {

    private var counter = [Int:Int]()
    /** Initialize your data structure here. */
    init() {
        
    }
    
    /** Record a hit.
        @param timestamp - The current timestamp (in seconds granularity). */
    func hit(_ timestamp: Int) {
        counter.updateValue((counter[timestamp] ?? 0) + 1, forKey: timestamp)
    }
    
    /** Return the number of hits in the past 5 minutes.
        @param timestamp - The current timestamp (in seconds granularity). */
    func getHits(_ timestamp: Int) -> Int {
        var ans = 0
        for (time,cnt) in counter {
            if time > timestamp - 300 && time <= timestamp {
                ans += cnt
            }
        }
        return ans
    }
}

/**
 * Your HitCounter object will be instantiated and called as such:
 * let obj = HitCounter()
 * obj.hit(timestamp)
 * let ret_2: Int = obj.getHits(timestamp)
 */