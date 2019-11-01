//https://leetcode.com/problems/snapshot-array/
class SnapshotArray {
    private var data: [Int]
    private var length :Int
    private var snapValues = [Int:[Int:Int]]()
    private var currentSnapId = -1
    init(_ length: Int) {
        data = Array<Int>(repeating: 0, count: length)
        self.length = length
    }
    
    func set(_ index: Int, _ val: Int) {
        if nil == snapValues[currentSnapId] {
            snapValues[currentSnapId] = [:]
        }
        snapValues[currentSnapId]?.updateValue(val, forKey: index)
    }
    
    func snap() -> Int {
        currentSnapId += 1
        snapValues[currentSnapId] = [:]
        return currentSnapId
    }
    
    func get(_ index: Int, _ snap_id: Int) -> Int {
        var snapId = snap_id - 1
        while snapId >= -1 {
            if let dic = snapValues[snapId], let val = dic[index]  {
                return val
            }
            snapId -= 1
        }
        return data[index]
    }
}

/**
 * Your SnapshotArray object will be instantiated and called as such:
 * let obj = SnapshotArray(length)
 * obj.set(index, val)
 * let ret_2: Int = obj.snap()
 * let ret_3: Int = obj.get(index, snap_id)
 */