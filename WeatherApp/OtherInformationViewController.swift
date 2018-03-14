//
//  OtherInformationViewController.swift
//  WeatherApp
//
//  Created by Азат Алекбаев on 12.03.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import UIKit

class OtherInformationViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        let weatherApi = WeatherAPIClient()
        let weatherEndPoint = WeatherEndPoint.forecast(city: "Kazan", state: "RU")
        weatherApi.weather(with: weatherEndPoint) { (either) in
            switch either {
            case .value(let forecastText):
                print(forecastText)
                
            case .error( let error):
                print(error)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WeatherItem", for: indexPath)
        
        return cell
    }
    
}
