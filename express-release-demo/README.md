# Express Release Demo

This folder demonstrates the third-part deployment pipeline exercise with a small Node.js/Express app.

## GitHub Actions setup

The workflow lives at `.github/workflows/release-node-app.yml` in the repository root. It builds this folder and pushes:

```text
DOCKERHUB_USERNAME/express-release-demo:latest
DOCKERHUB_USERNAME/express-release-demo:<git-sha>
```

Add these GitHub repository settings before pushing to `main`:

- Repository variable: `DOCKERHUB_USERNAME`
- Repository secret: `DOCKERHUB_TOKEN`

Use a Docker Hub access token, not your Docker Hub password.

## Local run

Copy the example environment file and edit the username:

```bash
cp .env.example .env
```

Run the app and Watchtower:

```bash
docker compose up -d
```

Open:

```text
http://localhost:8080
```

## Pipeline demo steps

1. Change the visible message in `index.js`, or set a different `APP_MESSAGE`.
2. Commit and push to the `main` branch on GitHub.
3. Wait for GitHub Actions to build and push the image to Docker Hub.
4. Wait for the Watchtower poll interval.
5. Reload `http://localhost:8080` and confirm the new version is visible.

Watchtower uses the `nickfedor/watchtower` image from the exercise link and is configured with a short 30-second interval for demonstration purposes.
