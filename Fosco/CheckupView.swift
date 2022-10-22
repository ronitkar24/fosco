//
//  CheckupView.swift
//  Fosco
//
//  Created by Papai on 10/22/22.
//

import SwiftUI
import Foundation
import SwiftUI
import Combine
import AVFoundation
class AudioRecorder: ObservableObject {
    let objectWillChange = PassthroughSubject<AudioRecorder, Never>()
    
    var recording = false {
            didSet {
                objectWillChange.send(self)
            }
        }
    
    var audioRecorder: AVAudioRecorder!
    
    func startRecording() {
        let recordingSession = AVAudioSession.sharedInstance()
        do {
                    try recordingSession.setCategory(.playAndRecord, mode: .default)
                    try recordingSession.setActive(true)
        } catch {
            print("Failed to set up recording session")
        }
        let documentPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let audioFilename = documentPath.appendingPathComponent("\(Date().toString(dateFormat: "dd-MM-YY_'at'_HH:mm:ss")).m4a")
        
        
        let settings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 12000,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]
        do {
            audioRecorder = try AVAudioRecorder(url: audioFilename, settings: settings)
            audioRecorder.record()
            recording = true
        } catch {
            print("Could not start recording")
        }
        
    }
    
    func stopRecording() {
            audioRecorder.stop()
            recording = false
        }
    
}

struct CheckupView: View {
    @State private var checkUpDone = false
    @State var timeRemaining = 4
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var checkUpIP = false
    @State private var checkUpState = 0
    @State private var pitting = false
    @ObservedObject var audioRecorder: AudioRecorder
    var body: some View {
        ScrollView {
            Spacer().frame(height: 1)
            if !checkUpIP {
                if checkUpDone{
                    OldDate()
                } else {
                    VStack {
                        Image("thumbs")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 240)
                            .padding()
                        Text("You're doing great!").font(.title3).italic().padding(.bottom)
                        
                        Text("Your last checkup was").font(.title)
                        Text("Oct 21, 2022").font(.largeTitle).fontWeight(.bold)
                        Text("1 day ago").italic().font(.title3).padding(.bottom)
                        
                        Text("Your next checkup is").font(.title)
                        Text("Oct 28, 2022").font(.largeTitle).fontWeight(.bold)
                        Text("6 days from now").italic().font(.title3).padding(.bottom)
                        
                        Button(action: {
                            withAnimation {
                                checkUpIP = true
                            }
                        }) {
                            Text("Manual Override")
                                .fontWeight(.medium)
                                .foregroundColor(Color.red)
                                .padding(8)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.red, lineWidth: 1)
                                )
                        }
                    }
                }
            } else {
                
                switch checkUpState{
                case 0:
                    VStack(alignment: .center) {
                        Spacer().frame(height: 200)
                        Image("doc").resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 120)
                            .padding()
                        Text("Welcome to your weekly checkup!").font(.title2).fontWeight(.bold)
                        Text("Please find your way to a quiet room when you can relax. This self-checkup will take 5-10 minutes of your time.")
                            .multilineTextAlignment(.center)
                        Button(action: {
                            withAnimation {
                                checkUpState = 1
                            }
                        }) {
                            Text("Continue")
                                .fontWeight(.medium)
                                .foregroundColor(Color.green)
                                .padding(8)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.green, lineWidth: 1)
                                )
                        }
                    }.padding()
                case 1:
                    VStack(alignment: .center) {
                        Spacer().frame(height: 200)
                        Image("doc").resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 120)
                            .padding()
                        Text("Overview").font(.title2).fontWeight(.bold)
                        Text("This self-checkup will walk you through:\n- Checking your weight\n- Feeling for edema (excess fluid)\n- Checking for fluid in the lungs")
                            .multilineTextAlignment(.leading)
                        Button(action: {
                            withAnimation {
                                checkUpState = 2
                                timeRemaining = 4
                            }
                        }) {
                            Text("Continue")
                                .fontWeight(.medium)
                                .foregroundColor(Color.green)
                                .padding(8)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.green, lineWidth: 1)
                                )
                        }
                    }.padding()
                case 2:
                    VStack(alignment: .center) {
                        Spacer().frame(height: 200)
                        Image("doc").resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 120)
                            .padding()
                        Text("Step 1: Checking Weight").font(.title2).fontWeight(.bold)
                        Text("Fetching weight data from Apple Health...\n\nDid you know, sudden increases in weight can be associated with volume overload?")
                            .multilineTextAlignment(.center)
                            .onReceive(timer){ _ in
                                if timeRemaining > 0 {
                                    timeRemaining -= 1
                                }else{
                                    checkUpState = 3
                                }
                            }
                        Button(action: {
                            withAnimation {
                                checkUpState = 3
                            }
                        }) {
                            Text("Continue")
                                .fontWeight(.medium)
                                .foregroundColor(Color.white)
                                .padding(8)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.white, lineWidth: 1)
                                )
                        }
                    }.padding()
                case 3:
                    VStack(alignment: .center) {
                        Spacer().frame(height: 200)
                        Image("doc").resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 120)
                            .padding()
                        Text("Step 1: Checking Weight").font(.title2).fontWeight(.bold)
                        Text("You weighed")
                            .multilineTextAlignment(.center)
                        Text("210.4 lbs")
                            .multilineTextAlignment(.center).font(.largeTitle).fontWeight(.bold)
                        Text("This was a decrease from the last week. This does NOT suggest volume overload!")
                            .multilineTextAlignment(.center)
                        Button(action: {
                            withAnimation {
                                checkUpState = 4
                            }
                        }) {
                            Text("Continue")
                                .fontWeight(.medium)
                                .foregroundColor(Color.green)
                                .padding(8)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.green, lineWidth: 1)
                                )
                        }
                    }.padding()
                case 4:
                    VStack(alignment: .center) {
                        Spacer().frame(height: 180)
                        
                        Image("edema0").resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 220)
                            .padding()
                        Text("Step 2: Feeling for Edema").font(.title2).fontWeight(.bold)
                        Text("Edema is extra, unwanted fluid in parts of your body. If you have edema, you may see swelling around your ankles, legs, wrists, and forearms.")
                            .multilineTextAlignment(.center)
                        Button(action: {
                            withAnimation {
                                checkUpState = 5
                            }
                        }) {
                            Text("Continue")
                                .fontWeight(.medium)
                                .foregroundColor(Color.green)
                                .padding(8)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.green, lineWidth: 1)
                                )
                        }
                    }.padding()
                case 5:
                    VStack(alignment: .center) {
                        Spacer().frame(height: 160)
                        
                        Image("edema").resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 220)
                            .padding()
                        Text("Step 2: Feeling for Edema").font(.title2).fontWeight(.bold)
                        Text("You also may find that pressing into your skin causes it to stay pressed or 'pitted.' This is called 'Pitting Edema.'")
                            .multilineTextAlignment(.center)
                        Button(action: {
                            withAnimation {
                                checkUpState = 6
                            }
                        }) {
                            Text("Continue")
                                .fontWeight(.medium)
                                .foregroundColor(Color.green)
                                .padding(8)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.green, lineWidth: 1)
                                )
                        }
                    }.padding()
                case 6:
                    VStack(alignment: .center) {
                        Spacer().frame(height:20)
                        
                        Image("thumbedema").resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 220)
                            .padding()
                        Text("Step 2: Feeling for Edema").font(.title2).fontWeight(.bold)
                        Text("Press deep into the skin of your LEFT shin with your thumb as shown above. After 5 seconds, remove your thumb. Wait another 5 seconds. \n\nDid your skin still have a pit like shown below?")
                            .multilineTextAlignment(.center)
                        HStack {
                            Button(action: {
                                withAnimation {
                                    pitting = false
                                    checkUpState = 7
                                    
                                }
                            }) {
                                Text("No")
                                    .fontWeight(.medium)
                                    .foregroundColor(Color.green)
                                    .padding(8)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color.green, lineWidth: 1)
                                    )
                            }
                            Button(action: {
                                withAnimation {
                                    pitting = true
                                    checkUpState = 7
                                    
                                }
                            }) {
                                Text("Yes")
                                    .fontWeight(.medium)
                                    .foregroundColor(Color.red)
                                    .padding(8)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color.red, lineWidth: 1)
                                    )
                            }
                        }
                        Image("edema3").resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 220)
                            .padding()
                    }.padding()
                case 7:
                    VStack(alignment: .center) {
                        Spacer().frame(height: 20)
                        
                        Image("thumbedema").resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 220)
                            .padding()
                        Text("Step 2: Feeling for Edema").font(.title2).fontWeight(.bold)
                        Text("Press deep into the skin of your RIGHT shin this time with your thumb as shown above. After 5 seconds, remove your thumb. Wait another 5 seconds. \n\nDid your skin still have a pit like shown below?")
                            .multilineTextAlignment(.center)
                        HStack {
                            Button(action: {
                                withAnimation {
                                    checkUpState = 8
                                    
                                }
                            }) {
                                Text("No")
                                    .fontWeight(.medium)
                                    .foregroundColor(Color.green)
                                    .padding(8)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color.green, lineWidth: 1)
                                    )
                            }
                            Button(action: {
                                withAnimation {
                                    pitting = true
                                    checkUpState = 8
                                    
                                }
                            }) {
                                Text("Yes")
                                    .fontWeight(.medium)
                                    .foregroundColor(Color.red)
                                    .padding(8)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color.red, lineWidth: 1)
                                    )
                            }
                            
                        }
                        Image("edema3").resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 220)
                            .padding()
                    }.padding()
                case 8:
                    VStack(alignment: .center) {
                        Spacer().frame(height: 160)
                        
                        Image("edema").resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 220)
                            .padding()
                        Text("Step 2: Feeling for Edema").font(.title2).fontWeight(.bold)
                        if pitting {
                            Text("You reported to have pitting edema in at least one of your legs. This may suggest trouble controlling your volume status.")
                                .multilineTextAlignment(.center)
                        }else{
                            Text("You didn't report any sign of pitting edema. This is a sign of healthy volume control.")
                                .multilineTextAlignment(.center)
                        }
                        
                        
                        Button(action: {
                            withAnimation {
                                checkUpState = 9
                            }
                        }) {
                            Text("Continue")
                                .fontWeight(.medium)
                                .foregroundColor(Color.green)
                                .padding(8)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.green, lineWidth: 1)
                                )
                        }
                    }.padding()
                case 9:
                    VStack(alignment: .center) {
                        Spacer().frame(height: 120)
                        
                        Image("lungy").resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 220)
                            .padding()
                        Text("Step 3: Listening to the Lungs").font(.title2).fontWeight(.bold)
                        Text("People who are volume overloaded have so much pressure in their areties that water can leak into the lungs. You can hear this when listening to a person's breathing.\n\nFluid in the lungs will sound like crackles.")
                            .multilineTextAlignment(.center)
                        
                        Button(action: {
                            withAnimation {
                                checkUpState = 10
                            }
                        }) {
                            Text("Continue")
                                .fontWeight(.medium)
                                .foregroundColor(Color.green)
                                .padding(8)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.green, lineWidth: 1)
                                )
                        }
                    }.padding()
                case 10:
                    VStack(alignment: .center) {
                        Spacer().frame(height: 50)
                        
                        Image("demor").resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 240)
                            .padding()
                        Text("Step 3: Listening to the Lungs").font(.title2).fontWeight(.bold)
                        Text("If you have heavy clothes, please remove them. Also make sure you're in a quiet room.\n\nHold your phone against your chest aso shown above. Make sure that the BOTTOM of your phone is touching your chest.")
                            .multilineTextAlignment(.center)
                        
                        Button(action: {
                            withAnimation {
                                checkUpState = 11
                            }
                        }) {
                            Text("Continue")
                                .fontWeight(.medium)
                                .foregroundColor(Color.green)
                                .padding(8)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.green, lineWidth: 1)
                                )
                        }
                    }.padding()
                case 11:
                    VStack(alignment: .center) {
                        Spacer().frame(height: 120)
                        
                        Image("lungy").resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 220)
                            .padding()
                        Text("Step 3: Listening to the Lungs").font(.title2).fontWeight(.bold)
                        Text("When you are in position, press the record button and take DEEP breaths for 15 seconds.")
                            .multilineTextAlignment(.center)
                        
                        if audioRecorder.recording == false {
                            Button(action: {
                                audioRecorder.startRecording()
                            }) {
                                Image(systemName: "circle")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 100, height: 100)
                                    .clipped()
                                    .foregroundColor(.red)
                                    .padding(.bottom, 40)
                            }
                        } else {
                            Button(action: {
                                audioRecorder.stopRecording()
                                checkUpState = 12
                                timeRemaining = 4
                            }) {
                                Image(systemName: "circle.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 100, height: 100)
                                    .clipped()
                                    .foregroundColor(.red)
                                    .padding(.bottom, 40)
                            }
                        }
                    }.padding()
                    
                case 12:
                    VStack(alignment: .center) {
                        Spacer().frame(height: 120)
                        
                        Image("lungy").resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 220)
                            .padding()
                        Text("Step 3: Listening to the Lungs").font(.title2).fontWeight(.bold)
                        Text("Processing lung sounds using signal processing software...")
                            .multilineTextAlignment(.center)
                            .onReceive(timer){ _ in
                                if timeRemaining > 0 {
                                    timeRemaining -= 1
                                }else{
                                    checkUpState = 13
                                }
                            }
                        Button(action: {
                            withAnimation {
                                checkUpState = 13
                            }
                        }) {
                            Text("Continue")
                                .fontWeight(.medium)
                                .foregroundColor(Color.white)
                                .padding(8)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.white, lineWidth: 1)
                                )
                        }
                    }.padding()
                case 13:
                    VStack(alignment: .center) {
                        Spacer().frame(height: 120)
                        
                        Image("lungy").resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 220)
                            .padding()
                        Text("Step 3: Listening to the Lungs").font(.title2).fontWeight(.bold)
                        Text("No crackles or other abnormal lung sounds were recorded! This is a sign of proper fluid control.")
                            .multilineTextAlignment(.center)
                        
                        
                        Button(action: {
                            withAnimation {
                                checkUpState = 14
                            }
                        }) {
                            Text("Continue")
                                .fontWeight(.medium)
                                .foregroundColor(Color.green)
                                .padding(8)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.green, lineWidth: 1)
                                )
                        }
                    }.padding()
                case 14:
                    VStack(alignment: .center) {
                        Spacer().frame(height: 120)
                        
                        Image("doc").resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 220)
                            .padding()
                        Text("Conclusion").font(.title2).fontWeight(.bold)
                        Text("Thank you for completing your weekly self-checkup! You are on the right path to being in control of your own physical health.")
                            .multilineTextAlignment(.center)
                        if pitting {
                            Text("\nYou did note that there was some pitting edema in your legs. If this swelling doesn't go away or if you have any other feelings of pain or discomfort because of it, we recommend you consult a physician.")
                                .multilineTextAlignment(.center)
                        }else{
                            Text("\nThere were no signs of volume overload today! If, however, you do feel any discomfort or pain, or are otherwise worried about your condition, please consult a physician.")
                                .multilineTextAlignment(.center)
                        }
                        
                        Button(action: {
                            withAnimation {
                                checkUpState = 0
                                checkUpIP = false
                                checkUpDone = true
                            }
                        }) {
                            Text("Continue")
                                .fontWeight(.medium)
                                .foregroundColor(Color.green)
                                .padding(8)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.green, lineWidth: 1)
                                )
                        }
                    }.padding()
                default:
                    Text("default")
                }
                
            }
        }
    }
}

struct CheckupView_Previews: PreviewProvider {
    static var previews: some View {
        CheckupView(audioRecorder: AudioRecorder())
    }
}
