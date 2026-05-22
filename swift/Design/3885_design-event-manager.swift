    // https://leetcode.cn/problems/design-event-manager/
     class EventManager {

         struct Event: Hashable,Comparable {
             static func < (lhs: EventManager.Event, rhs: EventManager.Event) -> Bool {
                 if lhs.priority == rhs.priority {
                     return lhs.id < rhs.id
                 }
                 return lhs.priority > rhs.priority
             }

             var id: Int
             var priority:Int
         }

         private var pq = Heap<Event>()
         private var latestPriority = [Int:Int]()
         init(_ events: [[Int]]) {
             for e in events {
                 let event = Event(id: e[0], priority: e[1])
                 pq.insert(event)
                 latestPriority[e[0]] = e[1]
             }
            //  print(latestPriority)
         }

         func updatePriority(_ eventId: Int, _ newPriority: Int) {
             if let p = latestPriority[eventId], p != newPriority {
                 latestPriority[eventId] = newPriority
                 pq.insert(Event(id: eventId, priority: newPriority))
             }
            //  print(latestPriority)
         }

         func pollHighest() -> Int {

             while let e = pq.popMin() {

                 guard let p = latestPriority[e.id] else {continue}

                 if p != e.priority {
                     continue
                 }

                 latestPriority.removeValue(forKey: e.id)
                 return e.id

             }

             return -1
         }
     }
