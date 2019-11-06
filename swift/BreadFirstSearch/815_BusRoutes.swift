//https://leetcode.com/problems/bus-routes/
class Solution1 {
    func numBusesToDestination(_ routes: [[Int]], _ S: Int, _ T: Int) -> Int {
        guard S != T else {
            return 0
        }
        let busRoutes = routes.map{Set<Int>($0)}
        var stationToBus = [Int:Set<Int>]()
        for i in 0..<routes.count {
            for station in routes[i] {
                if nil == stationToBus[station] {
                    stationToBus[station] = []
                }
                stationToBus[station]?.insert(i)
            }
        }
        if let s = stationToBus[S], let t = stationToBus[T] {
            if !s.intersection(t).isEmpty {
                return 1
            }
        }
        var takenBusNumber = Set<Int>(stationToBus[S]!)
        var takenBusesCount = 0
        var potentialBuses = Array<Int>(stationToBus[S]!)
        while !potentialBuses.isEmpty {
            takenBusesCount += 1
            let length = potentialBuses.count
            for _ in 0..<length {
                let bus = potentialBuses.removeFirst()
                let stations = busRoutes[bus]
                for station in stations {
                    if let buses = stationToBus[station] {
                        for bus in buses {
                            if busRoutes[bus].contains(T) {
                                return takenBusesCount + 1
                            }
                            if !takenBusNumber.contains(bus) {
                                takenBusNumber.insert(bus)
                                potentialBuses.append(bus)
                            }
                        }
                    }
                }
            }
        }
        return -1
    }
}

class Solution {
    func numBusesToDestination(_ routes: [[Int]], _ S: Int, _ T: Int) -> Int {
        guard S != T else {
            return 0
        }
        let busRoutes = routes.map{Set<Int>($0)}
        var intersectionBuses = Array<Array<Int>>(repeating: Array<Int>(), count: routes.count)
        for i in 0..<(routes.count - 1) {
            for j in (i + 1)..<routes.count {
                if !busRoutes[i].intersection(busRoutes[j]).isEmpty  {
                    intersectionBuses[i].append(j)
                    intersectionBuses[j].append(i)
                }
            }
        }
        var startBuses = Set<Int>()
        var endBuses = Set<Int>()
        for i in 0..<routes.count {
            if busRoutes[i].contains(S) {
                startBuses.insert(i)
            }
            if busRoutes[i].contains(T) {
                endBuses.insert(i)
            }
        }
        guard startBuses.intersection(endBuses).isEmpty else {
            return 1
        }
        //BFS
        var takenBusNumber = Set<Int>(startBuses)
        var takenBusesCount = 0
        var potentialBuses = Array<Int>(startBuses)
        while !potentialBuses.isEmpty {
            takenBusesCount  += 1
            let length = potentialBuses.count
            for _ in 0..<length {
                let bus = potentialBuses.removeFirst()
                for nextBus in intersectionBuses[bus] {
                    if endBuses.contains(nextBus) {
                        return takenBusesCount + 1
                    }
                    if !takenBusNumber.contains(nextBus) {
                        takenBusNumber.insert(nextBus)
                        potentialBuses.append(nextBus)
                    }
                }
            }
        }
        return -1
    }
}
