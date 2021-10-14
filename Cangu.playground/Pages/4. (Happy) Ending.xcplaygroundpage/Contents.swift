//: [Previous](@previous)

import Foundation
import AVFoundation
import SwiftUI
import PlaygroundSupport

//SOUNDTRACK
var audioPlayer: AVAudioPlayer!

//Play soundtrack
func playSound(_ fileName : String) {
    guard let soundURL = Bundle.main.url(forResource: fileName, withExtension: nil ) else {
        fatalError("Unable to find \(fileName) in bundle")
    }
    do {
        audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
        audioPlayer.numberOfLoops = -1
        audioPlayer.prepareToPlay()
        audioPlayer.play()
    } catch {
        print(error.localizedDescription)
    }
}

//HAI VINTO
struct Win:View{
    @State var Opacity1: CGFloat = 0
    @State var Opacity2: CGFloat = 1
    @State var OpacityVinto:Double=1
    var body: some View{
        ZStack{
            //Background
            Image(uiImage: UIImage(named: "bg2")!)
                .resizable()
                .scaledToFill()
                .frame(width: 561, height: 748, alignment: .center)
            
            //Objects
            Image(uiImage: UIImage(named: "win")!)
                .resizable()
                .scaledToFill()
                .frame(width: 550, height: 100, alignment: .center)
                .offset(y:85)
                .opacity(Opacity1)
                .onAppear{
                    let OpacityAnimation = Animation.easeInOut(duration: 1.5)
                    withAnimation (OpacityAnimation) {
                        Opacity1 = 1
                    }
                }
            
            //Text
            Image(uiImage: UIImage(named: "text-win")!)
                .resizable()
                .scaledToFill()
                .frame(width: 250, height: 100, alignment: .center)
                .offset(y: -235)
                .opacity(Opacity1)
                .onAppear{
                    let OpacityAnimation = Animation.easeInOut(duration: 1.5)
                    withAnimation (OpacityAnimation) {
                        Opacity1 = 1
                    }
                }
            //Pulsanti
            Button("⇨",action:NextWin1) //Next
                .frame(width: 40, height: 40, alignment: .center)
                .foregroundColor(.white)
                .background(.black)
                .font(.system(size: 24, weight: .bold))
                .cornerRadius(100)
                .padding(35)
                .position(x: 510, y: 700)
            
            Button(action: {
                if (audioPlayer?.volume == 1) {
                    audioPlayer?.volume = 0
                } else {
                    audioPlayer?.volume = 1
                }
            })/*PauseSoundtrack*/{
                VStack(spacing: 5) {
                    Image(systemName: "playpause.fill")
                    Text("Sound")
                        .font(.system(size: 10, weight: .bold))
                }
                .padding(.top, 10)
            }
                .frame(width: 60, height: 75, alignment: .top)
                .foregroundColor(.white)
                .background(.black)
                .font(.system(size: 20, weight: .bold))
                .cornerRadius(7.5)
                .offset(y: 355)
                .opacity(0.5)
        }
        .onAppear(perform: {
            playSound("intro.mp3")
        })
    }
}
//Next
func NextWin1(){ //mostra un'altra view
    PlaygroundPage.current.setLiveView(Win1())
}

//Terza Slide - Intro 2
struct Win1:View{
    @State var Opacity1: CGFloat = 0
    @State var Opacity2: CGFloat = 1
    
    var body: some View{
        ZStack{
            //Background
            Image(uiImage: UIImage(named: "bg3")!)
                .resizable()
                .scaledToFill()
                .frame(width: 561, height: 748, alignment: .center)
            
            //Text
            Image(uiImage: UIImage(named: "text3")!)
                .resizable()
                .scaledToFill()
                .frame(width: 440, height: 100, alignment: .center)
                .offset(y: -250)
                .opacity(Opacity1)
                .onAppear{
                    let OpacityAnimation = Animation.easeInOut(duration: 1)
                    withAnimation (OpacityAnimation) {
                        Opacity1 = 1
                    }
                }
            
            //Objects
            Image(uiImage: UIImage(named: "obj3")!)
                .resizable()
                .scaledToFill()
                .frame(width: 550, height: 100, alignment: .center)
                .offset(x:20, y:110)
            
            //Pulsanti
            /*Button("⇨",action:Win2) //Next
                .frame(width: 40, height: 40, alignment: .center)
                .foregroundColor(.white)
                .background(.black)
                .font(.system(size: 24, weight: .bold))
                .cornerRadius(100)
                .padding(35)
                .position(x: 510, y: 700)*/
            Button("⇦",action:PrevWin) //Prev
                .frame(width: 40, height: 40, alignment: .center)
                .foregroundColor(.white)
                .background(.black)
                .font(.system(size: 24, weight: .bold))
                .cornerRadius(100)
                .padding(35)
                .position(x: 50, y: 700)
                .opacity(0.5)
            Button(action: {
                if (audioPlayer?.volume == 1) {
                    audioPlayer?.volume = 0
                } else {
                    audioPlayer?.volume = 1
                }
            })/*PauseSoundtrack*/{
                VStack(spacing: 5) {
                    Image(systemName: "playpause.fill")
                    Text("Sound")
                        .font(.system(size: 10, weight: .bold))
                }
                .padding(.top, 10)
            }
                .frame(width: 60, height: 75, alignment: .top)
                .foregroundColor(.white)
                .background(.black)
                .font(.system(size: 20, weight: .bold))
                .cornerRadius(7.5)
                .offset(y: 355)
                .opacity(0.5)
        }
    }
}
func PrevWin(){ //mostra un'altra view
    PlaygroundPage.current.setLiveView(Win())
}

PlaygroundPage.current.setLiveView(Win())

//: [Next](@next)
