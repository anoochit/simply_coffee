# Simply Coffee

## AppLinks

Generate and save a statement file on your site to enable App Linking, or test an existing statement file.

- [Statement List Generator and Tester](https://developers.google.com/digital-asset-links/tools/generator)

Send a table number with URI in Applink URL

```
http://workshop-44305.web.app/order?table=A12
```

Use adb to test Applink

```bash
adb shell 'am start -a android.intent.action.VIEW -c android.intent.category.BROWSABLE -d "http://workshop-44305.web.app/order?table=A12"' net.redlinesoft.simplycoffee
```
