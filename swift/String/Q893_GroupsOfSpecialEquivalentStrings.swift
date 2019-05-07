class Q893_Solution {
    func numSpecialEquivGroups(_ A: [String]) -> Int {
        var  specialEquivalentStringCountSet = Set<[Int]>()
        for str in A {
            specialEquivalentStringCountSet.insert(getStringPartion(source: str))
        }
        return  specialEquivalentStringCountSet.count
    }
    private func getStringPartion(source: String) -> [Int] {
        var result  = Array<Int>(repeating: 0, count: 52)
        var index = 0
        for char in source.utf8 {
            let tempIndex = 26 * (index % 2 == 0 ? 0 : 1) + Int(char) - 97
            result[tempIndex] = result[tempIndex] + 1
            index += 1
        }
        return result
    }
}