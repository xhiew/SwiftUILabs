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
                    
                    VStack(spacing: 24) {
                        NewsView(avatar: "rodeo", name: "warrenhue", subName: "BOY OF THE YEAR ▶", image: "dogs", caption: "may con cho lay !!!!")
                        NewsView(avatar: "rodeo", name: "xhiew.21", subName: "Last Performance ▶", image: "dog", caption: "OMG!!!!!!!!!!!")
                        NewsView(avatar: "rodeo", name: "coldzy", subName: "LOOP ▶", image: "mountain", caption: "neu em da loi vay thi, anh khong co van de gi")
                        NewsView(avatar: "rodeo", name: "tobilou", subName: "How to skin care 2020 ▶", image: "girl", caption: "🌝🌝🌝")
                        NewsView(avatar: "rodeo", name: "24k_right", subName: "RODEO ▶", image: "man", caption: "mot nua su that !!")
                        NewsView(avatar: "rodeo", name: "wxrdie", subName: "MOIEM ▶", image: "jesus", caption: "baby can u call me ?")
                        NewsView(avatar: "rodeo", name: "koi", subName: "Lonely Stonie ▶", image: "playground", caption: "...")
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
    let avatar: String
    let name: String
    let subName: String
    let image: String
    let caption: String
    
    var body: some View {
        VStack(spacing: .zero) {
            HStack(alignment: .center , spacing: 4) {
                AvatarView(isShowAddButton: false, isAddButtonOnTop: false, avatarImage: avatar, note: "", name: "")
                    .frame(width: 50, height: 50)
                VStack(alignment: .leading) {
                    Text(name).font(.caption.bold())
                    Text(subName).font(.caption2.weight(.light))
                        .padding(.bottom, 4)
                }
                Spacer()
                Image(systemName: "ellipsis")
            }.padding([.horizontal, .top], 16)
            
            Image(image)
                .resizable()
                .aspectRatio(1, contentMode: .fit)
                .padding(.horizontal, 16)
                .overlay {
                    Rectangle()
                        .stroke(.black, lineWidth: 2)
                        .padding(.horizontal, 16)
                }
            
            VStack(alignment: .leading, spacing: 8) {
                HStack(spacing: 16) {
                    Image("heart")
                    Image("comment")
                    Image("send")
                    Spacer()
                    Image("save")
                }
                
                Text("21 Likes").font(.callout.bold())
                
                Text(caption).font(.callout.weight(.light))
                
                Text("View all 11 comments").font(.caption)
                    .foregroundStyle(.gray)
            }.padding(.horizontal, 24).padding(.top, 16)
        }
    }
}
