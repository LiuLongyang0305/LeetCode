//https://leetcode.com/problems/accounts-merge/
class Solution {
    struct Account: Hashable {
        var email: String
        var name: String
    }
    class UnionFindEmail {
        var parents = [Account:Account]()
        func find(account: Account) -> Account {
            if parents[account] == nil {
                parents[account] = account
                return account
            }
            
            var currentRoot = account
            var temp = account
            while parents[currentRoot] != currentRoot {
                currentRoot = parents[currentRoot]!
            }
            while parents[temp] != temp  {
                let next = parents[temp]!
                parents[temp] = currentRoot
                temp = next
            }
            return temp
        }
        
        func connected(first: Account, second: Account) -> Bool {
            return find(account: first) == find(account: second)
        }
        
        func union(first: Account, second: Account)  {
            let root1 = find(account: first)
            let root2 = find(account: second)
            
            parents[root2] = root1
        }
    }
    
    func accountsMerge(_ accounts: [[String]]) -> [[String]] {
        let size = accounts.count
        let unionFindEmail = UnionFindEmail()
        
        for j in 0..<size {
            let account = accounts[j]
            if account.count > 1 {
                let  first = Account(email: account[1], name: account[0])
                if account.count == 2 {
                    unionFindEmail.find(account: first)
                } else if account.count > 2 {
                    for i in 2..<account.count {
                        let second = Account(email: account[i], name: account[0])
                        if !unionFindEmail.connected(first: first, second: second) {
                            unionFindEmail.union(first: first, second: second)
                        }
                    }
                }
            }
        }

        
        var accountToMergedAccounts = [Account:[String]]()
        for (key,val) in unionFindEmail.parents {
            let root = unionFindEmail.find(account: val)
            if accountToMergedAccounts[root] == nil {
                accountToMergedAccounts[root] = [String]()
                accountToMergedAccounts[root]?.append(root.name)
            }
            accountToMergedAccounts[root]?.append(key.email)
        }
        var result = [[String]]()
        for (_,val) in accountToMergedAccounts {
            var valCopy = val
            valCopy.sort()
            result.append(valCopy)
        }
        
        return result
    }
}
