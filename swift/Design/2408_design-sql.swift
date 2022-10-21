// https://leetcode.com/problems/design-sql/
class SQL {
    private class Table {
        var maxId = 0
        var clumsCnt: Int
        var rows: [Int:[String]] = [:]
        var name: String
        init(_ name:String,_ cnt:Int) {
            self.clumsCnt = cnt
            self.name = name
        }
    }
    private var nameToTables = [String:Table]()
    init(_ names: [String], _ columns: [Int]) {
        let N = names.count
        for i in 0..<N {
            nameToTables[names[i]] = Table(names[i], columns[i])
        }
        // print(nameToTables)
    }

    func insertRow(_ name: String, _ row: [String]) {
        // print("\(#function)")
        // defer {
        //     print("\(#function)")
        // }
        guard let table = nameToTables[name] else {return}
        table.maxId += 1
        table.rows[table.maxId] = row

    }

    func deleteRow(_ name: String, _ rowId: Int) {
        // print("\(#function)")
        // defer {
        //     print("\(#function)")
        // }
        guard let table = nameToTables[name] else {return}
        table.rows.removeValue(forKey: rowId)
    }

    func selectCell(_ name: String, _ rowId: Int, _ columnId: Int) -> String {
        // print("\(#function)")
        // defer {
        //     print("\(#function)")
        // }
        guard let table = nameToTables[name],let row = table.rows[rowId]  else {return ""}
        // print("\(table.clumsCnt)   \(columnId)")
        return row[columnId - 1]
    }
}


/**
 * Your SQL object will be instantiated and called as such:
 * let obj = SQL(names, columns)
 * obj.insertRow(name, row)
 * obj.deleteRow(name, rowId)
 * let ret_3: String = obj.selectCell(name, rowId, columnId)
 */