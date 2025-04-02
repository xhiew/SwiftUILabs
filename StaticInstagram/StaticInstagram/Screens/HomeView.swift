//
//  HomeView.swift
//  StaticInstagram
//
//  Created by xhiew on 1/4/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.iYellow.ignoresSafeArea()
                ScrollView {
                    ScrollView(.horizontal) {
                        LazyHStack(spacing: 16) {
                            Group {
                                AvatarView(isShowAddButton: true, isAddButtonOnTop: false, avatarImage: "mountain", note: "", name: "xhiew.21")
                                AvatarView(isShowAddButton: false, isAddButtonOnTop: false, avatarImage: "dog", note: "", name: "booker")
                                AvatarView(isShowAddButton: false, isAddButtonOnTop: false, avatarImage: "man", note: "", name: "tobilou")
                                AvatarView(isShowAddButton: false, isAddButtonOnTop: false, avatarImage: "mountain", note: "", name: "warrenhue")
                                AvatarView(isShowAddButton: false, isAddButtonOnTop: false, avatarImage: "jesus", note: "", name: "aothne_711")
                                AvatarView(isShowAddButton: false, isAddButtonOnTop: false, avatarImage: "girl", note: "", name: "pokemon")
                                AvatarView(isShowAddButton: false, isAddButtonOnTop: false, avatarImage: "playground", note: "", name: "playstation")
                            }.frame(width: 65, height: 65)
                        }
                        .padding(16)
                    }
                    .scrollIndicators(.hidden)
                    
                    LazyVStack {
                        NewsView()
                    }
                }
                .scrollIndicators(.hidden)
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    HStack {
                        Image("instagram")
                        Image(systemName: "chevron.down")
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    HStack(spacing: 16) {
                        Button {
                            // chuyển sang màn thông báo
                        } label: {
                            Image("heart")
                        }
                        
                        Button {
                            // chuyển sang màn nhắn tin
                        } label: {
                            Image("message")
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    HomeView()
}

struct AvatarView: View {
    let isShowAddButton: Bool
    let isAddButtonOnTop: Bool
    let avatarImage: String
    let note: String
    let name: String
    
    var body: some View {
        VStack {
            Image(avatarImage)
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .overlay {
                    Circle().stroke(lineWidth: 2)
                }
                .overlay(alignment: isAddButtonOnTop ? .topTrailing : .bottomTrailing) {
                    if isShowAddButton {
                        Circle()
                            .fill(Color.iBlue)
                            .frame(width: 20, height: 20)
                            .overlay(
                                Image(systemName: "plus")
                                    .foregroundStyle(.white)
                            )
                    }
                    
                    if !note.isEmpty {
                        Text(note)
                            .font(.caption2)
                            .monospaced()
                            .padding(4)
                            .padding(.horizontal, 4)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(.iYellow)
                            )
                            .overlay {
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(.black, lineWidth: 1)
                            }
                    }
                }
            Text(name).font(.caption).monospaced()
        }
    }
}

struct NewsView: View {
    var body: some View {
        VStack {
            HStack(alignment: .center , spacing: 4) {
                AvatarView(isShowAddButton: false, isAddButtonOnTop: false, avatarImage: "rodeo", note: "", name: "")
                    .frame(width: 50, height: 50)
                VStack(alignment: .leading) {
                    Text("warrenhue").font(.caption.bold())
                    Text("BOY OF THE YEAR ▶").font(.caption2.weight(.light))
                        .padding(.bottom, 4)
                }
                Spacer()
                Image(systemName: "ellipsis")
            }.padding(16)
        }
        
    }
}
