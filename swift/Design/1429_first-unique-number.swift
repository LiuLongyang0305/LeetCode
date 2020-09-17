// https://leetcode.com/problems/first-unique-number/
class FirstUnique {
    private var valueToIndex = [Int:Int]()
    private var indexToValue = [Int:Int]()
    private var headIndex: Int = -1
    private var cnt = [Int:Int]()
    init(_ nums: [Int]) {
        nums.forEach { add($0)}
    }
    
    func showFirstUnique() -> Int {
        return indexToValue[headIndex] ?? -1
    }
    
    func add(_ value: Int) {
        if let _ = cnt[value] {
            cnt[value, default: 0] += 1
            if let index = valueToIndex[value] {
                if index == headIndex {
                    // update headIndex
                    let N = valueToIndex.count
                    var from = index + 1
                    headIndex = -1
                    while from < N {
                        if let c = cnt[indexToValue[from]!], c == 1 {
                            headIndex = from
                            break
                        }
                        from += 1
                    }
                }
            }
        } else {
            let curIndex = indexToValue.count
            indexToValue[curIndex ] = value
            valueToIndex[value] = curIndex
            cnt[value] = 1
            if headIndex == -1 {
                headIndex = curIndex
            }
        }
    }
}
/**
 * Your FirstUnique object will be instantiated and called as such:
 * let obj = FirstUnique(nums)
 * let ret_1: Int = obj.showFirstUnique()
 * obj.add(value)
 */
