//
//  ArticlesViewController.swift
//  News
//
//  Created by ITUMAC03 on 30/07/23.
//  
//

import UIKit

class ArticlesViewController: UIViewController {
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter?.viewDidLoad()
    }

    // MARK: - Properties
    var presenter: ViewToPresenterArticlesProtocol?
    
    typealias GeneralCDataSource = UICollectionViewDiffableDataSource<GeneralSection, AnyHashable>
    typealias GeneralCSnapshot = NSDiffableDataSourceSnapshot<GeneralSection, AnyHashable>
    
    lazy var collectionView: UICollectionView = createCollectionView()
    lazy private var dataSource = self.configureDataSource()
}

extension ArticlesViewController: PresenterToViewArticlesProtocol{
    // TODO: Implement View Output Methods
    func onFetchArticleSuccess(article: [Article]) {
        print(article)
        var snap = self.dataSource.snapshot()
        snap.appendItems(article, toSection: .main)
        self.dataSource.apply(snap)
    }
}

extension ArticlesViewController {
    func setupUI() {
        view.backgroundColor = .white
        self.navigationItem.title = "Article"
        view.addSubview(collectionView)
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
            let cell: ArticleCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ArticleCell", for: indexPath) as! ArticleCell
            if let article = itemIdentifier as? Article {
                cell.setData(data: article)
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
        collectionView.register(ArticleCell.self, forCellWithReuseIdentifier: "ArticleCell")
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
extension ArticlesViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
    }
}
