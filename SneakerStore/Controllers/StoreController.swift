//
//  SneakerStore.swift
//  SneakerStore
//
//  Created by Dinmukhambet Turysbay on 30.06.2023.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class StoreController: ObservableObject {
    let db = Firestore.firestore()
    @Published var addedItems = Set<String>()
    var userId: String {
        get {
            if let currentUser = Auth.auth().currentUser {
                return currentUser.uid
            } else {
                return ""
            }
        }
    }

    func addItemToCart(_ item: Item, completion: @escaping (Error?) -> Void) {
        let docRef = db.collection("users").document(userId).collection("cart").document(item.id)
        docRef.setData(item.dictionary) { error in
            if let error = error {
                completion(error)
            } else {
                self.addedItems.insert(item.id)
                completion(nil)
            }
        }
    }

    func getCartItems(completion: @escaping ([Item]?, Error?) -> Void) {
        db.collection("users").document(userId).collection("cart").getDocuments { snapshot, error in
            if let error = error {
                completion(nil, error)
            } else {
                let items = snapshot?.documents.compactMap {
                    Item(dictionary: $0.data(), id: $0.documentID)
                }
                completion(items, nil)
            }
        }
    }
    
    func deleteItemFromCart(_ item: Item, completion: @escaping (Error?) -> Void) {
        let docRef = db.collection("users").document(userId).collection("cart").document(item.id)
        docRef.delete { error in
            if let error = error {
                completion(error)
            } else {
                self.addedItems.remove(item.id)
                completion(nil)
            }
        }
    }
    
    func updateItemQuantity(_ itemId: String, _ quantity: Int, completion: @escaping (Error?) -> Void) {
        let docRef = db.collection("users").document(userId).collection("cart").document(itemId)
        print("quantity",quantity)
        // Fetch the document before trying to update
        docRef.getDocument { document, error in
            if let document = document, document.exists {
                print("Document data: \(String(describing: document.data()))")
                // Update data if document exists
//                docRef.updateData([
//                    "quantity": quantity
//                ]) { error in
//                    completion(error)
//                }
                docRef.updateData([
                    "count": quantity
                ]) { error in
                    if let error = error {
                        print("Error updating document: \(error)")
                    } else {
                        print("Document successfully updated. New quantity: \(quantity)")
                    }
                    completion(error)
                }
            } else {
                print("Document does not exist")
                if let error = error {
                    print("Error getting document: \(error)")
                }
            }
        }
    }


}

