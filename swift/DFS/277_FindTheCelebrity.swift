//https://leetcode.com/problems/find-the-celebrity/
class Relation {
    func knows(_ a: Int, _ b: Int) -> Bool {
        return false
    }
}

class Solution1: Relation  {
    func findCelebrity(_ n: Int) -> Int {
        var celebrity = 0
        for i in 0..<n {
            if knows(celebrity, i) {
                celebrity = i
            }
        }
        for i in 0..<n {
            if i == celebrity {
                continue
            }
            if knows(celebrity, i) || !knows(i, celebrity) {
                return -1
            }
        }
        return celebrity
    }
}

class Solution : Relation {
    func findCelebrity(_ n: Int) -> Int {
        var possibleCelebrities = Set<Int>(0..<n)
        var celebrity = 0
        for another in 0..<n {
            if another != celebrity && knows(celebrity, another) {
                possibleCelebrities.remove(celebrity)
                celebrity = another
            }
        }
        
        guard possibleCelebrities.count  == 1 else {
            return -1
        }
        let finalPossibleCelebrity = possibleCelebrities.first!
        func check(_ celebrity: Int) -> Bool {
            for i in 0..<n {
                if i != celebrity {
                    if !knows(i, celebrity) {
                        return false
                    }
                }
            }
            return true
        }
        return check(finalPossibleCelebrity) ? finalPossibleCelebrity : -1
    }
}
