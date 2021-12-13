// https://leetcode.com/problems/sequentially-ordinal-rank-tracker/
struct Location: Comparable {

    static func < (lhs: Location, rhs: Location) -> Bool {
        return  lhs.attractiveScore == rhs.attractiveScore ? (lhs.name > rhs.name) : (lhs.attractiveScore < rhs.attractiveScore)
    }
    
    var name: String
    var attractiveScore: Int
}
// extension Location: CustomStringConvertible {
//     var description: String {
//         return "(name: \(name)   , score: \(attractiveScore)) "
//     }
// }

class SORTracker {
    private var sortedLocationsList = [Location]()
    private var queryTimes = 0
    init() {
        sortedLocationsList = []
        queryTimes = 0
    }
    
    func add(_ name: String, _ score: Int) {
        // defer {
        //     print(sortedLocationsList)
        // }
        let location = Location(name: name, attractiveScore: score)
        guard !sortedLocationsList.isEmpty else {
            sortedLocationsList.append(location)
            return
        }
        guard location < sortedLocationsList[0] else {
            sortedLocationsList.insert(location, at: 0)
            return
        }
        guard location > sortedLocationsList.last! else {
            sortedLocationsList.append(location)
            return
        }
        
        var left = 0
        var right = sortedLocationsList.count - 1
        
        while left < right {
            let mid = (left + right) >> 1
            if sortedLocationsList[mid] < location {
                right = mid
            } else {
                left = mid + 1
            }
        }
        
        sortedLocationsList.insert(location, at: left)
    }
    
    func get() -> String {
        queryTimes += 1
        return sortedLocationsList[queryTimes - 1].name
    }
}

/**
 * Your SORTracker object will be instantiated and called as such:
 * let obj = SORTracker()
 * obj.add(name, score)
 * let ret_2: String = obj.get()
 */