//
//  ViewController.swift
//  JackflixCodeUI
//
//  Created by dopamint on 6/5/24.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    lazy var backgroundView = {
        let view = UIImageView()
        view.image = UIImage(named: "background")
        return view
    }()

    lazy var mainPosterImageView = {
        let view = UIImageView()
        view.backgroundColor = .lightGray
        view.contentMode = .scaleToFill
        view.image = UIImage(named: "노량")
        return view
    }()
    
    lazy var tagLabel = {
        let view = UILabel()
        view.text = "응원하고픈 ∙ 흥미진진 ∙ 사극 ∙ 전투 ∙ 한국작품"
        view.font = .systemFont(ofSize: 13)
        view.textColor = .white
        view.textAlignment = .center
        return view
    }()
    
    lazy var playButton = {
        let view = UIButton()
        view.setBackgroundImage(UIImage(named: "play_normal"), for: .normal)
        view.setBackgroundImage(UIImage(named:"play_highlighted"), for: .highlighted)
        
        return view
    }()
    
    lazy var favoriteListButton = {
        let view = UIButton()
        view.backgroundColor = UIColor(named: "keyColor")
        view.setImage(UIImage(systemName: "plus"), for: .normal)
        view.setTitle(" 내가 찜한 리스트", for: .normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        view.tintColor = .white
        view.layer.cornerRadius = 6
        
        return view
    }()
    
    lazy var hotContentsLabel = {
        let view = UILabel()
        view.text = "지금 뜨는 콘텐츠"
        view.textColor = .white
        return view
    }()
    
    
    lazy var hotContentView1 = {
        let view = HotContentView()
        
        return view
    }()    
    
    lazy var hotContentView2 = {
        let view = HotContentView()
        
        return view
    }()
    
    lazy var hotContentView3 = {
        let view = HotContentView()
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHierachy()
        configureLayout()
        configureUI()
        playButton.addTarget(self, action: #selector(playButtonTapped), for: .touchUpInside)
    }

    func configureHierachy() {
        view.addSubview(backgroundView)
        
        view.addSubview(mainPosterImageView)
        view.addSubview(tagLabel)
        view.addSubview(playButton)
        view.addSubview(favoriteListButton)
        
        view.addSubview(hotContentsLabel)
        view.addSubview(hotContentView1)
        view.addSubview(hotContentView2)
        view.addSubview(hotContentView3)
    }
    
    func configureUI() {
        navigationItem.title = "이승현 님"
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 20),
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
    }
    
    @objc
    func playButtonTapped() {
        hotContentView1 = HotContentView()
        hotContentView2 = HotContentView()
        hotContentView3 = HotContentView()
        hotContentView1.top10Image.isHidden.toggle()
        hotContentView1.posterImageView.image = UIImage(named: MovieData.randomMovie())
        hotContentView1.setNeedsLayout()
        hotContentView1.setNeedsDisplay()
        hotContentView1.layoutIfNeeded()
        
        //        updateConstraints()
        //        updateConstraintsIfNeeded()
        //        needsUpdateConstraints()
        //        setNeedsUpdateConstraints()
        
        //        view.addSubview(hotContentView1)
        //        view.addSubview(hotContentView2)
        //        view.addSubview(hotContentView3)
    }
    
}

// MARK: - constraints
extension MainViewController {

    func configureLayout() {
        backgroundView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.verticalEdges.equalTo(mainPosterImageView)
        }
        
        mainPosterImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(100)
            make.leading.equalToSuperview().inset(15)
            make.trailing.equalToSuperview().inset(15)
            make.bottom.equalToSuperview().inset(300)
        }
        
        tagLabel.snp.makeConstraints { make in
            make.height.equalTo(21)
            make.leading.trailing.equalTo(mainPosterImageView)
            make.bottom.equalTo(playButton.snp.top).inset(-10)
        }
        
        playButton.snp.makeConstraints { make in
            make.height.equalTo(35)
            make.leading.equalTo(mainPosterImageView).inset(35)
            make.bottom.equalTo(mainPosterImageView).inset(20)
            make.width.equalTo(mainPosterImageView).multipliedBy(0.38)
        }
        
        favoriteListButton.snp.makeConstraints { make in
            make.height.equalTo(35)
            make.trailing.equalTo(mainPosterImageView).inset(35)
            make.bottom.equalTo(mainPosterImageView).inset(20)
            make.width.equalTo(mainPosterImageView).multipliedBy(0.38)
        }
        
        hotContentsLabel.snp.makeConstraints { make in
            make.top.equalTo(mainPosterImageView.snp.bottom).offset(10)
            make.leading.equalToSuperview().inset(10)
        }
        
        hotContentView1.snp.makeConstraints { make in
            make.top.equalTo(hotContentsLabel.snp.bottom).offset(10)
            make.trailing.equalTo(hotContentView2.snp.leading).offset(-10)
            make.width.equalTo(view.safeAreaLayoutGuide).multipliedBy(0.3)
            make.height.equalTo(view.safeAreaLayoutGuide).multipliedBy(0.25)
        }
        
        hotContentView2.snp.makeConstraints { make in
            make.top.equalTo(hotContentsLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.width.equalTo(view.safeAreaLayoutGuide).multipliedBy(0.3)
            make.height.equalTo(view.safeAreaLayoutGuide).multipliedBy(0.25)
        }
        
        hotContentView3.snp.makeConstraints { make in
            make.top.equalTo(hotContentsLabel.snp.bottom).offset(10)
            make.leading.equalTo(hotContentView2.snp.trailing).offset(10)
            make.width.equalTo(view.safeAreaLayoutGuide).multipliedBy(0.3)
            make.height.equalTo(view.safeAreaLayoutGuide).multipliedBy(0.25)
        }
    }
}
