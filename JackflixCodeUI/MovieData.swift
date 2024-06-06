//
//  MovieData.swift
//  JackflixCodeUI
//
//  Created by dopamint on 6/6/24.
//

import Foundation

struct MovieData {
    static let movieList = ["극한직업", "노량", "더퍼스트슬램덩크", "도둑들", "명량", "밀수", "범죄도시3", "베테랑", "부산행", "서울의봄", "스즈메의문단속", "신과함께인과연", "신과함께죄와벌", "아바타", "아바타물의길", "알라딘", "암살", "어벤져스엔드게임", "오펜하이머", "육사오", "해운대", "택시운전사", "콘크리트유토피아"]
    
    static func randomMovie() -> String {
        movieList.randomElement() ?? "노량"
    }
}
