public with sharing class ContactsController {
    public class CustomException extends Exception {}
    @AuraEnabled(Cacheable=true)
    public static List<Contact> getContacts() {
        List<Contact> contacts = [select id, name, email, CreatedDate from Contact order by CreatedDate desc];
        
        return (contacts);
    }

    @AuraEnabled
    public static Contact saveContact(Contact cont){
        insert (cont);

        return (cont);
    }
}