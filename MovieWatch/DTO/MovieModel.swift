//
//  MovieModel.swift
//  MovieWatch
//
//  Created by Tamanna Khan on 2022-11-23.
//

import Foundation

struct MovieModel: Codable, Identifiable {
    
    var id: Int
    var title: String
    var description: String
    var image: String
    var toWatch: Bool
    var rating: Int
    
}

extension MovieModel{
    static let sampleMovie: [MovieModel] = [
    
        MovieModel(id: 1, title: "Harry Potter Sorcerer's stone", description: "In this amazing film based on JK Rowling's hit story, Harry Potter learns on his 11th birthday that he is the orphaned son of two powerful wizards and that he possesses magical powers. A whole new world opens up for Harry when he starts at Hogwarts School of Witchcraft and Wizardry. He learns the flying sport of Quidditch and plays an exciting game of living chess pieces on his journey against the evil wizard who is out to destroy him.", image: "https://prod.cdn.bbaws.net/TDC_Blockbuster_-_Production/604/796/WB-2101_po-reg-medium_orig.jpg", toWatch: true, rating: 3)
    
    
    ]
}
