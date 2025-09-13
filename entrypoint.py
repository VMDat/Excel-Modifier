import os
import sys
from streamlit.web.cli import main as stcli
import streamlit.runtime.scriptrunner.magic_funcs

def resource_path(*parts):
    if getattr(sys, "frozen", False) and hasattr(sys, "_MEIPASS"):
        base = sys._MEIPASS
    else:
        base = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    return os.path.join(base, *parts)

def main():
    os.environ.setdefault("STREAMLIT_SERVER_PORT", "8505")
    os.environ.setdefault("STREAMLIT_SERVER_ADDRESS", "localhost")
    os.environ.setdefault("STREAMLIT_SERVER_HEADLESS", "false")

    app_path = resource_path("src", "app.py")
    sys.argv = ["streamlit", "run", app_path]
    stcli()

if __name__ == "__main__":
    main()