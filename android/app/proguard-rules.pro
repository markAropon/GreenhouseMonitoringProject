# Remove log statements from the app
-assumenosideeffects class android.util.Log {
    public static *** d(...);
    public static *** v(...);
}
