//https://leetcode.com/problems/implement-router/
var debug = false
class Router {

    let memoryLimit:Int
    private var packets = [[Int]]()
    private var existedPackets = Set<[Int]>()
    private var destinationToTiestmps = [Int:[Int]]()
    init(_ memoryLimit: Int) {
        self.memoryLimit = memoryLimit
        packets.append([-1,-1,-1])
        packets.append([-1,-1,1_000_000_007])
    }

    func addPacket(_ source: Int, _ destination: Int, _ timestamp: Int) -> Bool {
        let packet = [source,destination,timestamp]
        if debug {
            print("\(#function)   newPacket = \(packet)")
        }
        if !existedPackets.contains(packet) {
            if packets.count == memoryLimit + 2 {
                let _ = removePacket()
            }
            addPacket(packet)
            if debug {
                print("\(#function)  true")
            }
            return true
        } else {
            if debug {
                print("\(#function)  false")
            }
            return false
        }
    }

    func forwardPacket() -> [Int] {
        guard packets.count > 2 else {
            return []
        }
        if debug {
            print("\(#function)  \(packets.dropFirst().dropLast())")
        }
        return removePacket()
    }

    func getCount(_ destination: Int, _ startTime: Int, _ endTime: Int) -> Int {
        let i = binarySearch(in: destinationToTiestmps[destination] ?? [], for: startTime - 1)
        let j = binarySearch(in: destinationToTiestmps[destination] ?? [], for: endTime)
        return j - i
    }

    private func addPacket(_ packet: [Int]) {
        if debug {
            print("before \(#function)  \(packets.dropFirst().dropLast())")
        }

        existedPackets.insert(packet)
        let idx = binarySearch(for: packet[2])
        packets.insert(packet, at: idx + 1)

        if var indices = destinationToTiestmps[packet[1]] {
            let j = binarySearch(in: indices, for: packet[2] - 1)
            indices.insert(packet[2], at: j + 1)
            destinationToTiestmps[packet[1]] = indices
        } else {
            destinationToTiestmps[packet[1]] = [-1,packet[2],1_000_000_007]
        }
        if debug {
            print("end \(#function)  \(packets.dropFirst().dropLast())")
        }
    }
    private func removePacket() -> [Int] {
        if debug {
            print("before \(#function)  \(packets.dropFirst().dropLast())")
        }
        let removedPacket = packets.remove(at: 1)
        existedPackets.remove(removedPacket)
        if var indices = destinationToTiestmps[removedPacket[1]] {
            let j = binarySearch(in: indices, for: removedPacket[2] - 1)
            indices.remove(at: j + 1)
            destinationToTiestmps[removedPacket[1]] = indices
        }
        if debug {
            print("end \(#function)  \(packets.dropFirst().dropLast())")
        }
        return removedPacket
    }
    private func  binarySearch(for target: Int) -> Int {
        var l = 0
        var r = packets.count - 1
        while l < r {
            let mid = (l + r + 1) >> 1
            if packets[mid][2] <= target {
                l = mid
            } else {
                r = mid - 1
            }
        }
        return l
    }

    private func  binarySearch(in arr: [Int],for target: Int) -> Int {
        var l = 0
        var r = arr.count - 1
        while l < r {
            let mid = (l + r + 1) >> 1
            if arr[mid] <= target {
                l = mid
            } else {
                r = mid - 1
            }
        }
        return l
    }
}
