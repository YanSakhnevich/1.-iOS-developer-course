import UIKit


//MARK: Task1

// 1.1
class TV {
    var info: (Firm: String,Model: String)
    var isOn: Bool
    enum CurrentChannel: String {
        case natgeo
        case mtv
        case discovery
        case netflix
        case drive
    }
    var getCurrentChannel: CurrentChannel
    init( info: (Firm: String,Model: String), isOn: Bool, getCurrentChannel: CurrentChannel) {
        self.info = info
        self.isOn = isOn
        self.getCurrentChannel = getCurrentChannel
        
    }
    
    func whatsOnTV() {
        if self.isOn {
            print("""
\(getCurrentChannel.rawValue) is on my "\(self.info.Firm) \(self.info.Model)" now
""")
        } else {
            print("TV is off")
        }
    
}
}

// 1.2
var currenState = TV(info: (Firm: "LG", Model: "A500"), isOn: true, getCurrentChannel: TV.CurrentChannel.discovery)

currenState.whatsOnTV()

// 1.3

currenState = TV(info: (Firm: "Sony", Model: "30"), isOn: false, getCurrentChannel: TV.CurrentChannel.mtv)
//1.4

currenState.whatsOnTV()


// MARK: Task2


 class AnotherTV: TV {
     var settings: Settings
     
     init(info: (Firm: String,Model: String), isOn: Bool, getCurrentChannel: CurrentChannel, settings: Settings) {
         self.settings = settings
       super.init(info: info, isOn: isOn, getCurrentChannel: getCurrentChannel)
      }
     
     struct Settings {       // Не совсем понятно, для чего нужно вкладывать структуру с двумя свойствами в класс, когда можно было просто поместить их в новый класс без создания структуры :)
         var volume: Float16
         var isRGB: Bool
     }
     
     override func whatsOnTV() {
         
         switch self.settings.volume {
         case 0...1:
             if self.isOn {
                 if self.settings.isRGB {
                     print("""
     \(getCurrentChannel.rawValue) currently running on my "\(self.info.Firm) \(self.info.Model)" in color and the volume is \(settings.volume)
     """)
                 } else {
     print("""
     \(getCurrentChannel.rawValue) currently running on my "\(self.info.Firm) \(self.info.Model)" in black/white and the volume is \(settings.volume)
     """)
                 }

             } else {
                 print("TV is off")
             }
         default:
             print("Please set a correct volume settings")
         }
 }
 }

 var newCurrentState = AnotherTV.init(info: (Firm: "LG", Model: "A500"), isOn: true, getCurrentChannel: TV.CurrentChannel.discovery, settings: AnotherTV.Settings(volume: 1.0, isRGB: false))

 newCurrentState.whatsOnTV()

