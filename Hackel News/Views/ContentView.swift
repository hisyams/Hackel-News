//
//  ContentView.swift
//  Hackel News
//
//  Created by Hisyam sanusi on 15/03/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            List(networkManager.posts) { post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack{
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
                            }
            .navigationTitle("Hackel News")
        }
        .onAppear {
            self.networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//let posts = [
//    Post(id: "1", title: "Hallo"),
//    Post(id: "2", title: "Ahlan"),
//    Post(id: "3", title: "Hola")
//]
