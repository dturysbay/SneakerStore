//
//  CartView.swift
//  SneakerStore
//
//  Created by Dinmukhambet Turysbay on 30.06.2023.
//

import SwiftUI

struct CartView: View {
    @StateObject private var storeController = StoreController()
    @State private var cartItems = [Item]()
    @State private var quantities = [String: Int]()
    @State private var isLoading: Bool = false
    var body: some View {
        Group{
            if !cartItems.isEmpty{
                List {
                    ForEach(cartItems) { item in
                        HStack{
                            Image(item.image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 140, height: 140)
                                .cornerRadius(10)
                                .clipped()
                                .padding(.trailing,16)
                            VStack(alignment: .leading){
                                Text(item.title)
                                    .font(.system(size: 13,weight: .semibold))
                                Text(item.description)
                                    .font(.system(size: 12,weight: .thin))
                                Text("$\(item.price)")
                                    .font(.system(size: 12,weight: .semibold))
                                    .padding(.bottom,16)
                                HStack{
                                    Button(action: {
                                        self.quantities[item.id]! += 1
                                        isLoading = true
                                        storeController.updateItemQuantity(item.id, self.quantities[item.id, default: 1]) { error in
                                            if let error = error {
                                                print("Error updating quantity: \(error)")
                                                print("Error updating quantity: \(error.localizedDescription)")
                                            }else {
                                                print("Quantity successfully updated.")
                                            }
                                            self.isLoading = false
                                        }
                                    }) {
                                        Image(systemName: "plus")
                                    }.disabled(isLoading)
                                    
                                    Text("\(self.quantities[item.id, default: 1])")
                                        .padding(.horizontal,8)
                                    
                                    Button(action: {
                                        if self.quantities[item.id, default: 1] > 1 {
                                            self.quantities[item.id, default: 1] -= 1
                                            isLoading = true
                                            storeController.updateItemQuantity(item.id, self.quantities[item.id, default: 1]) { error in
                                                if let error = error {
                                                    print("Error updating quantity: \(error)")
                                                } else {
                                                    print("Quantity successfully updated.")
                                                }
                                                self.isLoading = false
                                            }
                                        }
                                    }) {
                                        Image(systemName: "minus")
                                    }.disabled(isLoading)
                                }
                                .padding(.vertical,10)
                                .frame(width: 166)
                                .background(Color.black)
                                .clipShape(RoundedRectangle(cornerRadius: 25))
                                .foregroundColor(.white)

                            }
                        }
                        .padding(.vertical,10)
                        .padding(.horizontal,16)
                    }
                    .onDelete(perform: deleteItems)
                }
                .listStyle(.plain)
            }else{
                ZStack{
                   Image("curve")
                        .resizable()
                        .scaledToFit()
                        .edgesIgnoringSafeArea(.all)
                        .padding(.top, -400)
                                
                    
                    VStack{
                        Text("Cart is empty")
                            .font(.system(size: 28,weight: .semibold))
                            .padding(.bottom,16)
                        Text("Find interesting models in the Catalog.")
                            .font(.system(size: 17,weight: .thin))
                    }
                }
            }
        }
        .onAppear {
            storeController.getCartItems { items, error in
                if let items = items {
                    self.cartItems = items
                    for item in items {
                        self.quantities[item.id] = item.count
                    }
                } else if let error = error {
                    print("Error getting cart items: \(error)")
                }
            }
        }
    }
    
    func deleteItems(at offsets: IndexSet) {
        for index in offsets {
            let item = cartItems[index]
            storeController.deleteItemFromCart(item) { error in
                if let error = error {
                    print("Error deleting item: \(error)")
                } else {
                    cartItems.remove(at: index)
                }
            }
        }
    }
}
