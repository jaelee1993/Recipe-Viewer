//
//  HomeContentViewModel.swift
//  Recipe Viewer
//
//  Created by jae Lee on 8/26/24.
//

import Foundation


class HomeContentViewModel: ObservableObject {
    @Published var meals:[Meal] = []
    @Published var mealLoadError:Error?
    
    
    func getMealsInDessert() async {
        let url = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"
        NetworkingManager.sharedInstance.GET(urlString: url) { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let responseData):
                    do {
                        self.meals = try JSONDecoder().decode(MealsResponse.self, from: responseData.0).meals.sorted(by: {$0.strMeal ?? "" < $1.strMeal ?? "" })
                        self.mealLoadError = nil
                    } catch {
                        print("Failed to convert string to JSON: \(error.localizedDescription)")
                        self.mealLoadError = error
                    }
                    
                case .failure(let error):
                    print(error.localizedDescription)
                    self.mealLoadError = error
                }
            }
            
        }
    }
}
