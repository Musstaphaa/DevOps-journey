# محطات حل المشاكل (Troubleshooting Log)
## Day 1: Docker & Python Dependencies
1. **YAML Parsing Error:** Fixed by ensuring correct strict indentation in `docker-compose.yml`.
2. **Dockerfile COPY Error:** Added the missing destination dot (`.`) in the build steps.
3. **Python Indentation:** Corrected strict space indentation in `app.py`.
4. **Dependency Hell (ImportError):** Pinned `Flask==2.2.2` and `Werkzeug==2.2.2` in `requirements.txt` to resolve compatibility issues.
