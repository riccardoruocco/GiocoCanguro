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

//Prima Slide - Premi START
struct SplashScreen:View{
    @State private var showDetail = false
    @State var Opacity1: CGFloat = 0
    @State var Opacity2: CGFloat = 1
        
    var body: some View{
        ZStack{
            Image(uiImage: UIImage(named: "bg1")!)
                .resizable()
                .scaledToFill()
                .frame(width: 561, height: 748, alignment: .center)
            
            Image(uiImage: UIImage(named: "text1")!)
                .resizable()
                .scaledToFill()
                .frame(width: 490, height: 150, alignment: .center)
                .offset(y: -225)
            
            Button("START",action:Start)
                .frame(width: 150, height: 75, alignment: .center)
                .foregroundColor(.white)
                .background(.black)
                .font(.system(size: 30, weight: .bold))
                .cornerRadius(7.5)
                .padding(35)
                .offset(y: 220)
                .opacity(Opacity1)
                .onAppear{
                    let OpacityAnimation = Animation.easeInOut(duration: 3)
                    withAnimation (OpacityAnimation) {
                        Opacity1 = 1
                    }
                }
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
            playSound("sound.mp3")
        })
    }
}
//Next
func Start(){ //mostra un'altra view
    PlaygroundPage.current.setLiveView(Intro1())
}

//Seconda Slide - Intro 1
struct Intro1:View{
    @State var Opacity1: CGFloat = 0
    @State var Opacity2: CGFloat = 1
    @State var BgOpacity1: CGFloat = 0
    @State var BgOpacity2: CGFloat = 1
    
    var body: some View{
        ZStack{
            //Background
            Image(uiImage: UIImage(named: "bg2")!)
                .resizable()
                .scaledToFill()
                .frame(width: 561, height: 748, alignment: .center)
            
            //Text
            Image(uiImage: UIImage(named: "text2")!)
                .resizable()
                .scaledToFill()
                .frame(width: 490, height: 100, alignment: .center)
                .offset(y: -275)
                .opacity(Opacity1)
                .onAppear{
                    let OpacityAnimation = Animation.easeInOut(duration: 1.5)
                    withAnimation (OpacityAnimation) {
                        Opacity1 = 1
                    }
                }
            
            //Objects
            Image(uiImage: UIImage(named: "obj2")!)
                .resizable()
                .scaledToFill()
                .frame(width: 550, height: 100, alignment: .center)
                .offset(y:85)
            
            //Pulsanti
            Button("⇨",action:Next1) //Next
                .frame(width: 40, height: 40, alignment: .center)
                .foregroundColor(.white)
                .background(.black)
                .font(.system(size: 24, weight: .bold))
                .cornerRadius(100)
                .padding(35)
                .position(x: 510, y: 500)
            /*Button("⇦ ",action:Prev0) //Prev
                .frame(width: 40, height: 40, alignment: .center)
                .foregroundColor(.white)
                .background(.black)
                .font(.system(size: 24, weight: .bold))
                .cornerRadius(100)
                .padding(35)
                .position(x: 50, y: 700)
                .opacity(0.5)*/
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
//Prev
func Prev0(){ //mostra un'altra view
    PlaygroundPage.current.setLiveView(SplashScreen())
}
//Next
func Next1(){ //mostra un'altra view
    PlaygroundPage.current.setLiveView(Intro2())
}

//Terza Slide - Intro 2
struct Intro2:View{
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
            Button("⇨",action:Next2) //Next
                .frame(width: 40, height: 40, alignment: .center)
                .foregroundColor(.white)
                .background(.black)
                .font(.system(size: 24, weight: .bold))
                .cornerRadius(100)
                .padding(35)
                .position(x: 510, y: 500)
            Button("⇦",action:Prev1) //Prev
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
//Prev
func Prev1(){ //mostra un'altra view
    PlaygroundPage.current.setLiveView(Intro1())
}
//Next
func Next2(){ //mostra un'altra view
    PlaygroundPage.current.setLiveView(Intro3())
}

//Quarta Slide - Intro 3
struct Intro3:View{
    @State var Opacity1: CGFloat = 0
    @State var Opacity2: CGFloat = 1
    
    var body: some View{
        ZStack{
            //Background
            Image(uiImage: UIImage(named: "bg4")!)
                .resizable()
                .scaledToFill()
                .frame(width: 561, height: 748, alignment: .center)
            
            //Text
            Image(uiImage: UIImage(named: "text4")!)
                .resizable()
                .scaledToFill()
                .frame(width: 500, height: 130, alignment: .center)
                .offset(y: -250)
                .opacity(Opacity1)
                .onAppear{
                    let OpacityAnimation = Animation.easeInOut(duration: 1)
                    withAnimation (OpacityAnimation) {
                        Opacity1 = 1
                    }
                }
                        
            //Pulsanti
            Button("⇨",action:Next4) //Next
                .frame(width: 40, height: 40, alignment: .center)
                .foregroundColor(.white)
                .background(.black)
                .font(.system(size: 24, weight: .bold))
                .cornerRadius(100)
                .padding(35)
                .position(x: 510, y: 500)
            Button("⇦",action:Prev2) //Prev
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
//Prev
func Prev2(){ //mostra un'altra view
    PlaygroundPage.current.setLiveView(Intro2())
}
//Next
func Next4(){ //mostra un'altra view
    PlaygroundPage.current.setLiveView(Intro4())
}

//Quinta Slide - Intro 4
struct Intro4:View{
    @State var Opacity1: CGFloat = 0
    @State var Opacity2: CGFloat = 1
    
    var body: some View{
        ZStack{
            //Background
            Image(uiImage: UIImage(named: "bg5")!)
                .resizable()
                .scaledToFill()
                .frame(width: 561, height: 748, alignment: .center)
            
            //Text
            Image(uiImage: UIImage(named: "text5")!)
                .resizable()
                .scaledToFill()
                .frame(width: 500, height: 130, alignment: .center)
                .offset(y: -250)
                .opacity(Opacity1)
                .onAppear{
                    let OpacityAnimation = Animation.easeInOut(duration: 1)
                    withAnimation (OpacityAnimation) {
                        Opacity1 = 1
                    }
                }
                
            //Pulsanti
            Button("⇨",action:Next5) //Next
                .frame(width: 40, height: 40, alignment: .center)
                .foregroundColor(.white)
                .background(.black)
                .font(.system(size: 24, weight: .bold))
                .cornerRadius(100)
                .padding(35)
                .position(x: 510, y: 500)
            Button("⇦",action:Prev3) //Prev
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
//Prev
func Prev3(){ //mostra un'altra view
    PlaygroundPage.current.setLiveView(Intro4())
}
//Next
func Next5(){ //mostra un'altra view
    PlaygroundPage.current.setLiveView(Intro5())
}

//Terza Slide - Intro 2
struct Intro5:View{
    @State var Opacity1: CGFloat = 0
    @State var Opacity2: CGFloat = 1
    @State var BtOpacity1: CGFloat = 0
    @State var BtOpacity2: CGFloat = 1
    
    var body: some View{
        ZStack{
            //Background
            Image(uiImage: UIImage(named: "bg3")!)
                .resizable()
                .scaledToFill()
                .frame(width: 561, height: 748, alignment: .center)
            
            //Text
            Image(uiImage: UIImage(named: "text6")!)
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
            Image(uiImage: UIImage(named: "obj4")!)
                .resizable()
                .scaledToFill()
                .frame(width: 500, height: 100, alignment: .center)
                .offset(x:35, y:110)
            
            Button("FIGHT",action:FIGHT)
                .frame(width: 150, height: 75, alignment: .center)
                .foregroundColor(.white)
                .background(.black)
                .font(.system(size: 30, weight: .bold))
                .cornerRadius(7.5)
                .padding(35)
                .offset(y: 220)
                .opacity(BtOpacity1)
                .onAppear{
                    let OpacityAnimation = Animation.easeInOut(duration: 3)
                    withAnimation (OpacityAnimation) {
                        BtOpacity1 = 1
                    }
                }
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
//Prev
func FIGHT(){ //mostra un'altra view
    PlaygroundPage.current.setLiveView(SplashScreen())
}


PlaygroundPage.current.setLiveView(SplashScreen())


//: [Next](@next)
