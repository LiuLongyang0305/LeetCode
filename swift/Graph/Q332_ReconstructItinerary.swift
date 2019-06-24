//https://leetcode.com/problems/reconstruct-itinerary/
class Solution {
    
    typealias Destinations = [String]
    func findItinerary(_ tickets: [[String]]) -> [String] {
        var result = [String]()
        var adjacencyMatrix = Dictionary<String, Destinations>()
        let departureStation = "JFK"
        for ticket in tickets {
            let from = ticket[0]
            let to = ticket[1]
            if nil == adjacencyMatrix[from] {
                adjacencyMatrix[from] = [to]
            } else {
                adjacencyMatrix[from]?.append(to)
            }
        }
        
        for (key,_) in adjacencyMatrix {
            adjacencyMatrix[key]?.sort()
        }
        func dfs(from: String) {
            while nil != adjacencyMatrix[from] && !adjacencyMatrix[from]!.isEmpty {
                dfs(from: adjacencyMatrix[from]!.removeFirst())
            }
            result.insert(from, at: 0)
        }
        
        dfs(from: departureStation)
        return result
    }
}