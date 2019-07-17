//https://leetcode.com/problems/time-based-key-value-store/
class TimeMap {

    var timeMap = [String:[String: Int]]()
    /** Initialize your data structure here. */
    init() {
        
    }
    
    func set(_ key: String, _ value: String, _ timestamp: Int) {
        if var dic = timeMap[key] {
            dic[value] = timestamp
            timeMap[key]  = dic
        } else {
            timeMap[key] = [value:timestamp]
        }
    }
    
    func get(_ key: String, _ timestamp: Int) -> String {
        var ans = ""
        if let dic = timeMap[key] {
            let  sortedDic = dic.sorted { (arg0, arg1) -> Bool in
                let (_, value1) = arg1
                let (_, value) = arg0
                return value > value1
            }
            for (key,val) in sortedDic {
                if val <= timestamp {
                    ans = key
                    break
                }
            }
        }
        return ans
    }
}

/**
 * Your TimeMap object will be instantiated and called as such:
 * let obj = TimeMap()
 * obj.set(key, value, timestamp)
 * let ret_2: String = obj.get(key, timestamp)
 */