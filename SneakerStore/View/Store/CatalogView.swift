//
//  CatalogView.swift
//  SneakerStore
//
//  Created by Dinmukhambet Turysbay on 28.06.2023.
//

import SwiftUI

struct CatalogView: View {
    @StateObject private var storeController = StoreController()
    let items: [Item] = [
        Item(id: UUID().uuidString,image: "shoe_dolce", title: "Dolce & Gabbana", description: "Кеды с принтом граффити", price: 1251, count: 1),
        Item(id: UUID().uuidString,image: "shoe_off_white", title: "Off-White", description: "Кроссовки Off-Court 3.0", price: 551,count: 1),
        Item(id: UUID().uuidString,image: "shoe_jordan", title: "Jordan", description: "Кеды с принтом граффити", price: 1251,count: 1),
        Item(id: UUID().uuidString,image: "shoe_jordan_white", title: "Item 2", description: "Кеды с принтом граффити", price: 1251,count: 1),
        Item(id: UUID().uuidString,image: "shoe_dolce", title: "Dolce & Gabbana", description: "Кеды с принтом граффити", price: 1251,count: 1),
        Item(id: UUID().uuidString,image: "shoe_off_white", title: "Off-White", description: "Кроссовки Off-Court 3.0", price: 551,count: 1),
        Item(id: UUID().uuidString,image: "shoe_jordan", title: "Jordan", description: "Кеды с принтом граффити", price: 1251,count: 1),
        Item(id: UUID().uuidString,image: "shoe_jordan_white", title: "Item 2", description: "Кеды с принтом граффити", price: 1251,count: 1)
    ]
    
    var body: some View {
            ScrollView {
                LazyVGrid(columns: Array(repeating: .init(.flexible()), count: 2), spacing: 20) {
                    ForEach(items) { item in
                        VStack {
                            Image(item.image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 100)
                                .cornerRadius(10)
                                .clipped()
                            HStack{
                                Text(item.title)
                                    .font(.system(size: 13,weight: .semibold))
                                    .padding(.top, 5)
                                Spacer()
                            }
                            .padding(.bottom,2)
                            HStack{
                                Text(item.description)
                                    .font(.system(size: 12))
                                    .foregroundColor(.secondary)
                                Spacer()
                            }
                            .padding(.bottom,2)
                            
                            HStack{
                                Text("\(item.price, specifier: "%.2f")$")
                                    .font(.system(size: 12,weight: .semibold))
                                Spacer()
                            }
                            .padding(.bottom,10)
                            
                            
                            Button(action: {
                                if self.storeController.addedItems.contains(item.id) {
                                    // Already added, so remove
                                    self.storeController.deleteItemFromCart(item) { error in
                                        if let error = error {
                                            print("Error removing item from cart: \(error)")
                                        }
                                    }
                                } else {
                                    // Not added, so add
                                    self.storeController.addItemToCart(item) { error in
                                        if let error = error {
                                            print("Error adding item to cart: \(error)")
                                        }
                                    }
                                }
                            }) {
                                Text(self.storeController.addedItems.contains(item.id) ? "Remove" : "Add to cart")
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical,10)
                                    .background(Color.black)
                                    .foregroundColor(Color.white)
                                    .clipShape(RoundedRectangle(cornerRadius: 25))
                            }
                            .padding(.horizontal,4)
                            .padding(.bottom,12)
                        }
                        .padding(.horizontal,4)
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(color: .gray, radius: 2, x: 0, y: 2)
                    }
                }
                .padding()
                .padding(.top,10)
            }
    }
}
