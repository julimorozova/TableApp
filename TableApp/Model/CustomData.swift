//
//  CustomData.swift
//  TableApp
//
//  Created by Julia Morozova on 4. 2. 2026..
//


import UIKit

struct PostData {
    let id = UUID()
    let userName: String
    let userAvatar: String
    let postImage: String
    let date: String
    let description: String
}


struct MockDataService {


    static func getMockPosts() -> [PostData] {
        return [
            PostData(
                userName: "User name",
                userAvatar: "avatarTableCustom",
                postImage: "postImage1",
                date: "18.11.25",
                description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
            ),
            PostData(
                userName: "Traveler Alpha",
                userAvatar: "avatarTableCustom",
                postImage: "postImage2",
                date: "05.12.25",
                description: "Another example of description for the second cell to test UI scrolling."
            ),
            PostData(
                userName: "Photo Enthusiast",
                userAvatar: "avatarTableCustom",
                postImage: "postImage1",
                date: "01.01.26",
                description: "Happy New Year! Starting with a beautiful view from the woods."
            )
        ]
    }
}
