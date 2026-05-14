#!/usr/bin/env python3

# This is opencode generated btw

import json
import sys
import urllib.request
import urllib.parse

CITY = "Caracas"
ICONS = {
    "sunny": "☀",
    "clear": "☀",
    "partly cloudy": "⛅",
    "cloudy": "☁",
    "overcast": "☁",
    "mist": "🌫",
    "fog": "🌫",
    "haze": "🌫",
    "patchy rain nearby": "🌦",
    "patchy rain possible": "🌦",
    "light rain shower": "🌦",
    "light rain": "🌧",
    "moderate or heavy rain with thunder": "⛈",
    "light rain with thunder": "⛈",
    "thundery outbreaks possible": "⛈",
    "thunderstorm": "⛈",
    "moderate rain": "🌧",
    "heavy rain": "🌧",
    "moderate or heavy rain shower": "🌧",
    "torrential rain shower": "🌧",
    "light drizzle": "🌦",
    "patchy light drizzle": "🌦",
    "light sleet": "🌨",
    "light snow": "🌨",
    "moderate snow": "🌨",
    "heavy snow": "🌨",
    "blowing snow": "🌨",
    "patchy light snow": "🌨",
    "patchy moderate snow": "🌨",
    "drizzle": "🌦",
    "sleet": "🌨",
    "snow": "🌨",
    "thunder": "⛈",
    "rain": "🌧",
}


def get_icon(desc: str) -> str:
    desc = desc.lower()
    for key, icon in ICONS.items():
        if key in desc:
            return icon
    return "\ue318"


def get_weather(city: str):
    url = f"https://wttr.in/{urllib.parse.quote(city)}?format=j1"
    try:
        with urllib.request.urlopen(url, timeout=10) as r:
            data = json.loads(r.read().decode())
    except Exception as e:
        return {"text": "N/A", "alt": "error", "tooltip": str(e), "class": "error"}

    cc = data["current_condition"][0]
    temp = cc["temp_C"]
    desc = cc["weatherDesc"][0]["value"]
    feels = cc["FeelsLikeC"]
    humidity = cc["humidity"]
    wind = cc["windspeedKmph"]
    icon = get_icon(desc)

    return {
        "text": f"{icon} {temp}°C",
        "alt": desc,
        "tooltip": (
            f"<b>{city}</b>\n"
            f"{desc}\n"
            f"Temp: {temp}°C (feels like {feels}°C)\n"
            f"Humidity: {humidity}%\n"
            f"Wind: {wind} km/h"
        ),
        "class": "weather",
    }


if __name__ == "__main__":
    city = sys.argv[1] if len(sys.argv) > 1 else CITY
    print(json.dumps(get_weather(city)))
