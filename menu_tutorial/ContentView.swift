//
//  ContentView.swift
//  menu_tutorial
//
//  Created by Jeff Jeong on 2020/10/07.
//

import SwiftUI


let myPets =  ["멍멍이 🐶", "야옹이 🐯", "찍찍이 🐹"]

struct ContentView: View {
    
    @State private var shouldShowAlert : Bool = false
    @State private var myText : String = ""
    @State private var selected : Int = 0
    
    var body: some View {
        NavigationView{
            VStack(spacing: 20){
                    Spacer()
                    Text("\(myPets[selected])")
                        .font(.system(size: 60))
                        .bold()
                    Text("우측 상단에 땡땡땡을 눌러주세요!")
                        .font(.title2)
                        .fontWeight(.black)
                    Spacer()
                    Spacer()
                }
                .padding()
                .navigationTitle("하이요")
                .toolbar(content: {
                    ToolbarItem(placement: .navigationBarTrailing, content: {
                        Menu {
                            Button(action: {
                                // 액션
                                print("오늘도 빡코딩 버튼클릭!")
                                shouldShowAlert = true
                                myText = "오늘도 빡코딩!"
                            }, label: {
                                // 라벨
                                Label("오늘도 빡코딩!" , systemImage: "flame.fill")
                            })
                            // 멀티 트레일링 클로저
                            Button {
                                print("집에서 쉬는 날 버튼클릭!")
                                shouldShowAlert = true
                                myText = "집에서 쉬는 날!"
                            } label : {
                                Label("집에서 쉬는 날!" , systemImage: "house.fill")
                            }
                            
                            Section {
                                // 멀티 트레일링 클로저
                                Button {
                                } label : {
                                    Label("새 파일 만들기" , systemImage: "doc")
                                }
                                Button {
                                } label : {
                                    Label("새 폴더 만들기" , systemImage: "folder")
                                }
                            }
                            Section {
                                // 멀티 트레일링 클로저
                                Button {
                                } label : {
                                    Label("파일 모두 삭제" , systemImage: "trash")
                                }
                            }
                            
                            Picker(selection: $selected, label: Text("애완동물 선택")){
                                ForEach(myPets.indices, id: \.self, content: { index in
                                    Text("\(myPets[index])").tag(index)
                                })
                            }
                            
                        } label: {
                            Circle().foregroundColor(Color.init(#colorLiteral(red: 0.8349713402, green: 0.1496438846, blue: 0.7993865004, alpha: 1)))
                                .frame(width: 50, height: 50)
                                .overlay(
                                    Label("더보기", systemImage: "ellipsis")
                                        .font(.system(size: 30))
                                        .foregroundColor(.white)
                                )
                            
                        } // 메뉴
                    })
                }) // toolbar
                .alert(isPresented: $shouldShowAlert, content: {
                    Alert(title: Text("알림"), message: Text("\(myText)"), dismissButton: .default(Text("확인")))
                })
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
