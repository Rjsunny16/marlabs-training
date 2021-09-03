public class MyAccountQueueable implements Queueable {
    public List<Account> accList ; 
    public MyAccountQueueable(List<Account> accList){
        this.accList = accList ;  
    }
    public void execute(QueueableContext context) {
        for(Account acc :accList){
            // Update the Account Name 
            acc.Name = acc.Name + 'marlabs';
        }
        update accList;
    }
}