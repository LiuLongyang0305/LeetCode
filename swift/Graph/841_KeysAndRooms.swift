//https://leetcode.com/problems/keys-and-rooms/
class Solution {
    
    func canVisitAllRooms(_ rooms: [[Int]]) -> Bool {
        var visited = Set<Int>()
        var roomsQueue = Array<Int>()
        roomsQueue.append(0)
        while !roomsQueue.isEmpty {
            let levelSize = roomsQueue.count
            for _ in 0..<levelSize {
                let currentRoom = roomsQueue.removeFirst()
                visited.insert(currentRoom)
                for room in rooms[currentRoom] {
                    if !visited.contains(room) {
                        roomsQueue.append(room)
                    }
                }
            }
        }
        return visited.count == rooms.count
    }
}