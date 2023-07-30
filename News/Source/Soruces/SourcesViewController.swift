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
        self.view.addSubview(collectionView)
        navigationItem.backButtonTitle = " "
        self.navigationItem.title = "Sources"
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
}

extension SourcesViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
    }
}
