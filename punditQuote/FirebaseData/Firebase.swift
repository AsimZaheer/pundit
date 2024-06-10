//
//  Firebase.swift
//  punditQuote
//
//  Created by Mac on 23/10/2023.
//

import FirebaseDatabase

class FirebaseData {
    
    
//    class func readUser(completion: @escaping ([Quote]) -> Void) {
//        let userRef = Database.database().reference().child("quotes")
//
//        userRef.observeSingleEvent(of: Quote, with: <#T##(DataSnapshot) -> Void#>) { (snapshot)  in
//            var users: [Quote] = []
//            for child in snapshot.children {
//                if let userSnapshot = child as? DataSnapshot,
//                   let userData = userSnapshot.value as? String
//                    {
//                    let quote = Quote(text: userData )
//                    users.append(quote)
//                }
//            }
//            completion(users)
//        }
//    }
    
    class func readUser(completion: @escaping ([Quote]) -> Void) {
        
        let databaseRef = Database.database().reference()
         var users: [Quote] = []

        // Assuming "your-database-name" is the root node in your database
        let rootRef = databaseRef.child("quotes")

        // Observe changes to the database
        rootRef.observe(.value) { (snapshot) in
            // Check if there's data available
            if snapshot.exists() {
                for child in snapshot.children {
                    if let childSnapshot = child as? DataSnapshot,
                       let childData = childSnapshot.value as? [String: String],
                       let color = childData["colorCode"],
                       let image = childData["imagePath"],
                       let quote = childData["quote"] {
                        print("Color: \(color), Image: \(image), Quote: \(quote)")
                        users.append(Quote(text: quote, colorCode: color, imagePath: image))
                    }
                }
                completion(users)
            } else {
                print("No data found.")
            }
        }
    }
}
