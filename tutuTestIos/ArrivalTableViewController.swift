//
//  ArrivalTableViewController.swift
//  tutuTestIos
//
//  Created by Nick on 24.09.16.
//  Copyright © 2016 Nick. All rights reserved.
//

import UIKit
import SwiftyJSON

class ArrivalTableViewController: UITableViewController, UISearchResultsUpdating {
    
    var filterData = [Model]()
    var dataCT = [Model]()
    
    var numberOfCitiesFrom = 0
    var searchController: UISearchController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Настройка и создание UISearchController и UISearchBar
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        tableView.tableHeaderView = searchController.searchBar
        searchController.searchBar.placeholder = "Поиск по станции"
        
        loadJson()
        self.title = "Станции прибытия"
        
        //Спрятать клавиатуру
        self.hideKeyboardWhenTappedAround()
        
        print(dataCT.count)
        print()
        
    }
    
    //Парсим JSON
    func loadJson() {
        //Ссылка на локальный JSON файл
        if let url = Bundle.main.url(forResource: "allStations", withExtension: "json") {
            if let data = NSData(contentsOf: url) {
                do {
                    let json = JSON(data: data as Data)
                    
                    numberOfCitiesFrom = json["citiesTo"].count
                    print(numberOfCitiesFrom)
                    //Вытаскиваем значения из массива
                    for result in json["citiesFrom"].arrayValue {
                        //Вытаскиваем значения из массива внутри массива
                        for results in result["stations"].arrayValue{
                            let cityT = results["cityTitle"].stringValue
                            let stationT = results["stationTitle"].stringValue
                            let countryT = results["countryTitle"].stringValue
                            let districtT = results["districtTitle"].stringValue
                            let regionT = results["regionTitle"].stringValue
                            let dataCTV = Model(Country:countryT, City:cityT, Station:stationT, DistrictTitle: districtT, RegionTitle: regionT)
                            
                            dataCT.append(dataCTV)
                        }
                    }
                }
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive {
            return filterData.count
        }
        return dataCT.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! CustomTableViewCell
        
        if searchController.isActive {
            cell.countryTitleText?.text = filterData[indexPath.row].country
            cell.cityTitleText?.text = filterData[indexPath.row].city
            cell.stationTitleText?.text = filterData[indexPath.row].station
        }
        else {
            cell.countryTitleText?.text = dataCT[indexPath.row].country
            cell.cityTitleText?.text = dataCT[indexPath.row].city
            cell.stationTitleText?.text = dataCT[indexPath.row].station
        }
        return cell
    }
    
    //Поиск по массиву и внесение значений в новый пустой массив.
    func filterContentForSearchText(searchText: String) {
        filterData = dataCT.filter { stations in
            return stations.station.lowercased().contains(searchText.lowercased())
        }
        
        tableView.reloadData()
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchText: searchController.searchBar.text!)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            var indexPath = tableView.indexPathForSelectedRow!
            let destViewController: DetailTableViewController! = segue.destination as! DetailTableViewController
            let detail: [Model]
            detail = [dataCT[(indexPath as IndexPath).row]]
            destViewController.recivedDataCT = detail
            destViewController.title = dataCT[indexPath.row].station
        }
    }
    
    
}
