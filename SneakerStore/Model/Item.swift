//
//  Item.swift
//  SneakerStore
//
//  Created by Dinmukhambet Turysbay on 28.06.2023.
//

import Foundation


struct Item: Identifiable {
    let id: String
    let image: String
    let title: String
    let description: String
    let price: Int
    var count: Int

    var dictionary: [String: Any] {
        return [
            "image": image,
            "title": title,
            "description": description,
            "price": price,
            "count": count
        ]
    }

    init(id: String,image: String, title: String, description: String, price: Int,count: Int) {
        self.id = id
        self.image = image
        self.title = title
        self.description = description
        self.price = price
        self.count = count
    }

    init?(dictionary: [String: Any], id: String) {
        guard let image = dictionary["image"] as? String,
              let title = dictionary["title"] as? String,
              let description = dictionary["description"] as? String,
              let price = dictionary["price"] as? Int,
             let count = dictionary["count"] as? Int
        
        else {
            return nil
        }
        self.id = id
        self.image = image
        self.title = title
        self.description = description
        self.price = price
        self.count = count
    }
}
