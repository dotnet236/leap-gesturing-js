1. git clone https://github.com/dotnet236/leap-gesturing-js.git
2. npm install
3. coffee client.js


config.json Example:

```Javascript
{
  "gestures": [
    {
      "handCount": 1,
      "fingerCount": 1,
      "command": "osascript activate_application.scpt 'Google Chrome'"
    },
    {
      "handCount": 1,
      "fingerCount": 2,
      "command": "osascript activate_application.scpt 'iTerm'"
    }
  ]
}
```
