//Singleton
//Private init ekleyince bu sınıfın icindeki obje haric baska bir obje turetemiyoruz.

import Foundation
import UIKit

class PlaceModel {
    static let sharedInstance = PlaceModel()
    var placeName = ""
    var placeType = ""
    var placeAtmosphere = ""
    var placeImage = UIImage()
    var placeLatitude = ""
    var placeLongitude = ""
    private init(){}
}
