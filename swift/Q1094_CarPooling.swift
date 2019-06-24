//https://leetcode.com/problems/car-pooling/
class Solution {
    
    func carPooling(_ trips: [[Int]], _ capacity: Int) -> Bool {
        var route = Array<Int>(repeating: 0, count: 1001)
        for trip in trips {
            route[trip[1]] += trip[0]
            route[trip[2]] -= trip[0]
        }
        var passgersNumer = 0
        for ele in route {
            passgersNumer += ele
            if passgersNumer > capacity {
                return false
            }
        }
        return true
    }
}