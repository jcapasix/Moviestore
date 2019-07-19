//
//  CoreDateManager.swift
//  Data
//
//  Created by Jordan Capa on 7/19/19.
//  Copyright © 2019 Jordan Capa. All rights reserved.
//

import Foundation
import CoreData


public class CoreDateManager {
    
    public static let shared = CoreDateManager()
    
    let identifier: String  = "com.jcapasix.Data"
    let model: String       = "Data"
    
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        let messageKitBundle = Bundle(identifier: self.identifier)
        let modelURL = messageKitBundle!.url(forResource: self.model, withExtension: "momd")!
        let managedObjectModel =  NSManagedObjectModel(contentsOf: modelURL)
        
        
        let container = NSPersistentContainer(name: self.model, managedObjectModel: managedObjectModel!)
        container.loadPersistentStores { (storeDescription, error) in
            
            if let err = error{
                fatalError("❌ Loading of store failed:\(err)")
            }
        }
        
        return container
    }()
    
    
    public func saveMovies(movies: [MovieDataEntity]){
        
        let localMovies = self.getMovieDataEntities()
        
        //sincronizamos las peliculas locales
        if localMovies.count > 0{
            
            for movie in movies{
                if localMovies.filter({$0.id == movie.id}).isEmpty{
                    self.createMovie(movie: movie)
                }
            }
        }
            
        //guardamos las peliculas locales por primera vez
        else{
            for movie in movies{
                self.createMovie(movie: movie)
            }
        }
    }
    
    
    public func createMovie(movie: MovieDataEntity){
        
        let context = persistentContainer.viewContext
        let movieEntity = NSEntityDescription.insertNewObject(forEntityName: "MovieEntity", into: context) as! MovieEntity
        
        movieEntity.id = Int32(movie.id!)
        movieEntity.title = movie.title!
        movieEntity.overview = movie.overview!
        movieEntity.popularity = movie.popularity!
        movieEntity.release_date = movie.release_date!
        movieEntity.vote_count = Int32(movie.vote_count!)
        movieEntity.poster_path = movie.poster_path!
        movieEntity.backdrop_path = movie.backdrop_path!
        movieEntity.genre_ids = movie.genre_ids!
        
        do {
            try context.save()
            print("✅ Movie saved succesfuly")
            
        } catch let error {
            print("❌ Failed to create Movie: \(error.localizedDescription)")
        }
    }
    
    public func getMovieDataEntities() -> [MovieDataEntity]{
        let context = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<MovieEntity>(entityName: "MovieEntity")
        
        var moviesDataEntities: [MovieDataEntity] = []
        
        do{
            let movies = try context.fetch(fetchRequest)

            for movie in movies{
                moviesDataEntities.append(movie.toMovieDataEntity())
            }
        }catch let fetchErr {
            print("❌ Failed to fetch Movie:",fetchErr)
        }
        return moviesDataEntities
    }
    
    
    public func saveGenres(genres: [GenreDataEntity]){
        
        let localGenres = self.getGenreDataEntities()
        
        //sincronizamos las categorias locales
        if localGenres.count > 0{
            
            for genre in genres{
                if localGenres.filter({$0.id == genre.id}).isEmpty{
                    self.createGenre(genre: genre)
                }
            }
        }
        //guardamos las categorias locales por primera vez
        else{
            for genre in genres{
               self.createGenre(genre: genre)
            }
        }
    }
    
    
    public func createGenre(genre: GenreDataEntity){
        
        let context = persistentContainer.viewContext
        let genreEntity = NSEntityDescription.insertNewObject(forEntityName: "GenreEntity", into: context) as! GenreEntity
        
        genreEntity.id = Int32(genre.id!)
        genreEntity.name = genre.name!
        
        do {
            try context.save()
            print("✅ Genre saved succesfuly")
            
        } catch let error {
            print("❌ Failed to create Genre: \(error.localizedDescription)")
        }
    }
    
    public func getGenreDataEntities() -> [GenreDataEntity]{
        let context = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<GenreEntity>(entityName: "GenreEntity")
        
        var genreDataEntities: [GenreDataEntity] = []
        
        do{
            let genres = try context.fetch(fetchRequest)
            
            for genre in genres{
                genreDataEntities.append(genre.toGenreDataEntity())
            }
        }catch let fetchErr {
            print("❌ Failed to fetch Genre:",fetchErr)
        }
        return genreDataEntities
    }
    
}

extension MovieEntity{
    
    func toMovieDataEntity() -> MovieDataEntity{
        return MovieDataEntity(movieEntity: self)
    }
}

extension GenreEntity{
    func toGenreDataEntity() -> GenreDataEntity{
        return GenreDataEntity(genreEntity: self)
    }
}
