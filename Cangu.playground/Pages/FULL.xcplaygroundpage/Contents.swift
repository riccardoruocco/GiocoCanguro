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
                .position(x: 510, y: 700)
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
                .position(x: 510, y: 700)
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
                .position(x: 510, y: 700)
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
                .position(x: 510, y: 700)
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
    PlaygroundPage.current.setLiveView(Battle())
}

func Sconfitta(){
    PlaygroundPage.current.setLiveView(SchermataSconfitta())

}
func Rigioca(){
    PlaygroundPage.current.setLiveView(Battle())
}
func Vittoria(){
    PlaygroundPage.current.setLiveView(BattleBoss())
}

extension UIImage {
    func rotate(radians: Float) -> UIImage? {
        var newSize = CGRect(origin: CGPoint.zero, size: self.size).applying(CGAffineTransform(rotationAngle: CGFloat(radians))).size
        // Trim off the extremely small float value to prevent core graphics from rounding it up
        newSize.width = floor(newSize.width)
        newSize.height = floor(newSize.height)

        UIGraphicsBeginImageContextWithOptions(newSize, false, self.scale)
        let context = UIGraphicsGetCurrentContext()!

        // Move origin to middle
        context.translateBy(x: newSize.width/2, y: newSize.height/2)
        // Rotate around middle
        context.rotate(by: CGFloat(radians))
        // Draw the image at its center
        self.draw(in: CGRect(x: -self.size.width/2, y: -self.size.height/2, width: self.size.width, height: self.size.height))

        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return newImage
    }
}

struct Battle: View{
    
        @State var positionXCanguro: CGFloat = 250
        @State var positionYCanguro: CGFloat = 450
        @State var positionXBackground: CGFloat = 400
        @State var positionYBackground: CGFloat=374
        @State var positionXNemico: CGFloat=1000
        @State var positionYNemico: CGFloat = 450
        @State var OpacityKangooS:Double=1
        @State var OpacityKangooW:Double=0
        @State var OpacityKangooJ:Double=0
        @State var OpacityKangooP1:Double=0
        @State var OpacityKangooP2:Double=0
        @State var OpacitySoldato:Double=1
        @State var OpacityPerso:Double=0
        @State var NumeroNemici=3
        @State var isAlive=true
    
        let passo:CGFloat=70
    
    
    var body: some View{
        ZStack{
               Image(uiImage: UIImage(named: "sunset2")!)
                   .resizable()
                   .scaledToFill()
                   .frame(width: 561, height: 748, alignment: .center)
                   .position(x: positionXBackground, y: positionYBackground)
                
                   Image(uiImage: UIImage(named: "KangooS")!)
                       .resizable()
                       .scaledToFill()
                       .frame(width: 50, height: 100, alignment: .center)
                       .position(x: positionXCanguro, y:positionYCanguro)
                       .opacity(OpacityKangooS)
            
                    Image(uiImage: UIImage(named: "kangooWalk")!)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 100, alignment: .center)
                    .position(x: positionXCanguro, y: positionYCanguro)
                    .opacity(OpacityKangooW)
            
                    Image(uiImage: UIImage(named: "kangooJ")!)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 100, alignment: .center)
                    .position(x: positionXCanguro+2*passo, y: positionYCanguro-150)
                    .opacity(OpacityKangooJ)
                    .onChange(of: OpacityKangooJ){
                        newValue in OpacityKangooJ
                        positionXCanguro+=passo
                        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + DispatchTimeInterval.milliseconds(600)){
                                OpacityKangooJ=0
                                OpacityKangooS=1
                        }
                    }
            
                    
            
                    Image(uiImage: UIImage(named: "soldato")!)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 100, alignment: .center)
                    .position(x: positionXNemico, y: positionYCanguro)
                    .opacity(OpacitySoldato)
                    .onAppear {
//                        var secondo:Double=1
                        for i in 0...100{
                            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + DispatchTimeInterval.seconds(i)){
//                                positionXBackground+=10
                                positionXNemico-=passo
                                //positionXCanguro+=10
                            }
                        }
                    }
                    .onChange(of: positionXNemico){
                        newValue in positionXNemico
                        if(positionXNemico<0 && NumeroNemici>0){
                            NumeroNemici-=1
                            positionXCanguro-=200
                            positionXNemico=1000+positionXBackground
                        }
                        
                        if(((positionXNemico-positionXCanguro)<100 && (positionXNemico-positionXCanguro) > -20)&&((positionYNemico-positionYCanguro) == 0))
                        {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                                Sconfitta()
                            }
                        }
                        if(NumeroNemici==0){
                            Vittoria()
                        }

                    }
        
                  
                    
           
               VStack(alignment:.trailing){
                   Spacer()
                   Spacer()
                   Spacer()
                   Spacer()
                   HStack(spacing:20){
                       Button("Walk"){
                          
                           if(OpacityKangooS==1 && OpacityKangooJ==0){
                               OpacityKangooS=0
                               OpacityKangooW=1
                           }
                           else if(OpacityKangooJ==0){
                               OpacityKangooS=1
                               OpacityKangooW=0
                           }
                           if(OpacityKangooJ==0){
                               positionXBackground-=passo
                               positionXNemico-=passo
                           }
                           if(positionXBackground<200)
                           {
                               positionXBackground+=100
                           }
                           
                        
                           
                       }
                       .buttonStyle(.borderedProminent)
                       Button("Jump"){
                           if(OpacityKangooS==1 || OpacityKangooW==1 || OpacityKangooP1==1){
                               OpacityKangooS=0
                               OpacityKangooW=0
                               OpacityKangooJ=1
                               OpacityKangooP1=0

                           }
                           else{
                               OpacityKangooS=1
                               OpacityKangooJ=0
                           }
                       }
                       .buttonStyle(.borderedProminent)
                       

                   }
                   .offset(y: 200)
                   
                   Spacer()
                   Spacer()
                   Spacer()
                   
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
            playSound("gameplay.mp3")
        })
    }
}
//HAI PERSO
struct SchermataSconfitta:View{
    @State var Opacity1: CGFloat = 0
    @State var Opacity2: CGFloat = 1
    @State var OpacityPerso:Double=1
    var body: some View{
        ZStack{
            //Background
            Image(uiImage: UIImage(named: "bg2")!)
                .resizable()
                .scaledToFill()
                .frame(width: 561, height: 748, alignment: .center)
            
            //Objects
            Image(uiImage: UIImage(named: "lose")!)
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
            Image(uiImage: UIImage(named: "text-lose")!)
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
            Button("PLAY AGAIN"){
                Rigioca()
            }
            .frame(width: 250, height: 75, alignment: .center)
            .foregroundColor(.white)
            .background(.black)
            .font(.system(size: 30, weight: .bold))
            .cornerRadius(7.5)
            .padding(35)
            .offset(y: 220)
            
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

func RigiocaBoss(){
    PlaygroundPage.current.setLiveView(BattleBoss())
}
func VittoriaBoss(){
    PlaygroundPage.current.setLiveView(SchermataVittoria())
}

struct BattleBoss: View{
    
        @State  var positionXCanguro: CGFloat = 100
        @State  var positionYCanguro: CGFloat = 475
        @State  var positionXBackground: CGFloat = 400
        @State var positionYBackground: CGFloat=374
        @State  var OpacityKangooS:Double=1
        @State  var OpacityKangooW:Double=0
        @State  var OpacityKangooJ:Double=0
        @State  var OpacityKangooP1:Double=0
        @State  var OpacityKangooP2:Double=0
        @State var OpacityPerso:Double=0
        @State var PositionYBoss:Double=200

        @State var isAlive=true
    
        let passo:CGFloat=70
    
    
    var body: some View{
        ZStack{
               Image(uiImage: UIImage(named: "sunset2")!)
                   .resizable()
                   .scaledToFill()
                   .frame(width: 561, height: 748, alignment: .center)
                   .position(x: positionXBackground, y: positionYBackground)
                   
                
                   Image(uiImage: UIImage(named: "KangooS")!)
                       .resizable()
                       .scaledToFill()
                       .frame(width: 50, height: 100, alignment: .center)
                       .position(x: positionXCanguro, y:positionYCanguro)
                       .opacity(OpacityKangooS)
            
                    Image(uiImage: UIImage(named: "kangooWalk")!)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 100, alignment: .center)
                    .position(x: positionXCanguro, y: positionYCanguro)
                    .opacity(OpacityKangooW)
            
                    Image(uiImage: UIImage(named: "kangooJ")!)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 100, alignment: .center)
                    .position(x: positionXCanguro+2*passo, y: positionYCanguro-150)
                    .opacity(OpacityKangooJ)
                    .onChange(of: OpacityKangooJ){
                        newValue in OpacityKangooJ
                        positionXCanguro+=passo
                        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + DispatchTimeInterval.milliseconds(600)){
                                OpacityKangooJ=0
                                OpacityKangooS=1
                        }
                    }
            
                    Image(uiImage: UIImage(named: "kangooP1")!)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 100, alignment: .center)
                    .position(x: positionXCanguro, y: positionYCanguro)
                    .opacity(OpacityKangooP1)
                    .onChange(of: OpacityKangooP1){
                        newValue in OpacityKangooP1
                        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + DispatchTimeInterval.milliseconds(1500)){
                                OpacityKangooP1=0
                                OpacityKangooS=1
                        }
                    }
                    
                    Image(uiImage: UIImage(named: "kangooP2")!)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 100, alignment: .center)
                    .position(x: positionXCanguro, y: positionYCanguro)
                    .opacity(OpacityKangooP2)
            
                    Image(uiImage: UIImage(named: "boss")!)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100, alignment: .center)
                    .position(x: 450, y: PositionYBoss)
                    .onAppear {
//                        var secondo:Double=1
                        for i in 0...100{
                            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + DispatchTimeInterval.seconds(i)){
//                                positionXBackground+=10
                                PositionYBoss = PositionYBoss == 200 ? 180 : 200
                                //positionXCanguro+=10
                            }
                        }
                    }
                    
        
                  
                    
           
               VStack(alignment:.trailing){
                   Spacer()
                   Spacer()
                   Spacer()
                   Spacer()
                   HStack(spacing:20){
                       Button("Walk"){
                          
                           if(OpacityKangooS==1 && OpacityKangooJ==0){
                               OpacityKangooS=0
                               OpacityKangooW=1
                           }
                           else if(OpacityKangooJ==0){
                               OpacityKangooS=1
                               OpacityKangooW=0
                           }
                           if(OpacityKangooJ==0){
                               positionXBackground-=passo
                           }
                           if(positionXBackground<200)
                           {
                               positionXBackground+=100
                           }
                           
                        
                           
                       }
                       .buttonStyle(.borderedProminent)
                       Button("Jump"){
                           if(OpacityKangooS==1 || OpacityKangooW==1 || OpacityKangooP1==1){
                               OpacityKangooS=0
                               OpacityKangooW=0
                               OpacityKangooJ=1
                               OpacityKangooP1=0

                           }
                           else{
                               OpacityKangooS=1
                               OpacityKangooJ=0
                           }
                       }
                       .buttonStyle(.borderedProminent)
                       Button("Punch"){
                           if(OpacityKangooS==1)
                           {
                               OpacityKangooS=0
                               OpacityKangooP1=1
                               
                           }
                           else if(OpacityKangooP1==1){
                               OpacityKangooP1=0
                               OpacityKangooS=1
                           }
                         
                       }
                       .buttonStyle(.borderedProminent)

                   }
                   .offset(y: 200)
                   
                   Spacer()
                   Spacer()
                   Spacer()
                   
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
            playSound("gameplay.mp3")
        })
    }
}

//HAI PERSO
struct SchermataSconfittaBoss:View{
    @State var Opacity1: CGFloat = 0
    @State var Opacity2: CGFloat = 1
    @State var OpacityPerso:Double=1
    var body: some View{
        ZStack{
            //Background
            Image(uiImage: UIImage(named: "bg2")!)
                .resizable()
                .scaledToFill()
                .frame(width: 561, height: 748, alignment: .center)
            
            //Objects
            Image(uiImage: UIImage(named: "lose")!)
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
            Image(uiImage: UIImage(named: "text-lose")!)
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
            Button("PLAY AGAIN"){
                RigiocaBoss()
            }
            .frame(width: 250, height: 75, alignment: .center)
            .foregroundColor(.white)
            .background(.black)
            .font(.system(size: 30, weight: .bold))
            .cornerRadius(7.5)
            .padding(35)
            .offset(y: 220)
            
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


//HAI VINTO
struct SchermataVittoria:View{
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

PlaygroundPage.current.setLiveView(SplashScreen())

