class Q274_Solution {
    func hIndex(_ citations: [Int]) -> Int {
        let myCitations = citations
        myCitations.sorted(by: >)
        for (index,val) in myCitations.enumerated() {
            if index + 1 > val {
                return index
            }
        }
        return citations.count
    }
}