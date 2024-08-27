//
//  MealDetailView.swift
//  Recipe Viewer
//
//  Created by jae Lee on 8/26/24.
//

import SwiftUI

struct MealDetailView: View {
    var meal:Meal
    @StateObject var viewModel:MealDetailViewModel
    
    init(meal: Meal) {
        self.meal = meal
        _viewModel = StateObject(wrappedValue: MealDetailViewModel(meal: meal))
    }
    
    var body: some View {
        ScrollView {
                Text(viewModel.meal.strMeal ?? "").fontDesign(.monospaced).fontWeight(.heavy).font(.largeTitle).frame(maxWidth: .infinity, alignment: .leading)
            
                Spacer()
                Spacer()
            
                GeometryReader { geometry in
                    AsyncImage(url: URL(string: meal.strMealThumb ?? "")) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: geometry.size.width, height: 300)
                            .clipped()
                    } placeholder: {
                        Color.gray
                            .frame(width: geometry.size.width, height: 300)
                    }
                }.frame(height: 300)
                
                Text("Ingrdients").font(.headline).frame(maxWidth: .infinity, alignment: .leading)
                getViewForIngridients()
                        
                Spacer()
                Spacer()
                
                Text("Instructions").font(.headline).frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
            
                Text(viewModel.meal.strInstructions ?? "INSTRUCTIONS").font(.body)
                
                Spacer()
                Spacer()
        }.task {
            await viewModel.getMealDetail()
        }
    }
    
    
    @ViewBuilder
    func getViewForIngridients() -> some View {
        
        if let ingridient = viewModel.meal.strIngredient1, !ingridient.isEmpty {
            HStack {
                Text(ingridient)
                Text(":")
                Text(viewModel.meal.strMeasure1 ?? "")
            }.frame(maxWidth: .infinity, alignment: .leading)
        }
        
        if let ingridient = viewModel.meal.strIngredient2, !ingridient.isEmpty {
            HStack {
                Text(ingridient)
                Text(":")
                Text(viewModel.meal.strMeasure2 ?? "")
            }.frame(maxWidth: .infinity, alignment: .leading)
        }
        if let ingridient = viewModel.meal.strIngredient3, !ingridient.isEmpty {
            HStack {
                Text(ingridient)
                Text(":")
                Text(viewModel.meal.strMeasure3 ?? "")
            }.frame(maxWidth: .infinity, alignment: .leading)
        }
        if let ingridient = viewModel.meal.strIngredient4, !ingridient.isEmpty {
            HStack {
                Text(ingridient)
                Text(":")
                Text(viewModel.meal.strMeasure4 ?? "")
            }.frame(maxWidth: .infinity, alignment: .leading)
        }
        if let ingridient = viewModel.meal.strIngredient5, !ingridient.isEmpty {
            HStack {
                Text(ingridient)
                Text(":")
                Text(viewModel.meal.strMeasure5 ?? "")
            }.frame(maxWidth: .infinity, alignment: .leading)
        }
        if let ingridient = viewModel.meal.strIngredient6, !ingridient.isEmpty {
            HStack {
                Text(ingridient)
                Text(":")
                Text(viewModel.meal.strMeasure6 ?? "")
            }.frame(maxWidth: .infinity, alignment: .leading)
        }
        if let ingridient = viewModel.meal.strIngredient7, !ingridient.isEmpty {
            HStack {
                Text(ingridient)
                Text(":")
                Text(viewModel.meal.strMeasure7 ?? "")
            }.frame(maxWidth: .infinity, alignment: .leading)
        }
        if let ingridient = viewModel.meal.strIngredient8, !ingridient.isEmpty {
            HStack {
                Text(ingridient)
                Text(":")
                Text(viewModel.meal.strMeasure8 ?? "")
            }.frame(maxWidth: .infinity, alignment: .leading)
        }
        if let ingridient = viewModel.meal.strIngredient9, !ingridient.isEmpty {
            HStack {
                Text(ingridient)
                Text(":")
                Text(viewModel.meal.strMeasure9 ?? "")
            }.frame(maxWidth: .infinity, alignment: .leading)
        }
        if let ingridient = viewModel.meal.strIngredient10, !ingridient.isEmpty {
            HStack {
                Text(ingridient)
                Text(":")
                Text(viewModel.meal.strMeasure10 ?? "")
            }.frame(maxWidth: .infinity, alignment: .leading)
        }
        if let ingridient = viewModel.meal.strIngredient11, !ingridient.isEmpty {
            HStack {
                Text(ingridient)
                Text(":")
                Text(viewModel.meal.strMeasure11 ?? "")
            }.frame(maxWidth: .infinity, alignment: .leading)
        }
        if let ingridient = viewModel.meal.strIngredient12, !ingridient.isEmpty {
            HStack {
                Text(ingridient)
                Text(":")
                Text(viewModel.meal.strMeasure12 ?? "")
            }.frame(maxWidth: .infinity, alignment: .leading)
        }
        if let ingridient = viewModel.meal.strIngredient13, !ingridient.isEmpty {
            HStack {
                Text(ingridient)
                Text(":")
                Text(viewModel.meal.strMeasure13 ?? "")
            }.frame(maxWidth: .infinity, alignment: .leading)
        }
        if let ingridient = viewModel.meal.strIngredient14, !ingridient.isEmpty {
            HStack {
                Text(ingridient)
                Text(":")
                Text(viewModel.meal.strMeasure14 ?? "")
            }.frame(maxWidth: .infinity, alignment: .leading)
        }
        if let ingridient = viewModel.meal.strIngredient15, !ingridient.isEmpty {
            HStack {
                Text(ingridient)
                Text(":")
                Text(viewModel.meal.strMeasure15 ?? "")
            }.frame(maxWidth: .infinity, alignment: .leading)
        }
        if let ingridient = viewModel.meal.strIngredient16, !ingridient.isEmpty {
            HStack {
                Text(ingridient)
                Text(":")
                Text(viewModel.meal.strMeasure16 ?? "")
            }.frame(maxWidth: .infinity, alignment: .leading)
        }
        if let ingridient = viewModel.meal.strIngredient17, !ingridient.isEmpty {
            HStack {
                Text(ingridient)
                Text(":")
                Text(viewModel.meal.strMeasure17 ?? "")
            }.frame(maxWidth: .infinity, alignment: .leading)
        }
        if let ingridient = viewModel.meal.strIngredient18, !ingridient.isEmpty {
            HStack {
                Text(ingridient)
                Text(":")
                Text(viewModel.meal.strMeasure18 ?? "")
            }.frame(maxWidth: .infinity, alignment: .leading)
        }
        if let ingridient = viewModel.meal.strIngredient19, !ingridient.isEmpty {
            HStack {
                Text(ingridient)
                Text(":")
                Text(viewModel.meal.strMeasure19 ?? "")
            }.frame(maxWidth: .infinity, alignment: .leading)
        }
        if let ingridient = viewModel.meal.strIngredient20, !ingridient.isEmpty {
            HStack {
                Text(ingridient)
                Text(":")
                Text(viewModel.meal.strMeasure20 ?? "")
            }.frame(maxWidth: .infinity, alignment: .leading)
        }
      
        
      
    }
}



#Preview {
    MealDetailView(meal: Meal())
}
