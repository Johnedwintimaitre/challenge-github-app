//
//  ViewController.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 29/09/21.
//

import UIKit

final class ListViewController: UIViewController {

    private lazy var listView: ListView = {
        let listView = ListView()
        listView.delegate = self
        return listView
    }()

    private let service = Service()

    init() {
        super.init(nibName: nil, bundle: nil)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {

        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "GitHub App 🐙"
    }

    override func viewDidAppear(_ animated: Bool) {

        service.fetchList { repositories in

            DispatchQueue.main.async {

                self.listView.updateView(with: repositories)
            }
        }

    }

    override func loadView() {
        self.view = listView
    }
}

extension ListViewController: ListViewProtocol {
    func navigationDetail(listItens: String) {
        let vc  = DetailViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
