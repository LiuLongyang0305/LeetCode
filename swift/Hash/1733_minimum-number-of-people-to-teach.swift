// https://leetcode.com/problems/minimum-number-of-people-to-teach/
class Solution {
    func minimumTeachings(_ n: Int, _ languages: [[Int]], _ friendships: [[Int]]) -> Int {
        
        let languagesSets = languages.map { Set<Int>($0)}
        var counter = [Int:Int]()
        
        func check(_ p1: Int, _ p2: Int) -> Bool {
            for l in languagesSets[p1] {
                guard !languagesSets[p2].contains(l) else {
                    return true
                }
            }
            return false
        }
        var  peopleCount = 0
        var visited = Array<Bool>(repeating: false, count: languages.count)
        
        for friendShip in friendships {
            let p1 = friendShip[0] - 1
            let p2 = friendShip[1] - 1
            guard !check(p1,p2) else {
                continue
            }
            if !visited[p1] {
                for l in languages[p1] {
                    counter[l,default: 0] += 1
                }
                visited[p1] = true
                peopleCount += 1
            }
            if !visited[p2] {
                for l in languages[p2] {
                    counter[l,default: 0] += 1
                }
                visited[p2] = true
                peopleCount += 1
            }
        }
        guard peopleCount > 0 else {
            return 0
        }
        return peopleCount - (counter.values.max() ?? languages.count)
    }
}

