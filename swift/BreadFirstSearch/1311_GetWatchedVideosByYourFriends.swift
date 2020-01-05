// https://leetcode.com/problems/get-watched-videos-by-your-friends/
class Solution {
    func watchedVideosByFriends(_ watchedVideos: [[String]], _ friends: [[Int]], _ id: Int, _ level: Int) -> [String] {
        var videosCounter = [String:Int]()
        var queue: [Int] = [id]
        var visited = Array<Bool>(repeating: false, count: friends.count)
        visited[id] = true
        var depth = 0
        while !queue.isEmpty && depth <= level{
            var nextLevel = [Int]()
            queue.forEach {
                if depth == level {
                    watchedVideos[$0].forEach { videosCounter.updateValue((videosCounter[$0] ?? 0) + 1, forKey: $0)}
                } else {
                    friends[$0].forEach {
                        if !visited[$0] {
                            visited[$0] = true
                            nextLevel.append($0)
                        }
                    }
                }
            }
            queue = nextLevel
            depth += 1
        }
        let sortedVideoCounter = videosCounter.sorted { (argv1, argv2) -> Bool in
            if argv1.value == argv2.value {
                return argv1.key < argv2.key
            }
            return argv1.value < argv2.value
        }
        
        return sortedVideoCounter.map {$0.key}
    }
 }

