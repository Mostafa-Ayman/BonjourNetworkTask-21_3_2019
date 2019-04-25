//
//  ViewController.swift
//  BonjourNetworkTask 21_3_2019
//
//  Created by SAM on 3/21/19.
//  Copyright © 2019 com.connectus. All rights reserved.
//

import UIKit


class ViewController: UIViewController, NetServiceDelegate, NetServiceBrowserDelegate, UITableViewDelegate, UITableViewDataSource{
    
    
    @IBOutlet var tableViewServices: UITableView!
    
    let myType = "_connectus._tcp."    //cannot use http ?
    var service :NetService?
    var browser: NetServiceBrowser?
    var services = NSMutableArray()

    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //create service
        service = NetService(domain:"", type:myType, name:UIDevice.current.name, port: 0)
        if service != nil
        {
            service?.delegate = self
            service?.publish(options: .listenForConnections)  //publish and listen to TCP IPV4 and IPV6
        }
        else
        {
            print ("cannot publish the service\n")
            print ("cannot publish the service\n")
            
        }
        //search for searvice
        browser = NetServiceBrowser()
        browser?.delegate = self
        browser?.searchForServices(ofType: myType , inDomain:"")
        
    }

    
    func netServiceDidPublish(sender: NetService)
    {
        print("Published service with name \(sender.name)\n");
    }

    
    func netService(sender: NetService, didNotPublish errorDict: [String : NSNumber])
    {
        print("Published service did not publish due to \(errorDict)");
    }
    
    /* Sent to the NSNetService instance's delegate prior to resolving a service on the network. If for some reason the resolution cannot occur, the delegate will not receive this message, and an error will be delivered to the delegate via the delegate's -netService:didNotResolve: method.
     */
    func netServiceWillResolve(sender: NetService)
    {
        
    }
    
    /* Sent to the NSNetService instance's delegate when the instance's previously running publication or resolution request has stopped.
    */
    func netServiceDidStop(sender: NetService)
    {
        
    }
    
    
    /* Sent to the NSNetService instance's delegate when one or more addresses have been resolved for an NSNetService instance. Some NSNetService methods will return different results before and after a successful resolution. An NSNetService instance may get resolved more than once; truly robust clients may wish to resolve again after an error, or to resolve more than once.
     */
    func netServiceDidResolveAddress(_ sender: NetService)
    {
        
    }
    
    /* Sent to the NSNetService instance's delegate when an error in resolving the instance occurs. The error dictionary will contain two key/value pairs representing the error domain and code (see the NSNetServicesError enumeration above for error code constants).
     */
    func netService(sender: NetService, didNotResolve errorDict: [String : NSNumber])
    {
        
    }
    
    /* Sent to the NSNetService instance's delegate when the instance's previously running publication or resolution request has stopped.
     */
   
    
    func netServiceDidStop(_ sender: NetService) {
        
    }
    
    /* Sent to the NSNetService instance's delegate when the instance is being monitored and the instance's TXT record has been updated. The new record is contained in the data parameter.
     */
    func netService(_ sender: NetService, didUpdateTXTRecord data: Data)
    {
        
    }
    
    
 
    //MARK: - BrowserDelegate
    
    func netServiceBrowserWillSearch(_ browser: NetServiceBrowser)
    {
        print("Services will search\n");
    }
    
    /* Sent to the NSNetServiceBrowser instance's delegate when the instance's previous running search request has stopped.
     */
    func netServiceBrowserDidStopSearch(_ browser: NetServiceBrowser)
    {
        print("Services did stop search\n");
    }
    
    /* Sent to the NSNetServiceBrowser instance's delegate when an error in searching for domains or services has occurred. The error dictionary will contain two key/value pairs representing the error domain and code (see the NSNetServicesError enumeration above for error code constants). It is possible for an error to occur after a search has been started successfully.
     */
    func netServiceBrowser(_ browser: NetServiceBrowser, didNotSearch errorDict: [String : NSNumber])
    {
        print("services did not search due to \(errorDict)\n")
    }
    
    /* Sent to the NSNetServiceBrowser instance's delegate for each domain discovered. If there are more domains, moreComing will be YES. If for some reason handling discovered domains requires significant processing, accumulating domains until moreComing is NO and then doing the processing in bulk fashion may be desirable.
     */
    func netServiceBrowser(_ browser: NetServiceBrowser, didFindDomain domainString: String, moreComing: Bool)
    {
        print("\nhey foound stuff \(domainString)");
    }
    
    /* Sent to the NSNetServiceBrowser instance's delegate for each service discovered. If there are more services, moreComing will be YES. If for some reason handling discovered services requires significant processing, accumulating services until moreComing is NO and then doing the processing in bulk fashion may be desirable.
     */
    func netServiceBrowser(_ browser: NetServiceBrowser, didFind service: NetService, moreComing: Bool)
    {
        print("\nhey foound service \(service.name)");
        
        
        if !services.contains(service) && service.name != UIDevice.current.name {
            
            services.add(service);
           tableViewServices.reloadData()
            
        }
        
    }
    
    /* Sent to the NSNetServiceBrowser instance's delegate when a previously discovered domain is no longer available.
     */
    func netServiceBrowser(_ browser: NetServiceBrowser, didRemoveDomain domainString: String, moreComing: Bool)
    {
        
    }
    
    /* Sent to the NSNetServiceBrowser instance's delegate when a previously discovered service is no longer published.
     */
    func netServiceBrowser(_ browser: NetServiceBrowser, didRemove service: NetService, moreComing: Bool)
    {
        
    }
    
    
   /* override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return services.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell: NetworkCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath) as! NetworkCell
        
        
        let localService = services[indexPath.row] as! NetService
        
        cell.labelName.text = localService.name;
        
        return cell
    }*/
    
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return services.count;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell: NetworkCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath) as! NetworkCell;
        
        let localService = services[indexPath.row] as! NetService
        
        cell.labelName.text = localService.name;
        
        return cell;
    }
    }

