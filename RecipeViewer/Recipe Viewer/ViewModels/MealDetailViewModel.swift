//
//  MealDetailViewModel.swift
//  Recipe Viewer
//
//  Created by jae Lee on 8/26/24.
//

import Foundation


class MealDetailViewModel: ObservableObject {
    @Published var meal:Meal
    @Published var mealLoadError:Error?
    
    init(meal: Meal) {
        self.meal = meal
    }
    
    func getMealDetail() async {
        guard let id = meal.idMeal else {return}
        
        let url = "https://themealdb.com/api/json/v1/1/lookup.php?i=\(id)"
        NetworkingManager.sharedInstance.GET(urlString: url) { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let responseData):
                    do {
                        self.meal = try JSONDecoder().decode(MealsResponse.self, from: responseData.0).meals.sorted(by: {$0.strMeal ?? "" < $1.strMeal ?? "" }).first ?? self.meal
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
