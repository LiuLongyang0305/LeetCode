// //  https://leetcode.com/problems/process-tasks-using-servers/
import CoreFoundation
struct Server: Comparable {
    //forFree
    static func < (lhs: Server, rhs: Server) -> Bool {
            if lhs.weight == rhs.weight {
                return lhs.id < rhs.id
            }
            return lhs.weight < rhs.weight
    }
    
    var id:Int
    var weight:Int
    var availableTime: Int
    
    func compare(_ rhs: Server) -> Bool {
        if self.availableTime == rhs.availableTime {
            return self < rhs
        }
        return self.availableTime < rhs.availableTime
    }
}
extension CFBinaryHeap {
    static func getMinHeapInstanceOfFreeServers() -> CFBinaryHeap {
        var callbacks = CFBinaryHeapCallBacks()
        callbacks.compare = { a,b,_ in
            let x = a!.load(as: Server.self)
            let y = b!.load(as: Server.self)
            return x == y ? 0 : (x < y ? -1 : 1)
        }
        return CFBinaryHeapCreate(nil, 0, &callbacks, nil)
    }
    static func getMinHeapInstanceOfUsedServers() -> CFBinaryHeap {
        var callbacks = CFBinaryHeapCallBacks()
        callbacks.compare = { a,b,_ in
            let x = a!.load(as: Server.self)
            let y = b!.load(as: Server.self)
            return x == y ? 0 : (x.compare(y) ? -1 : 1)
        }
        return CFBinaryHeapCreate(nil, 0, &callbacks, nil)
    }

}
class Solution {
    func assignTasks(_ servers: [Int], _ tasks: [Int]) -> [Int] {
        
        let freeServers = CFBinaryHeap.getMinHeapInstanceOfFreeServers()
        let usedServers = CFBinaryHeap.getMinHeapInstanceOfUsedServers()
        
        var pointer: UnsafeMutablePointer<Server> = .allocate(capacity: 1)
        var ans = [Int]()
        
        func enque(_ server: Server, minHeap: CFBinaryHeap) {
            pointer = .allocate(capacity: 1)
            pointer.initialize(to: server)
            CFBinaryHeapAddValue(minHeap, pointer)
        }
        

        
        (0..<servers.count).forEach { id in
            enque(Server(id: id, weight: servers[id], availableTime: 0),minHeap: freeServers )
        }
        
        for time in 0..<tasks.count {
            let t = tasks[time]
            while CFBinaryHeapGetCount(usedServers) > 0  {
                let server = CFBinaryHeapGetMinimum(usedServers).load(as: Server.self)
                guard server.availableTime <= time else {
                    break
                }
                CFBinaryHeapRemoveMinimumValue(usedServers)
                enque(server, minHeap: freeServers)
            }
            if CFBinaryHeapGetCount(freeServers) == 0 {
                var server = CFBinaryHeapGetMinimum(usedServers).load(as: Server.self)
                CFBinaryHeapRemoveMinimumValue(usedServers)
                ans.append(server.id)
                server.availableTime += t
                enque(server, minHeap: usedServers)
            } else {
                var server = CFBinaryHeapGetMinimum(freeServers).load(as: Server.self)
                CFBinaryHeapRemoveMinimumValue(freeServers)
                server.availableTime = time + t
                enque(server, minHeap: usedServers)
                ans.append(server.id)
            }
        }
        pointer.deallocate()
        return ans
    }
}

