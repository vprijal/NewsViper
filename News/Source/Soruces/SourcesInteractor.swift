//
//  SourcesInteractor.swift
//  News
//
//  Created by ITUMAC03 on 30/07/23.
//  
//

import Foundation

class SourcesInteractor: PresenterToInteractorSourcesProtocol {

    // MARK: Properties
    var presenter: InteractorToPresenterSourcesProtocol?
    var category: String?
    var network: NetworkManager = NetworkManager.shared
    var source: [Source]?
    
    func loadSource() {
        self.network.request(route: .getSources(category: self.category ?? "")) { (result: Result<SourceResponse?, Error>) in
            switch result {
            case .success(let data):
                self.source = data?.sources
                self.presenter?.fetchSourceSuccess(source: data?.sources ?? [])
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    func retrieveSources(id: String) {
        guard let source = self.source?.first(where: {$0.id == id}) else {
            return
        }
        self.presenter?.findSourcesSuccess(source.id)
    }
}
