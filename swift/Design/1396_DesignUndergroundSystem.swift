// https://leetcode.com/problems/design-underground-system/
class UndergroundSystem {
    private var starting = [String:[Int:Int]]()
    private var destination = [String:[Int:Int]]()
    init() {
        
    }
    
    func checkIn(_ id: Int, _ stationName: String, _ t: Int) {
        if nil == starting[stationName] {
            starting[stationName] = [:]
        }
        starting[stationName]?[id] = t
    }
    
    func checkOut(_ id: Int, _ stationName: String, _ t: Int) {
        if nil == destination[stationName] {
            destination[stationName] = [:]
        }
        destination[stationName]?[id] = t
    }
    
    func getAverageTime(_ startStation: String, _ endStation: String) -> Double {
        var totalTime = 0
        var count = 0
        guard let startInfo = starting[startStation],let endInfo = destination[endStation] else {
            return 0
        }
        for (id,startTime) in startInfo {
            if let endTime = endInfo[id], endTime > startTime {
                totalTime += endTime - startTime
                count += 1
            }
        }
        return Double(totalTime) / Double(count)
    }
}


/**
 * Your UndergroundSystem object will be instantiated and called as such:
 * let obj = UndergroundSystem()
 * obj.checkIn(id, stationName, t)
 * obj.checkOut(id, stationName, t)
 * let ret_3: Double = obj.getAverageTime(startStation, endStation)
 */