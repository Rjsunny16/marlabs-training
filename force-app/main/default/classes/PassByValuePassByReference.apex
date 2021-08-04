public class PassByValuePassByReference {
    public static void PassByValuePassByReference() {
        Integer x = 20;
        List<String> colors = new List<String> {'red', 'green', 'yellow'};
        System.debug( 'before calling method' + 'x value' + x + 'colors' + colors);
        PassByValuePassByReference.checkWhichValueChange( x, colors);
        System.debug( 'After calling method' + 'x value' + x + 'colors' + colors);
    }

    public static void checkWhichValueChange( Integer n, List<String> color) {
        n=100;
        color.add(c);

    }

}