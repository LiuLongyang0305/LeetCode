// https://leetcode.com/problems/design-a-number-container-system/
class NumberContainers {

    private var numberToIndices = [Int:[Int]]()
    private var indexToNumber = [Int:Int]()
    private let INF = 1_000_000_007
    init() {

    }

    func change(_ index: Int, _ number: Int) {
        if let v = indexToNumber[index] {
            guard v != number else {return}
            removeIndex(v, index)
        }
        indexToNumber[index] = number
        addIndex(number, index)
    }

    func find(_ number: Int) -> Int {
        guard let indices = numberToIndices[number] else {return -1}
        return indices[1]
    }


    private func removeIndex(_ number: Int, _ index: Int) {
        guard let indices = numberToIndices[number] else {
            return
        }
        guard indices.count > 3 else {
            numberToIndices.removeValue(forKey: number)
            return
        }
        var left = 0
        var right = indices.count - 1

        while left < right {
            let mid = (left + right) >> 1
            if indices[mid] >= index {
                right = mid
            } else if indices[mid] < index {
                left = mid + 1
            }
        }
        numberToIndices[number]?.remove(at: left)
    }

    private func addIndex(_ number: Int,_ index:Int) {
        guard let indices = numberToIndices[number] else {
            numberToIndices[number] = [-1,index,INF]
            return
        }
        var left = 0
        var right = indices.count - 1
        while left < right {
            let mid = (left + right) >> 1
            if indices[mid] > index {
                right = mid
            } else {
                left = mid + 1
            }
        }
        numberToIndices[number]?.insert(index, at: left)
    }
}
