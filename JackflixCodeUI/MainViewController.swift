//
//  ViewController.swift
//  JackflixCodeUI
//
//  Created by dopamint on 6/5/24.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {

    lazy var mainPosterImageView = {
        let view = UIImageView()
        view.backgroundColor = .lightGray
        view.contentMode = .scaleAspectFill
        view.image = UIImage(named: "명량")
        return view
    }()
    
    lazy var tagLabel = {
        let view = UILabel()
        return view
    }()
    
    lazy var playButton = {
        let view = UIButton()
        return view
    }()
    
    lazy var favoriteListButton = {
        let view = UIButton()
        return view
    }()
    
    lazy var hotContentLabel = {
        let view = UILabel()
        return view
    }()
    
    
    
    lazy var firstHotContentImage = {
        let view = UIImageView()
        view.backgroundColor = .lightGray
        view.contentMode = .scaleAspectFill
        view.image = UIImage(named: "베테랑")
        return view
    }()
    lazy var secondHotContentImage = {
        let view = UIImageView()
        view.backgroundColor = .lightGray
        view.contentMode = .scaleAspectFill
        view.image = UIImage(named: "부산행")
        return view
    }()
    lazy var thirdHotContentImage = {
        let view = UIImageView()
        view.backgroundColor = .lightGray
        view.contentMode = .scaleAspectFill
        view.image = UIImage(named: "아바타")
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "고래밥 님"
        
        
        
        configureHierachy()
        configureLayout()
        configureUI()
    }

    func configureHierachy() {
        view.addSubview(mainPosterImageView)
        view.addSubview(tagLabel)
        view.addSubview(playButton)
        view.addSubview(favoriteListButton)
        view.addSubview(hotContentLabel)
        view.addSubview(firstHotContentImage)
        view.addSubview(secondHotContentImage)
        view.addSubview(thirdHotContentImage)
    }
    
    func configureLayout() {
        
    }
    
    func configureUI() {
        
    }
}

