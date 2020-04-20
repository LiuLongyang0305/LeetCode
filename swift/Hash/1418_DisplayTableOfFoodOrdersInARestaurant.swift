class Solution {
    func displayTable(_ orders: [[String]]) -> [[String]] {
        var tableHead: [String] = ["Table"]
        var foodNames = Set<String>()
        for order in orders {
            foodNames.insert(order[2])
        }
        let sortedFoodNames  = foodNames.sorted()
        tableHead.append(contentsOf: sortedFoodNames)
        var mapFoodAndIndex = [String:Int]()
        for i in 0..<tableHead.count {
            mapFoodAndIndex[tableHead[i]] = i
        }
        var tables = Array<Array<Int>>(repeating: Array<Int>(repeating: 0, count: tableHead.count), count: 501)
        var validTables = Set<Int>()
        for order in orders {
            let table = Int(order[1])!
            validTables.insert(table)
            tables[table][mapFoodAndIndex[order[2]]!] += 1
        }
        var ans = [tableHead]
        for tableNumber in validTables.sorted() {
            tables[tableNumber][0] = tableNumber
            ans.append(tables[tableNumber].map({"\($0)"}))
        }
        return ans
    }
}

