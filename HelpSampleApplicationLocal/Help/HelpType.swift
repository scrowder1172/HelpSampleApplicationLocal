//
// File: HelpType.swift
// Project: HelpSampleApplicationLocal
// 
// Created by SCOTT CROWDER on 3/14/25.
// 
// Copyright © Playful Logic Studios, LLC 2025. All rights reserved.
// 


import SwiftUI

enum HelpType: Identifiable, View {
    case peopleList, personEdit, personAdd, distribution, settings
    
    var id: Self { self }
    
    var title: String {
        switch self {
        case .peopleList:
            "People"
        case .personEdit:
            "Edit Person"
        case .personAdd:
            "New Person"
        case .distribution:
            "Age Distribution"
        case .settings:
            "Settings"
        }
    }
    
    var body: some View {
        HelpView(title: title, pages: pages)
    }
}

extension HelpType {
    var pages: [HelpPage] {
        switch self {
            case .peopleList:
                [
                    HelpPage(
                        image: Image(systemName: "person.3.fill"),
                        title: "Person List",
                        text: """
This is a list of all people in our organization.  You will be able to add, edit and delete individuals from the list. **Swipe to the right** to see more help for this screen.

If you wish to see more information about this organization, visit our website [CreaTech Solutions](https://www.createchsol.com)
"""
                    ),
                    HelpPage(
                        title: "Add Person",
                        text: """
Tap the **plus** button at the top of the screen to be presented with the form that will allow you to enter the name and age of the person you wish to add to the list.
You will not be able to add unless both a first and last name are provided.
"""
                    ),
                    HelpPage(
                        image: Image(.swipeDelete),
                        title: "Delete person",
                        text: """
To delete a person from the list, **swipe from the trailing edge of the row** until you see the *delete* button.  Then you can tap on it to remove the person from the list
"""
                    )
                ]
            case .personEdit:
                [HelpPage(
                    image: Image(systemName: "square.and.pencil"),
                    title: "Edit Person Info",
                    text: """
Exercitationem et quaerat et ipsa. Rem officiis mollitia temporibus possimus. Quibusdam eum repellat illum aut ea harum.
Quae iste deserunt non. Mollitia molestiae excepturi vitae accusamus modi quia harum. Quae fugit enim eaque enim reprehenderit molestiae placeat alias quasi. Est vel fugit corporis id maxime sequi aut quia minus.
Cum recusandae et commodi dolores velit est et quis hic. Nisi commodi voluptatem commodi nihil veritatis. Voluptas amet necessitatibus consectetur iste animi consequuntur vero ex sit. Molestiae ut dolor autem dolorum qui voluptas rerum dolorem. Nisi ipsa repellat ipsa sint eum laboriosam error nostrum.
Temporibus omnis molestiae. Possimus est vero aut dicta. Autem at ut. Natus similique et deserunt optio. Tempore perferendis laborum et aut dolor ipsa nam. Eum modi tempora maiores.
"""
                )]
            case .personAdd:
                [HelpPage(
                    image: Image(systemName: "person.fill"),
                    title: "Add a new person to the list",
                    text: """
Exercitationem et quaerat et ipsa. Rem officiis mollitia temporibus possimus. Quibusdam eum repellat illum aut ea harum.
Quae iste deserunt non. Mollitia molestiae excepturi vitae accusamus modi quia harum. Quae fugit enim eaque enim reprehenderit molestiae placeat alias quasi. Est vel fugit corporis id maxime sequi aut quia minus.
Cum recusandae et commodi dolores velit est et quis hic. Nisi commodi voluptatem commodi nihil veritatis. Voluptas amet necessitatibus consectetur iste animi consequuntur vero ex sit. Molestiae ut dolor autem dolorum qui voluptas rerum dolorem. Nisi ipsa repellat ipsa sint eum laboriosam error nostrum.
Temporibus omnis molestiae. Possimus est vero aut dicta. Autem at ut. Natus similique et deserunt optio. Tempore perferendis laborum et aut dolor ipsa nam. Eum modi tempora maiores.
"""
                )]
            case .distribution:
                [
                    HelpPage(
                        image: Image(systemName: "chart.bar.xaxis"),
                        title: "Age Distribution",
                        text: """
Exercitationem et quaerat et ipsa. Rem officiis mollitia temporibus possimus. Quibusdam eum repellat illum aut ea harum.
Quae iste deserunt non. Mollitia molestiae excepturi vitae accusamus modi quia harum. Quae fugit enim eaque enim reprehenderit molestiae placeat alias quasi. Est vel fugit corporis id maxime sequi aut quia minus.
Cum recusandae et commodi dolores velit est et quis hic. Nisi commodi voluptatem commodi nihil veritatis. Voluptas amet necessitatibus consectetur iste animi consequuntur vero ex sit. Molestiae ut dolor autem dolorum qui voluptas rerum dolorem. Nisi ipsa repellat ipsa sint eum laboriosam error nostrum.
Temporibus omnis molestiae. Possimus est vero aut dicta. Autem at ut. Natus similique et deserunt optio. Tempore perferendis laborum et aut dolor ipsa nam. Eum modi tempora maiores.
"""
                    )
                ]
            case .settings:
                [
                    HelpPage(image: Image(systemName: "gear"), title: "", text: "")
                ]
        }
    }
}
