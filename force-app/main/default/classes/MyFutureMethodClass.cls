public class MyFutureMethodClass {
    @future
    public static void futureCall() {
        System.debug('MyFutureMethodClass.futureCall() ran at: ' + System.now());
    }

    @future
    public static void anotherFutureCall() {
        System.debug('MyFutureMethodClass.anotherFutureCall() ran at: ' + System.now());
    }
}