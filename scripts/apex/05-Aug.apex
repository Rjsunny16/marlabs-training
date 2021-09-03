//Execute future method
/*
System.debug('Before invoking the future method');
MyFutureMethodClass.futureCall();
System.debug('After invoking the future method');
*/
//Start a batch jon
/*
System.debug('Before starting the batch job');
MyBatchClass mbc = new MyBatchClass();
Id jobId = Database.executeBatch(mbc, 20);
System.debug('After starting the batch job');
*/

// Start a Queueable
/*
List<Account> accList = [Select Id , Name from Account ];
ID jobID = System.enqueueJob(new AccountQueueableExample(accList));
System.debug('jobID'+jobID);
*/

// Start a Schedulable
/*
scheduledMerge m = new scheduledMerge();
String sch = '20 30 8 10 2 ?';
String jobID = system.schedule('Merge Job', sch, m);
*/