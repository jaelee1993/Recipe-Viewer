//
//  ContentView.swift
//  Recipe Viewer
//
//  Created by jae Lee on 8/20/24.
//

import SwiftUI

struct HomeContentView: View {
    @StateObject var viewModel = HomeContentViewModel()
    
    var body: some View {
        ZStack {
            List(viewModel.meals, id: \.self) { meal in
                NavigationLink(destination: MealDetailView(meal: meal)) {
                    HStack(spacing: 50) {
                        AsyncImage(url: URL(string: meal.strMealThumb ?? "")) { image in
                            image
                                .resizable()
                                .frame(width: 90, height: 90)
                                .aspectRatio(contentMode: .fit)
                        } placeholder: {
                            Color.gray
                                .frame(width: 90, height: 90)
                        }
                        Text(meal.strMeal ?? "Empty Meal Name")
                            .font(.body)
                    }
                    .frame(height: 100)
                    .padding(.vertical, 10)
                }
            }
            
            if let error = viewModel.mealLoadError {
                VStack {
                    Text(error.localizedDescription)
                        .font(.callout)
                    Button("try again") {
                        Task {
                            await viewModel.getMealsInDessert()
                        }
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
        }
        .task {
            await viewModel.getMealsInDessert()
        }
    }
}

#Preview {
    HomeContentView()
}
