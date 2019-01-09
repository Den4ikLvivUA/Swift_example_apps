//
//  ViewController.swift
//  WeatherApp
//
//  Created by Den4ikLvivUA on 1/4/19.
//  Copyright © 2019 Den4ikLvivUA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tempC: UITextField!
    @IBOutlet weak var cityLabel: UITextField!
    @IBOutlet weak var CountryObject: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

}

extension ViewController: UISearchBarDelegate {
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print(searchBar.text!)
        searchBar.resignFirstResponder()
        let urlString = "https://api.apixu.com/v1/current.json?key=cab1d6dc87de46e3a81111801190401&q=\(searchBar.text!)"
        let url = URL(string: urlString)
        var locationName : String?
        var temp_c : Double?
        var countryObject : String?
        print(url!)
        let task = URLSession.shared.dataTask(with: url!) {[weak self] (data, response, error) in
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                    as! [String : AnyObject]
                
                if let location = json["location"] {
                    locationName = location["name"] as? String
                }
                if let current = json ["current"]{
                    temp_c = current["temp_c"] as? Double
                }
                if let country = json ["location"]{
                    countryObject = country["country"] as? String
                }
                DispatchQueue.main.async {
                    self?.cityLabel.text = locationName
                    self?.tempC.text = String(temp_c ?? 0)
                    self?.CountryObject.text = countryObject
                }
            }
            catch let jsonError{
                print(jsonError)
            }
            
        }
        task.resume()
    }
}
/*
 http://api.apixu.com/v1/current.json?key=cab1d6dc87de46e3a81111801190401&q=Lviv
 {"location":
 {"name":"Lviv",
 "region":"",
 "country":"Ukraine",
 "lat":49.83,"lon":24.0,
 "tz_id":"Europe/Kiev",
 "localtime_epoch":1547002757,
 "localtime":"2019-01-09 4:59"},"current":
 {"last_updated_epoch":1547001912,"last_updated":"2019-01-09 04:45","temp_c":-7.0,"temp_f":19.4,"is_day":0,"condition":
 {"text":"Light snow","icon":"//cdn.apixu.com/weather/64x64/night/326.png","code":1213},
 "wind_mph":6.9,"wind_kph":11.2,"wind_degree":150,"wind_dir":"SSE",
 "pressure_mb":1001.0,"pressure_in":30.0,"precip_mm":0.8,"precip_in":0.03,
 "humidity":93,"cloud":100,"feelslike_c":-12.0,"feelslike_f":10.3,"vis_km":9.0,
 "vis_miles":5.0,"uv":0.0}}
 */
