//
//  SourcesViewController.swift
//  News
//
//  Created by ITUMAC03 on 30/07/23.
//  
//

import UIKit

class SourcesViewController: UIViewController {
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter?.viewDidLoad()
    }

    // MARK: - Properties
    var presenter: ViewToPresenterSourcesProtocol?
    
    typealias GeneralCDataSource = UICollectionViewDiffableDataSource<GeneralSection, AnyHashable>
    typealias GeneralCSnapshot = NSDiffableDataSourceSnapshot<GeneralSection, AnyHashable>
    
    lazy var collectionView: UICollectionView = createCollectionView()
    lazy private var dataSource = self.configureDataSource()
    private var searchBar: UISearchController = {
        let sb = UISearchController()
        sb.searchBar.placeholder = "Enter Source Title"
        sb.searchBar.searchBarStyle = .minimal
        return sb
    }()
}

extension SourcesViewController: PresenterToViewSourcesProtocol{
    // TODO: Implement View Output Methods
    func onFetchSourceSuccess(source: [Source]) {
        var snap = self.dataSource.snapshot()
        snap.appendItems(source, toSection: .main)
        self.dataSource.apply(snap)
    }
}

extension SourcesViewController {
    func setupUI() {
        self.view.backgroundColor = .white
        searchBar.searchResultsUpdater = self
        searchBar.delegate = self
        navigationItem.searchController = searchBar
        navigationItem.hidesSearchBarWhenScrolling = false
        
        self.view.addSubview(collectionView)
        navigationItem.backButtonTitle = ""
        collectionView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        collectionView.dataSource = dataSource
    }
    
    private func configureDataSource() -> GeneralCDataSource {
        let _dataSource = GeneralCDataSource(collectionView: collectionView) { collectionView, indexPath, itemIdentifier in
            let cell: SourceCell = collectionView.dequeueReusableCell(withReuseIdentifier: "SourceCell", for: indexPath) as! SourceCell
            if let source = itemIdentifier as? Source {
                cell.setData(source: source)
            }
            return cell
        }
        var snapshot = GeneralCSnapshot()
        snapshot.appendSections([.main])
        _dataSource.apply(snapshot)
        return _dataSource
    }
    
    private func createCollectionView() -> UICollectionView {
        let layout = createCompositionalLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(SourceCell.self, forCellWithReuseIdentifier: "SourceCell")
        collectionView.delegate = self
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }
    
    private func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { [unowned self] (_, _) -> NSCollectionLayoutSection? in
            return createLayout()
       }
    }
    
    func createLayout() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(100)))
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(100))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        group.contentInsets = .zero
        let section = NSCollectionLayoutSection(group: group)
        return section
    }
    
    func updateSearch(data: [Source], search: String) {
        var snap = self.dataSource.snapshot()
        if !snap.itemIdentifiers(inSection: .main).isEmpty {
            snap.deleteItems(snap.itemIdentifiers(inSection: .main))
        }
        var searchData: [Source] = []
        for element in data {
            if element.name.lowercased().contains(search.lowercased()) {
                searchData.append(element)
            }
        }
        snap.appendItems(searchData, toSection: .main)
        self.dataSource.apply(snap)
    }
}

extension SourcesViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
        if let item = self.dataSource.snapshot().itemIdentifiers[indexPath.row] as? Source {
            presenter?.didSelectRowAt(id: item.id)
        }
    }
}

extension SourcesViewController: UISearchResultsUpdating, UISearchControllerDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        
        let searchBar = searchController.searchBar
        if let query = searchBar.text, query.trimmingCharacters(in: .whitespaces) != "" {
            DispatchQueue.main.asyncAfter(deadline: .now()) {
                if let source = self.presenter?.source, !source.isEmpty {
                    self.updateSearch(data: source, search: query)
                    
                }
            }
        } else {
            self.presenter?.view?.onFetchSourceSuccess(source: self.presenter?.source ?? [])
        }
    }
    
    func didDismissSearchController(_ searchController: UISearchController) {
        self.presenter?.view?.onFetchSourceSuccess(source: self.presenter?.source ?? [])
    }
}
