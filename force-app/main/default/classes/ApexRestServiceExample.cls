@RestResource(urlMapping='https://wonderful-cloudy-237874-dev-ed.salesforce.com/services/data/v43.0/query?q=select+name+from+opportunity+where+accountid=+:accountId ')
global with sharing class ApexRestServiceExample{
    @HttpGet
    global static Account getAccount(){
        RestRequest request = RestContext.request;
        String accountId = request.requestURI.substringBetween('https://wonderful-cloudy-237874-dev-ed.salesforce.com/services/data/v43.0/query?q=select+name+from+opportunity+where+accountid=+:accountId ');
        system.debug(accountId);
        Account objAccount = [SELECT Name, OwnerId (SELECT Name, CloseDate, Amount FROM Opportunity WHERE Status="Closed Won" AND Date=Today()) FROM Account WHERE Id = :accountId ];
        return objAccount;
    }
}
