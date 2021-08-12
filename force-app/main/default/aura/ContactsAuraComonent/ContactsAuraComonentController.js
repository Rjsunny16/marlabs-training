({
    jsGetContacts : function(component, event, helper) {
        console.log('Came to getContacts');
        //const defaultContactsList = [{"Name": "Ram"}, {"Name": "Shyam"}];
        let apexMethod = component.get("c.getContacts");
        console.log('Got reference to Apex AuraEnabled Method');

        apexMethod.setCallback(this, function(response) {
            console.log('Came into JS callback method');
            let state = response.getState();
            if (state === "SUCCESS") {
                console.log('Success');
                console.log(response.getReturnValue());
                component.set("v.contacts", response.getReturnValue());
            } else {
                console.log('Failed: state: ' + state);
            }
        });
        console.log('Enqueuing apex method to be called');
        
        $A.enqueueAction(apexMethod);
        
        console.log('Coming out of getContacts');
    }, 
    jsSaveContact : function(component, event, helper) {
        console.log('Came into jsSaveContact');
        console.log(JSON.stringify(component.get("v.newContact")));

        let apexMethod = component.get("c.saveContact");
        console.log('Got reference to Apex AuraEnabled Method');

        apexMethod.setParams({'cont': component.get("v.newContact")});
        console.log('Set parameter on apex method');

        apexMethod.setCallback(this, function(response) {
            console.log('Came into JS callback method');
            let state = response.getState();
            if (state === "SUCCESS") {
                console.log('Success');
                let cont = response.getReturnValue();
                cont.Name = cont.FirstName + " " + cont.LastName;
                console.log(JSON.stringify(cont));
                
                //Add the new contact to the contacts list attribute on the component
                let contacts = component.get("v.contacts");
                contacts.push(cont);
                component.set("v.contacts", contacts);
            } else {
                console.log('Failed: state: ' + state);
            }
        });
        console.log('Enqueuing apex method to be called');
        
        $A.enqueueAction(apexMethod);
        
        console.log('Coming out of saveContact');
    }
})