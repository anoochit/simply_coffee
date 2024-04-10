# Simply Coffee

**What it Does**

Simply Coffee is a mobile app designed to streamline the coffee ordering process at cafes. Customers can scan a QR code at their table using the app to launch a dedicated ordering screen. This eliminates the need to wait in line or flag down a waiter.

**Key Features**

- **QR Code Ordering:** Simplifies order placement by leveraging QR code technology. Customers scan the code with the Simply Coffee app to access the ordering screen.
- **App Linking:** Integrates seamlessly with the cafe's existing infrastructure. App Links ensure the ordering screen opens directly within the Simply Coffee app when users scan the QR code, eliminating the need for separate QR scanner apps.
- **Table Number Integration:** Captures the table number during the ordering process, allowing the cafe staff to efficiently locate and deliver orders.
- **(Optional) Menu Integration:** (Consider adding this if the app supports fetching the cafe's menu dynamically) Provides a dynamic menu display within the app, showcasing available coffee options and any potential customizations.

**App Links Setup**

To enable App Linking functionality, follow these steps:

1. **Generate a Statement File:** Use Google's App Links Statement List Generator and Tester tool ([https://developers.google.com/digital-asset-links/tools/generator](https://developers.google.com/digital-asset-links/tools/generator)) to create and download a statement file. This file verifies ownership of your app and website domain.
2. **Upload the Statement File:** Follow your cafe's website hosting provider's instructions on uploading the generated statement file to your website's root directory.
3. **Configure AppLink URL:** The recommended AppLink URL format is:
   ```
   http://<your_website_domain>/order?table=<table_number>
   ```
   Replace `<your_website_domain>` with your cafe's website address and `<table_number>` with a placeholder for the dynamic table number captured when the code is scanned.

**Testing App Links**

- **On a Physical Device (Android):**
  1. Connect your Android device to your development machine.
  2. Open a terminal window and navigate to your Android SDK tools directory.
  3. Run the following command, replacing `<app_package_name>` with the package name of your Simply Coffee app and `<applink_url>` with the actual AppLink URL you configured:
     ```bash
     adb shell 'am start -a android.intent.action.VIEW -c android.intent.category.BROWSABLE -d "<applink_url>" <app_package_name>'
     ```
- **Using a Simulator:**
  If you're using an Android emulator or simulator, you might need to adjust the `adb` command accordingly. Consult your development environment's documentation for specific instructions.
