//
// FavoritesView.swift : Favorites
//
// Copyright © 2025 Auburn University.
// All Rights Reserved.

// Added NavigationStack and if statement to view
// favorites
import SwiftUI

struct FavoritesView: View {
    
    @EnvironmentObject var favorites: FavoritesViewModel
    
    var favoriteCities: [CityModel] {
        favorites.cities.filter{ $0.isFavorite }
    }
    
    var favoriteHobbies: [HobbyModel] {
        favorites.hobbies.filter {
            $0.isFavorite
        }
    }
    
    var favoriteBooks: [BookModel] {
        favorites.books.filter {
            $0.isFavorite
        }
    }
    
    var body: some View {
        NavigationStack {
            List {
                if !favoriteCities.isEmpty {
                    Section("Cities") {
                        ForEach(favoriteCities) {
                            city in CityCardView(city: city)
                        }
                    }
                }
                if !favoriteHobbies.isEmpty {
                    Section("Hobbies") {
                        ForEach(favoriteHobbies) {
                            hobby in HobbyRowView(hobby: hobby)
                        }
                    }
                }
                if !favoriteBooks.isEmpty {
                    Section("Books") {
                        ForEach(favoriteBooks) {
                            book in BookRowView(book: book)
                        }
                    }
                }
                if favoriteCities.isEmpty && favoriteHobbies.isEmpty && favoriteBooks.isEmpty {
                    ContentUnavailableView("There are no favorites yet", systemImage: "heart")
                }
            }
            .navigationTitle("Favorites")
        }
    }
}
#Preview {
    FavoritesView()
}
