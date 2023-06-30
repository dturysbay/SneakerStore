//
//  OnboardingView.swift
//  SneakerStore
//
//  Created by Dinmukhambet Turysbay on 27.06.2023.
//

import SwiftUI

struct OnboardingView: View{
    @Binding var isOnboardingCompleted: Bool
    @State private var currentPage = 0
    let numberOfPages = 3
    let backgroundImages: [Image] = [Image("onboarding1"), Image("onboarding2"), Image("onboarding3")]
    let descriptions: [String] = ["Get all of your desired sneaker in one place.", "Get all of your desired sneaker in one place.", "Get all of your desired sneaker in one place."]
    let rectangleColors: [Color] = [.orange, .purple, .yellow]
    let rectangleGradients: [RadialGradient] = [.greenGradient,.purpleGradient,.brownGradient]
    
    var body: some View {
        if currentPage < numberOfPages{
            ZStack {
                backgroundImages[currentPage]
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Spacer()
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 25.0)
                            .fill(rectangleGradients[currentPage])
                            .frame(height: UIScreen.main.bounds.height * 0.35)

                        VStack {
                            HStack {
                                ForEach(0..<numberOfPages) { i in
                                    Circle()
                                        .fill(currentPage == i ? Color.white : Color.white.opacity(0.5))
                                        .frame(width: 10, height: 10)
                                        .padding(.horizontal,6)
                                        .onTapGesture {
                                            withAnimation {
                                                currentPage = i
                                            }
                                        }
                                }
                            }
                            .padding(.bottom,130)

                            Text("Fast shipping")
                                .font(.title)
                                .foregroundColor(Color.white)
                                .bold()
                                .padding(.top, -100)

                            Text(descriptions[currentPage])
                                .font(.subheadline)
                                .foregroundColor(Color.white)
                                .padding(.top, -70)

                            Button(action: {
                                withAnimation {
                                    currentPage = (currentPage + 1)
                                    if currentPage == numberOfPages{
                                        isOnboardingCompleted = true
                                    }
                                }
                            }) {
                                Text("Next")
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color.black)
                                    .foregroundColor(Color.white)
                                    .clipShape(RoundedRectangle(cornerRadius: 25))
                            }
                            .padding(.horizontal,32)
                            .padding(.bottom,32)
                        }
                    }
                }
            }
        }
    }
}
