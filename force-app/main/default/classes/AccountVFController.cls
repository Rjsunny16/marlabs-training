public class AccountVFController {


public Account acct {get; set;}
public String acctSearchParm {get; set;}
public String errorMessage {get; set;}
public List<Contact> contacts {get; set;}
public Contact cont {get; set;}
public PageReference search() {
    String searchTerm = '%' + acctSearchParm + '%';
    try {
        acct = [select Name, Id from Account where name like :searchTerm limit 1];
        errorMessage = null;
    } catch (Exception e) {
        errorMessage = e.getMessage();
        acct = null;
        
    }
    return null;
}
public PageReference getContact() {
     try {
         contacts = [select Name, Phone, Email, Title from Contact where AccountId = :acct.id];
         if (contacts.size() > 0 ) {
             cont = contacts.get(0);
         }
         errorMessage = null;
    } catch (Exception e) {
        errorMessage = e.getMessage();
        acct = null;
        cont = null;
    }
    return null;
}

}