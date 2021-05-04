//
//  MovieUseCase.swift
//  BaseMVVM
//
//  Created by Hoang Hai on 03/05/2021.
//  Copyright © 2021 TonyHoang. All rights reserved.
//

import Foundation
import RxSwift

protocol MovieUserCaseType {
    func fetchPopularMovies() -> Observable<[Movie]>
}

class MovieUserCase: MovieUserCaseType {
    
    let movieInjector: MovieInjectorType
    
    init(injector: MovieInjectorType) {
        self.movieInjector = injector
    }
    
    func fetchPopularMovies() -> Observable<[Movie]> {
        // Do any thing before call api
        return movieInjector.getMovieService().fetchPopularMovies().asObservable()
    }
    
}
