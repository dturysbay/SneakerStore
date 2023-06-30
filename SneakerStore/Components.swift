//
//  Components.swift
//  SneakerStore
//
//  Created by Dinmukhambet Turysbay on 27.06.2023.
//

import SwiftUI

struct PrimaryButton: View{
    let label: String
    var body: some View{
        ZStack{
            RoundedRectangle(cornerRadius: 25)
                .frame(height: 60)
                .padding(.vertical,16)
                .background(.black)
                .foregroundColor(.white)
            Text(label)
            
        }
    }
}

struct CustomBackButton: View {
    let label: String
    let action: () -> Void

    var body: some View {
        Button(action: {
            self.action()
        }) {
            HStack {
                Image(systemName: "chevron.left")
                    .resizable()
                    .frame(width: 12, height: 18)
                    .foregroundColor(.black)
                Text(label)
                    .foregroundColor(.blue)
            }
        }
    }
}
