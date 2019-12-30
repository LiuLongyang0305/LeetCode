//https://leetcode.com/problems/map-sum-pairs/
 class MapSum {
    
    private var map : [String:Int]
    /** Initialize your data structure here. */
    init() {
        map = [:]
    }
    
    func insert(_ key: String, _ val: Int) {
        map.updateValue(val, forKey: key)
    }
    
    func sum(_ prefix: String) -> Int {
        var ans = 0
        for (key,val) in map {
            if key.starts(with: prefix){
                ans += val
            }
        }
        return ans
    }
 }
 

/**
 * Your MapSum object will be instantiated and called as such:
 * let obj = MapSum()
 * obj.insert(key, val)
 * let ret_2: Int = obj.sum(prefix)
 */