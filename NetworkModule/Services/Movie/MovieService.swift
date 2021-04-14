//
//  MovieService.swift
//  BaseMVVM
//
//  Created by Hoang Hai on 10/04/2021.
//  Copyright © 2021 TonyHoang. All rights reserved.
//

import Foundation
import RxSwift

public protocol MovieServiceType {
    func fetchPopularMovies() -> Single<[Movie]>
}

public class MovieService {
    
    public let network: Network
    
    public init(network: Network) {
        self.network = network
    }
    
}

extension MovieService: MovieServiceType {
    
    public func fetchPopularMovies() -> Single<[Movie]> {
        return network.rx.request(MovieAPIRouter.movies)
            .validate()
            .responseDecodable(of: MovieResult.self)
            .map { $0.results }
            .mapToDomain()
    }
    
}
