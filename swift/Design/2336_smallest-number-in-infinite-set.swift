//https://leetcode.com/problems/smallest-number-in-infinite-set/
class SmallestInfiniteSet {

    private var removed = Set<Int>()
    var smallest = 1
    init() {

    }

    func popSmallest() -> Int {
        let s = smallest
        removed.insert(s)
        while removed.contains(smallest) {
            smallest += 1
        }
        return s
    }

    func addBack(_ num: Int) {
        guard removed.contains(num) else {
            return
        }
        removed.remove(num)
        if num < smallest {
            smallest = num
        }

    }
}

/**
 * Your SmallestInfiniteSet object will be instantiated and called as such:
 * let obj = SmallestInfiniteSet()
 * let ret_1: Int = obj.popSmallest()
 * obj.addBack(num)
 */