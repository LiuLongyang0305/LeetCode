// https://leetcode.com/problems/destination-city/
class Solution {
    func destCity(_ paths: [[String]]) -> String {
        var startStations = Set<String>()
        for path in paths {
            startStations.insert(path[0])
        }
        for path in paths {
            if !startStations.contains(path[1]) {
                return path[1]
            }
        }
        return ""
    }
}