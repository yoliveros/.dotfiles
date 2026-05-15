#!/usr/bin/env python3

import json
import sys
import urllib.request

def get_weather(city: str):
    url = f"https://wttr.in/{city}?format=%c|%t|%C|%f|%h|%w"
    try:
        with urllib.request.urlopen(url, timeout=10) as r:
            raw = r.read().decode().strip()
    except Exception as e:
        return {"text": "N/A", "alt": "error", "tooltip": str(e), "class": "error"}

    parts = raw.split("|")
    icon = parts[0] if len(parts) > 0 else ""
    temp = parts[1].strip() if len(parts) > 1 else "N/A"
    desc = parts[2] if len(parts) > 2 else ""
    feels = parts[3].strip() if len(parts) > 3 else "N/A"
    humidity = parts[4] if len(parts) > 4 else "N/A"
    wind = parts[5] if len(parts) > 5 else "N/A"

    return {
        "text": f"{icon}{temp}",
        "alt": desc,
        "tooltip": (
            f"<b>{city}</b>\n"
            f"{desc}\n"
            f"Temp: {temp} (feels like {feels})\n"
            f"Humidity: {humidity}\n"
            f"Wind: {wind}"
        ),
        "class": "weather",
    }


if __name__ == "__main__":
    city = sys.argv[1] if len(sys.argv) > 1 else CITY
    print(json.dumps(get_weather(city)))
