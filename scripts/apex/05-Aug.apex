//Execute future method
/*
System.debug('Before invoking the future method');
MyFutureMethodClass.futureCall();
System.debug('After invoking the future method');
*/

//Start a batch jon
System.debug('Before starting the batch job');
MyBatchClass mbc = new MyBatchClass();
Id jobId = Database.executeBatch(mbc, 20);
System.debug('After starting the batch job');